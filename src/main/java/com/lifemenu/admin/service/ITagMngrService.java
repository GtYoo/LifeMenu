package com.lifemenu.admin.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lifemenu.admin.vo.ConditionParamVo;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-17
 * 	Version 	: 1.0.1
 * 
 * 	태그, 태그 조회수 관리
 * 2021-06-09-0.0.1 	- 최초 작성
 * 2021-06-28-0.0.2 	- 연동 확인 및 등록, 수정, 삭제 기능 추가
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-17-1.0.1 	- 조건 조회 변경
 */

public interface ITagMngrService {
	
	// 전체 태그 목록 조건 조회
	String selectMultiTagMngrByCondition(Model model, ConditionParamVo conditionParamVo);
	
	// 태그 등록
	String insertTagMngr(RedirectAttributes redirectAttributes, String tagName, MultipartFile[] uploadFile) throws Exception;
	
//	// 태그 수정 (사용 x)
//	String updateTagMngr(RedirectAttributes redirectAttributes, TagDto tagDto, MultipartFile[] imageAdres, int imageAdresIndex, PageParamVo pageParamVo) throws Exception;
	
	// 태그 삭제
	String deleteTagMngr(RedirectAttributes redirectAttributes, String tagCode) throws Exception;
	
}
