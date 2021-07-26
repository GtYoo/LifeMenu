package com.lifemenu.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lifemenu.admin.dao.mebc.ITagDaoMebc;
import com.lifemenu.admin.dao.mebc.ITagReadCntDaoMebc;
import com.lifemenu.admin.dao.qebc.ITagDaoQebc;
import com.lifemenu.admin.dao.qebc.ITagMngrDaoQebc;
import com.lifemenu.admin.dto.TagDto;
import com.lifemenu.admin.dto.TagMngrDto;
import com.lifemenu.admin.dto.TagReadCntDto;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.cmmn.IAdminCommons;
import com.lifemenu.cmmn.IUploadCommon;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-19
 * 	Version 	: 1.0.1
 * 
 * 	태그, 태그 조회수 관리
 * 2021-06-19-0.0.2 	- 서비스 명세 및 확인
 * 2021-06-28-0.0.3 	- 연동 확인 등록, 수정, 삭제 기능 추가
 * 2021-06-30-0.0.4 	- ITagReadCntDaoMebc.java pk조회 반환타입 변경
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-19-1.0.1 	- 조건 조회 변경
 */

@Service("tagMngrService")
public class TagMngrServiceImpl implements ITagMngrService {

	@Autowired
	private ITagDaoMebc tagDaoMebc;
	@Autowired
	private ITagDaoQebc tagDaoQebc;
	@Autowired
	private ITagReadCntDaoMebc tagReadCntDaoMebc;
	@Autowired
	private ITagMngrDaoQebc tagMngrDaoQebc;
	@Autowired
	private IUploadCommon uploadCommon;
	@Autowired
	private IAdminCommons adminCommons;
	
	private static final String VIEW_PAGE 		= "admin/tag/tagMngr";
	private static final String DEFAULT_START 	= "1";
	private static final String DEFAULT_CNT 	= "8";
	
	@Override
	public String selectMultiTagMngrByCondition(Model model, ConditionParamVo conditionParamVo) {

		// sql에 맞게 변경
		adminCommons.convertCondition(conditionParamVo);
		if("TAG_CODE".equals(conditionParamVo.getConditionType())) {
			conditionParamVo.setConditionType("T.TAG_CODE");
		}
		System.out.println("conditionParamVo= "+conditionParamVo.toString());
		List<TagMngrDto> list = tagMngrDaoQebc.selectMultiTagMngrByCondition(conditionParamVo);
		// '\\'를 '/'로 변경
		for(TagMngrDto tagMngrDto : list) {
			String changedAdres = uploadCommon.changeAdres(tagMngrDto.getImageAdres());
			tagMngrDto.setImageAdres(changedAdres);
		}
		int totalCnt = tagMngrDaoQebc.selectTagMngrByConditionTotalCount(conditionParamVo);
		
		model.addAttribute("LIST", list);
		model.addAttribute("TOTAL_CNT", totalCnt);
		model.addAttribute("CONDITION_PARAM", conditionParamVo);
		
		return VIEW_PAGE;
		
	}
	
	@Override
	@Transactional
	public String insertTagMngr(RedirectAttributes redirectAttributes, String tagName, MultipartFile[] uploadFile) throws Exception {
		
		TagDto tagDto = new TagDto();
		
		// 1. 태그명이 중복되는 지 확인
		String isTagNm = tagDaoQebc.selectTagCodeByName(tagName);
		if(isTagNm != null) {
			throw new Exception();
		}
		tagDto.setTagNm(tagName);
		
		// 2. 태그 코드 생성
		String maxTagCode = tagMngrDaoQebc.selectMaxTagCode();
		if(maxTagCode == null) {
			tagDto.setTagCode("0001");
		}
		else {
			tagDto.setTagCode(String.format("%04d", (Integer.parseInt(maxTagCode) + 1)));
		}
		
		// 3. 태그 이미지 복사 및 Dto에 경로 추가
		List<String> imageAdres = uploadCommon.uploadAjax(uploadFile, "c:/img/tag");
		tagDto.setImageAdres(imageAdres.get(0));
		
		// 3. insert 태그
		System.out.println(tagDto.toString());
		tagDaoMebc.insertTag(tagDto);
		
		// 4. insert 태그 조회수
		TagReadCntDto tagReadCntDto = tagReadCntDaoMebc.selectOneTagReadCnt(tagDto.getTagCode());
		if (tagReadCntDto != null) {
			throw new Exception();
		}
		tagReadCntDaoMebc.insertTagReadCnt(tagDto.getTagCode());
		
		redirectAttributes.addAttribute("MSG", "태그가 등록되었습니다");
		redirectAttributes.addAttribute("start", DEFAULT_START);
		redirectAttributes.addAttribute("cnt", DEFAULT_CNT);
		
		return "redirect:/tagMngrCondition.do";
		
	}
	
//	@Override
//	@Transactional
//	public String updateTagMngr(RedirectAttributes redirectAttributes, TagDto tagDto, MultipartFile[] imageAdres, int imageAdresIndex, PageParamVo pageParamVo) throws Exception {
//		
//		System.out.println("update: "+tagDto.toString());
//		
//		List<String> imageAdresList = uploadCommon.uploadAjax(imageAdres, "c:/img/tag");
//		tagDto.setImageAdres(imageAdresList.get(imageAdresIndex));
//		
//		TagDto isTag = tagDaoMebc.selectOneTag(tagDto.getTagCode());
//		
//		if(isTag == null) {
//			throw new Exception();
//		}
//		
//		System.out.println(tagDto.toString());
//		tagDaoMebc.updateTag(tagDto);
//		
//		redirectAttributes.addAttribute("MSG", "태그가 수정되었습니다");
//		redirectAttributes.addAttribute("start", pageParamVo.getStart());
//		redirectAttributes.addAttribute("cnt", pageParamVo.getCnt());
//		
//		return "redirect:/tagMngrCondition.do";
//		
//	}
	
	@Override
	@Transactional
	public String deleteTagMngr(RedirectAttributes redirectAttributes, String tagCode) throws Exception {
		
		// 태그 삭제 처리 시, 관리자와 상의할 것
		// 판매자가 등록한 태그 처리할 것.
		System.out.println("delete: "+tagCode);
		
		String msg = "";
		// 1. 태그 검색 테이블에 존재하는 경우, 삭제 불가
		int cnt = tagMngrDaoQebc.selectTagSearchCount(tagCode);
		if (cnt > 0) {
			msg = "판매자가 사용중인 태그입니다";
		}
		else {
			// 2. 태그 조회수 삭제
			TagReadCntDto isTagReadCnt = tagReadCntDaoMebc.selectOneTagReadCnt(tagCode);
			if(isTagReadCnt == null) {
				throw new Exception();
			}
			tagReadCntDaoMebc.deleteTagReadCnt(tagCode);
			
			// 3. 태그 삭제
			TagDto isTag = tagDaoMebc.selectOneTag(tagCode);
			if(isTag == null) {
				throw new Exception();
			}
			tagDaoMebc.deleteTag(tagCode);
			
			msg = "태그가 삭제되었습니다";
		}
		
		
		redirectAttributes.addAttribute("MSG", msg);
		redirectAttributes.addAttribute("start", DEFAULT_START);
		redirectAttributes.addAttribute("cnt", DEFAULT_CNT);
		
		return "redirect:/tagMngrCondition.do";
		
	}
	
}
