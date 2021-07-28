package com.lifemenu.dao.mebc;

import com.lifemenu.dto.RefndDto;

public interface IRefndDaoMebc {
	
	//환불조회
	RefndDto selectOneRefnd(String setleCode);
	
	//환불
	void insertRefnd(RefndDto refndDto);
	
	//관리자 환불승인
	void updateRefnd(RefndDto refndDto);
}
