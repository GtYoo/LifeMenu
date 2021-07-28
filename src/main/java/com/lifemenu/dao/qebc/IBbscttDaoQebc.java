package com.lifemenu.dao.qebc;

import java.util.List;

import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.dto.BbscttDto;

public interface IBbscttDaoQebc {

	
	List<BbscttDto> selectMultiBbsctt(PageParamVo pageParamvo);
	
	//전체글 수
	int selectBbsTotalCount();
	
	//게시판 마지막 데이터
	BbscttDto selectOneBbscttNoRownum();
	
	//답글조회
	List<BbscttDto> selectMultiComent(String upBbscttNo);
	
	//답글수
	int selectComentCount(String upBbscttNo);
}
