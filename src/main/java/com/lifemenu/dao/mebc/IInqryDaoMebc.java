package com.lifemenu.dao.mebc;

import org.apache.ibatis.annotations.Param;

import com.lifemenu.dto.InqryDto;

public interface IInqryDaoMebc {
	
	InqryDto selectOneInqry(String mngrInqryNo);


	void inqryUpdate(InqryDto inqryDto);
	
	//새글등록
	void insertInqry(InqryDto inqryDto);
	
	//댓글등록
	void insertComent(InqryDto inqryDto);
	
	//본글삭제
	void deleteInqry(String mngrInqryNo);
	
	//본글댓글삭제
	void deleteInqryComent(String mngrAnswerNo);
	
	//댓글삭제
	void deleteComent(@Param("mngrAnswerNo") String mngrAnswerNo, @Param("mngrInqryNo") String mngrInqryNo);


}
