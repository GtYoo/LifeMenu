package com.lifemenu.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lifemenu.admin.dao.mebc.IMngrInqryDaoMebc;
import com.lifemenu.admin.dao.qebc.IMngrInqryDaoQebc;
import com.lifemenu.admin.dto.InqryMngrDto;
import com.lifemenu.admin.dto.MngrInqryDto;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.cmmn.IAdminCommons;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-15
 * 	Version 	: 1.0.1
 * 
 * 	관리자 문의
 * 2021-06-18-0.0.2 	- 관리자 문의 서비스 명세 및 확인
 * 2021-06-26-0.0.3 	- 관리자문의 상세 조회
 * 2021-06-29-0.0.4 	- 상세조회 조건 변경
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-15-1.0.1 	- 조건 조회 수정
 */

@Service("mngrInqryService")
public class MngrInqryServiceImpl implements IMngrInqryService {

	@Autowired
	private IMngrInqryDaoMebc mngrInqryDaoMebc;
	@Autowired
	private IMngrInqryDaoQebc mngrInqryDaoQebc;
	@Autowired
	private IAdminCommons adminCommons;
	
	private static final String VIEW_PAGE 			= "admin/inqry/inqryMngr";
	private static final String VIEW_DETAIL_PAGE 	= "admin/inqry/inqryDetail";
	private static final String DEFAULT_START 		= "1";
	private static final String DEFAULT_CNT 		= "8";
	
	
	// 전체 관리자 문의 목록 조건조회
	@Override
	public String selectMultiMngrInqryByCondition(Model model, ConditionParamVo conditionParamVo) {

		// sql에 맞게 수정
		adminCommons.convertCondition(conditionParamVo);
		if("MBER_CODE".equals(conditionParamVo.getConditionType())) {
			conditionParamVo.setConditionType("I.MBER_CODE");
		}
		
		List<InqryMngrDto> mngrInqryList = mngrInqryDaoQebc.selectMultiMngrInqryByCondition(conditionParamVo);
		int totalCnt = mngrInqryDaoQebc.selectMngrInqryByConditionTotalCount(conditionParamVo);
		
		model.addAttribute("LIST", mngrInqryList);
		model.addAttribute("TOTAL_CNT", totalCnt);
		model.addAttribute("CONDITION_PARAM", conditionParamVo);
		
		return VIEW_PAGE;
		
	}

	// 관리자 문의 상세 조회
	@Override
	public String selectOneMngrInqry(Model model, String mngrInqryNo, PageParamVo pageParamVo) {

		MngrInqryDto mngrInqryDto = mngrInqryDaoMebc.selectOneMngrInqry(mngrInqryNo);
		
		model.addAttribute("INQRY", mngrInqryDto);
		model.addAttribute("START", pageParamVo.getStart());
		model.addAttribute("CNT", pageParamVo.getCnt());
		
		return VIEW_DETAIL_PAGE;
		
	}
	
	// 관리자 문의 답변 등록
	@Override
	@Transactional
	public String insertMngrAnswer(RedirectAttributes redirectAttributes, MngrInqryDto mngrAnswerDto) throws Exception {

		String msg = "";
		
		// 1. 문의 Dto의 PK
		String inqryNo = mngrAnswerDto.getMngrInqryNo();
		
		// 2. 답변 Dto의 PK 생성
		String maxMngrInqryNo = String.valueOf(mngrInqryDaoQebc.selectMaxMngrInqryNo());
		if(maxMngrInqryNo == null) {
			mngrAnswerDto.setMngrAnswerNo("0001");
		}
		else {
			mngrAnswerDto.setMngrAnswerNo(String.format("%04d", (Integer.parseInt(maxMngrInqryNo) + 1)));
		}
		
		// 3. 답변 Dto 등록
		MngrInqryDto isMngrAnswer = mngrInqryDaoMebc.selectOneMngrInqry(mngrAnswerDto.getMngrInqryNo());
		if (isMngrAnswer != null) {
			throw new Exception();
		}
		mngrInqryDaoMebc.insertMngrInqry(mngrAnswerDto);

		// 4. 문의 Dto 업데이트
		MngrInqryDto isMngrInqry = mngrInqryDaoMebc.selectOneMngrInqry(inqryNo);
		if (isMngrInqry == null) {
			throw new Exception();
		}
		isMngrInqry.setMngrAnswerNo(mngrAnswerDto.getMngrInqryNo());
		mngrInqryDaoMebc.updateMngrInqry(isMngrInqry);

		msg = " 관리자 답변이 등록되었습니다.";
		System.out.println("msg = "+msg);

		redirectAttributes.addAttribute("start", DEFAULT_START);
		redirectAttributes.addAttribute("cnt", DEFAULT_CNT);
		redirectAttributes.addAttribute("MSG", msg);
		
		return "redirect:/mngrInqryCondition.do";
		
	}

	@Override
	@Transactional
	public String updateMngrAnswer(RedirectAttributes redirectAttributes, MngrInqryDto mngrInqryDto, PageParamVo pageParamVo) throws Exception {

		String msg = "";
		
		MngrInqryDto isMngrInqry = mngrInqryDaoMebc.selectOneMngrInqry(mngrInqryDto.getMngrInqryNo());
		if (isMngrInqry == null) {
			throw new Exception();
		}
		
		mngrInqryDaoMebc.updateMngrInqry(mngrInqryDto);
		
		msg = " 관리자 답변이 수정되었습니다.";
		System.out.println("msg = "+msg);

		redirectAttributes.addAttribute("start", pageParamVo.getStart());
		redirectAttributes.addAttribute("cnt", pageParamVo.getCnt());
		redirectAttributes.addAttribute("MSG", msg);
		
		return "redirect:/mngrInqryDetail.do";
				
	}

	@Override
	@Transactional
	public String deleteMngrAnswer(RedirectAttributes redirectAttributes, String mngrInqryNo) throws Exception {

		String msg = "";
		
		// 1. 문의의 답변번호 제거
		MngrInqryDto isMngrInqry = mngrInqryDaoQebc.selectOneMngrInqryByMngrAnswerNo(mngrInqryNo);
		if(isMngrInqry == null) {
			throw new Exception();
		}
		
		isMngrInqry.setMngrAnswerNo(null);
		mngrInqryDaoMebc.updateMngrInqry(isMngrInqry);
		
		// 2. 관리자 답변 제거
		MngrInqryDto isMngrAnswer = mngrInqryDaoMebc.selectOneMngrInqry(mngrInqryNo);
		if (isMngrAnswer == null) {
			throw new Exception();
		}
		
		mngrInqryDaoMebc.deleteMngrInqry(mngrInqryNo);
		
		msg = " 관리자 문의와 답변이 삭제되었습니다.";
		System.out.println("msg = "+msg);

		redirectAttributes.addAttribute("start", DEFAULT_START);
		redirectAttributes.addAttribute("cnt", DEFAULT_CNT);
		redirectAttributes.addAttribute("MSG", msg);
		
		return "redirect:/mngrInqryCondition.do";
				
	}

}
