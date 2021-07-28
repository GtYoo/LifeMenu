package com.lifemenu.dao.qebc;

import com.lifemenu.dto.MberDto;

public interface ICheckDaoQebc {

    public MberDto selectOneIdCheck(String id);//회원가입 아이디체크용
    
    public MberDto selectOneNcnmCheck(String ncnm);//회원가입 닉네임체크용
    
    public MberDto selectOneEmailCheck(String email);//회원가입 이메일체크용

	MberDto selectOnePw(String code, String pw);  //회원탈퇴 할때 비밀번호 확인
}
