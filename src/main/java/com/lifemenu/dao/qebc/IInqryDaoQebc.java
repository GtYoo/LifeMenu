package com.lifemenu.dao.qebc;

import java.util.List;

import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.dto.InqryDto;

public interface IInqryDaoQebc {

	
	List<InqryDto> selectMultiInqry(PageParamVo pageParamvo);
	
	//전체글 수
	int selectBbsTotalCount();
	
	//문의 게시글 마지막 데이터
	InqryDto selectOneInqryNoRownum();
	
	//답글조회
	List<InqryDto> selectMultiComent(String mngrAnswerNo);
	
	//답글수
	int selectComentCount(String mngrAnswerNo);

}
