package com.lifemenu.dao.mebc;

import com.lifemenu.dto.SetleDto;


public interface ISetleDaoMebc {
	
	//결제
	void insertSetle(SetleDto setleDto);
	
	//결제조회
	SetleDto selectOneSetle(String setleCode);
	
	//구매확정
	void updatePurchsDcsn(SetleDto setleDto);
	
	//결제삭제
	void deleteSetle(String setleCode);
	
	//환불신청여부
	void updateRefndReqst(SetleDto setleDto);

}
