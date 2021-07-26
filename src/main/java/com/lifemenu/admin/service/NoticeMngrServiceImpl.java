package com.lifemenu.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lifemenu.admin.dao.mebc.INoticeMngrDaoMebc;
import com.lifemenu.admin.dao.qebc.INoticeMngrDaoQebc;
import com.lifemenu.admin.dto.NoticeMngrDto;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.cmmn.IAdminCommons;
import com.lifemenu.dto.NoticeDto;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-17
 * 	Version 	: 1.0.1
 * 
 * 	공지사항
 * 2021-06-16-0.0.2 	- 서비스 명세 및 DAO연결 확인
 * 2021-06-26-0.0.3 	- 연동 확인 및 등록, 수정, 삭제 추가
 * 2021-06-28-0.0.4 	- 제목+내용 조회 추가
 * 2021-07-01-0.0.5 	- 페이지 처리
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-17-1.0.1 	- 조건 조회 변경
 */

@Service("noticeMngrService")
public class NoticeMngrServiceImpl implements INoticeMngrService {

	@Autowired
	private INoticeMngrDaoMebc noticeMngrDaoMebc;
	@Autowired
	private INoticeMngrDaoQebc noticeMngrDaoQebc;
	@Autowired
	private IAdminCommons adminCommons;
	
	private static final String VIEW_PAGE 			= "admin/notice/noticeMngr";
	private static final String VIEW_DETAIL_PAGE 	= "admin/notice/noticeDetail";
	private static final String DEFAULT_START 		= "1";
	private static final String DEFAULT_CNT 		= "8";
	
	// 전체 공지사항 목록 조건 조회
	@Override
	public String selectMultiNoticeMngrByCondition(Model model, ConditionParamVo conditionParamVo) {

		adminCommons.convertCondition(conditionParamVo);
		
		List<NoticeMngrDto> noticeMngrList = noticeMngrDaoQebc.selectMultiNoticeByCondition(conditionParamVo);
		int totalCnt = noticeMngrDaoQebc.selectNoticeByConditionTotalCount(conditionParamVo);
		
		model.addAttribute("LIST", noticeMngrList);
		model.addAttribute("TOTAL_CNT", totalCnt);
		model.addAttribute("CONDITION_PARAM", conditionParamVo);
		
		return VIEW_PAGE;
		
	}
	
	// 관리자 문의 상세 조회
	@Override
	public String selectOneNoticeMngr(Model model, String bbscttNo, PageParamVo pageParamVo) {

		NoticeDto noticeDto = noticeMngrDaoMebc.selectOneNotice(bbscttNo);
		
		model.addAttribute("NOTICE", noticeDto);
		model.addAttribute("START", pageParamVo.getStart());
		model.addAttribute("CNT", pageParamVo.getCnt());
		
		return VIEW_DETAIL_PAGE;
		
	}
	
	// 공지사항 등록
	@Override
	@Transactional
	public String insertNoticeMngr(RedirectAttributes redirectAttributes, NoticeDto noticeDto) throws Exception {

		String msg = "";
		String maxBbscttNo = noticeMngrDaoQebc.selectMaxBbscttNo();
		if (maxBbscttNo == null) {
			noticeDto.setBbscttNo("0001");
		}
		else {
			noticeDto.setBbscttNo(String.format("%04d", (Integer.parseInt(maxBbscttNo) + 1)));
		}
		System.out.println("insertNoticeDto= "+noticeDto.toString());
		
		NoticeDto isNotice = noticeMngrDaoMebc.selectOneNotice(noticeDto.getBbscttNo());
		if (isNotice != null) {
			throw new Exception();
		}
		
		noticeMngrDaoMebc.insertNotice(noticeDto);
		msg = "공지사항이 정상 등록되었습니다";
		
		redirectAttributes.addAttribute("MSG", msg);
		redirectAttributes.addAttribute("start", DEFAULT_START);
		redirectAttributes.addAttribute("cnt", DEFAULT_CNT);
		
		return "redirect:/noticeMngrCondition.do";
		
	}
	
	@Override
	@Transactional
	public String updateNoticeMngr(RedirectAttributes redirectAttributes, NoticeDto noticeDto, PageParamVo pageParamVo) throws Exception {

		String msg = "";
		NoticeDto isNotice = noticeMngrDaoMebc.selectOneNotice(noticeDto.getBbscttNo());
		if (isNotice == null) {
			throw new Exception();
		}
		
		noticeMngrDaoMebc.updateNotice(noticeDto);
		msg = "공지사항이 수정되었습니다";
		
		redirectAttributes.addAttribute("MSG", msg);
		redirectAttributes.addAttribute("bbscttNo", noticeDto.getBbscttNo());
		redirectAttributes.addAttribute("start", pageParamVo.getStart());
		redirectAttributes.addAttribute("cnt", pageParamVo.getCnt());
		
		return "redirect:/noticeMngrDetail.do";
		
	}
	
	@Override
	@Transactional
	public String deleteNoticeMngr(RedirectAttributes redirectAttributes, String bbscttNo) throws Exception {

		String msg = "";
		NoticeDto isNotice = noticeMngrDaoMebc.selectOneNotice(bbscttNo);
		if (isNotice == null) {
			throw new Exception();
		}
		
		noticeMngrDaoMebc.deleteNotice(bbscttNo);
		msg = "공지사항이 삭제되었습니다";
		
		redirectAttributes.addAttribute("MSG", msg);
		redirectAttributes.addAttribute("start", DEFAULT_START);
		redirectAttributes.addAttribute("cnt", DEFAULT_CNT);
		
		return "redirect:/noticeMngrCondition.do";
		
	}
	
}
