package com.lifemenu.admin.service;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.lifemenu.admin.dao.qebc.IVochrMngrDaoQebc;
import com.lifemenu.admin.dto.SetleMngrDto;
import com.lifemenu.admin.dto.VochrMngrDto;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.cmmn.IAdminCommons;
import com.lifemenu.dao.mebc.IVoucherDaoMebc;
import com.lifemenu.dto.VoucherDto;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-17
 * 	Version 	: 1.0.1
 * 
 * 	식사권, 예약, 결제, 환불 관리
 * 2021-06-09-0.0.1 	- 최초 작성
 * 2021-06-29-0.0.2 	- 연동 확인
 * 2021-07-01-0.0.3 	- 페이지 처리
 * 2021-07-01-0.0.4 	- 회원 검색조건 처리
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-17-1.0.1 	- 조건 조회 변경
 */

@Service("vochrMngrService")
public class VochrMngrServiceImpl implements IVochrMngrService {

	@Autowired
	private IVoucherDaoMebc voucherDaoMebc;
	@Autowired
	private IVochrMngrDaoQebc vochrMngrDaoQebc;
	@Autowired
	private IAdminCommons adminCommons;
	
	private static final String VIEW_PAGE 			= "admin/vochr/vochrMngr";
	private static final String VIEW_DETAIL_PAGE 	= "admin/vochr/vochrDetail";
	
	@Override
	public String selectOneVochrMngr(Model model, String vochrCode, PageParamVo pageParamVo) {
		
		System.out.println("vochrCode = "+vochrCode);
		// 식사권, 판매자 정보
		VochrMngrDto vochrMngrDto = vochrMngrDaoQebc.selectOneVochrMngr(vochrCode);
		System.out.println(vochrMngrDto);
		// 결제 정보
		int setleCnt = vochrMngrDaoQebc.selectSetleByConditionTotalCount(vochrCode);
		int currentNo = 1;
		System.out.println(currentNo+"/"+setleCnt);
		
		model.addAttribute("VOCHR", vochrMngrDto);
		model.addAttribute("CURRENT", currentNo);
		model.addAttribute("SETLE_CNT", setleCnt);
		model.addAttribute("START", pageParamVo.getStart());
		model.addAttribute("CNT", pageParamVo.getCnt());
		
		return VIEW_DETAIL_PAGE;
		
	}
	
	@Override
	public String selectOneSetleMngrAjax(String vochrCode, int currentNo) {
		JSONObject jsonObj = new JSONObject();
		
		SetleMngrDto setleMngrDto = vochrMngrDaoQebc.selectOneSetle(vochrCode, currentNo);
		int setleCnt = vochrMngrDaoQebc.selectSetleByConditionTotalCount(vochrCode);
		if (setleCnt == 0) {
			jsonObj.put("SETLE_CNT", setleCnt);
			return jsonObj.toString();
		}
		
		jsonObj.put("setleCode", setleMngrDto.getSetleCode());
		jsonObj.put("purchaserCode", setleMngrDto.getMberCode());
		jsonObj.put("setlePc", setleMngrDto.getSetlePc());
		jsonObj.put("setleDt", setleMngrDto.getSetleDt());
		jsonObj.put("setleAt", setleMngrDto.getSetleAt());
		jsonObj.put("refndReqstAt", setleMngrDto.getRefndReqstAt());
		jsonObj.put("purchsDcsnAt", setleMngrDto.getPurchsDcsnAt());
		jsonObj.put("SETLE_CNT", setleCnt);
		jsonObj.put("CURRENT", currentNo);
		System.out.println("jsonObj = "+jsonObj.toString());
		
		return jsonObj.toString();
	}

	@Override
	public String selectMultiVochrByCondition(Model model, ConditionParamVo conditionParamVo) {

		// sql 쿼리로 변경
		adminCommons.convertCondition(conditionParamVo);
		if("MBER_CODE".equals(conditionParamVo.getConditionType())) {
			conditionParamVo.setConditionType("V.MBER_CODE");
		}
		else if("MBER_NCNM".equals(conditionParamVo.getConditionType())) {
			conditionParamVo.setConditionType("M.MBER_NCNM");
		}
		else if("MBER_RLNM".equals(conditionParamVo.getConditionType())) {
			conditionParamVo.setConditionType("M.MBER_RLNM");
		}
		
		System.out.println(conditionParamVo.toString());
		List<VochrMngrDto> vochrList = vochrMngrDaoQebc.selectMultiVochrByCondition(conditionParamVo);
		int totalCnt = vochrMngrDaoQebc.selectVochrMngrByConditionTotalCount(conditionParamVo);
		System.out.println(vochrList.toString());
		
		model.addAttribute("LIST", vochrList);
		model.addAttribute("TOTAL_CNT", totalCnt);
		model.addAttribute("CONDITION_PARAM", conditionParamVo);
		
		return VIEW_PAGE;
		
	}

	@Override
	@Transactional
	public String blindVochr(String vochrCode) throws Exception {

		System.out.println("vochrCode = "+vochrCode);
		// [방안1]
		// 식사권 삭제 절차
		// 1. 예약된 건이 있는 지 확인
		//   1.1. 예약 없을 때, 식사권 삭제 처리
		//   1.2. 예약 있을 때, 결제된 건이 있는 지 확인
		//     1.2.1. 결제 없을 때, 예약 취소 알림 발송 후, 예약 및 식사권 삭제 처리
		//     1.2.2. 결제 있을 때, 환불된 건이 있는 지 확인
		//       1.2.2.1. 환불 없을 때, 환불하고 예약 취소 알림 발송 후 , 결제 및 예약 및 식사권 삭제 처리
		//       1.2.2.2. 환불 있을 때, 환불 처리 완료 후, 1.2.2.1. 과정
		//       1.2.2.3. 환불한 경우 자동 결제 및 예약이 취소되므로 그 외의 경우, 예외처리
		// [방안2]
		// 거래 가능 여부 항목(DELNG_AT)을 update처리
		VoucherDto isVochr = voucherDaoMebc.selectOneVoucher(vochrCode);
		if (isVochr == null) {
			throw new Exception();
		}

		String msg;
		if('Y' == isVochr.getDelngAt()) {
			isVochr.setDelngAt('N'); // 거래 불가능으로 처리, [미구현]추가로 알림 발송할 것!
			msg = vochrCode + "식사권이 블라인드 처리 되었습니다";
		}
		else {
			isVochr.setDelngAt('Y'); // 거래 가능으로 처리, [미구현]추가로 알림 발송할 것!
			msg = vochrCode + "식사권이 블라인드 해제 되었습니다";
		}
		voucherDaoMebc.updateVoucher(isVochr); 
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("delngAt", isVochr.getDelngAt());
		jsonObj.put("MSG", msg);
		System.out.println(jsonObj.toString());
		
		return jsonObj.toString();
		
	}
		
}
