package com.lifemenu.dao.mebc;

import org.apache.ibatis.annotations.Param;

import com.lifemenu.dto.BbscttDto;

public interface IBbscttDaoMebc {
	
	BbscttDto selectOneBbsctt(String bbscttNo);


	void bbscttUpdate(BbscttDto bbscttDto);
	
	//새글등록
	void insertBbsctt(BbscttDto bbscttDto);
	
	//댓글등록
	void insertComent(BbscttDto bbscttDto);
	
	//본글삭제
	void deleteBbsctt(String bbscttNo);
	
	//본글댓글삭제
	void deleteBbscttComent(String upBbscttNo);
	
	//댓글삭제
	void deleteComent(@Param("upBbscttNo") String upBbscttNo, @Param("bbscttNo") String bbscttNo);
}
