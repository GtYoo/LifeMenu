package com.lifemenu.dao.mebc;

import com.lifemenu.dto.MberDto;

public interface ILoginAfterDaoMebc {
	
	MberDto selectOneMber(String code);	//회원 단건조회
	
    void updateMber(MberDto mberDto);	//회원정보 수정

    void updateScenc(String code);	//회원 탈퇴여부 수정

}
