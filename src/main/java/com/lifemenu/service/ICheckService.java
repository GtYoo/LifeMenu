package com.lifemenu.service;

import com.lifemenu.dto.MberDto;

public interface ICheckService {
	
    public MberDto selectOneIdCheck(String id);//회원가입 아이디 체크용
    
    public MberDto selectOneNcnmCheck(String ncnm);//회원가입 닉네임 체크용
    
    public MberDto selectOneEmailCheck(String email);//회원가입 이메일 체크용

    public MberDto selectOnePw(String code, String pw);	//비밀번호 맞는지 체크용

}
