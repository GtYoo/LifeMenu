package com.lifemenu.admin.dao.qebc;

import java.util.List;

import com.lifemenu.admin.dto.TagDto;

public interface ITagDaoQebc {
	
	// 태그 맥스코드 조회
	String selectMaxTagCode();

	// 태그명으로 태그코드 찾기
	String selectTagCodeByName(String tagNm);
	
	// 태그 목록 조회
	List<TagDto> selectMultiTag();
	
	// 회원코드로 가지고 있는 태그 목록 조회
	List<String> selectMultiTagSearch(String mberCode);
	
	// 태그검색 자동완성용
	List<String> selectMultiTagName();
	
}
