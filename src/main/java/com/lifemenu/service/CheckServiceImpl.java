package com.lifemenu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lifemenu.dao.qebc.ICheckDaoQebc;
import com.lifemenu.dto.MberDto;

@Service("checkService")	
public class CheckServiceImpl implements ICheckService {

	@Autowired
	private ICheckDaoQebc checkDaoQebc;

	@Override
	public MberDto selectOneIdCheck(String id){// 아이디체크(회원가입) CheckController에서 부름
		MberDto dto = checkDaoQebc.selectOneIdCheck(id);
		return dto;
	}
	@Override
	public MberDto selectOneNcnmCheck(String ncnm){// 닉네임체크(회원가입) CheckController에서 부름
		MberDto dto = checkDaoQebc.selectOneNcnmCheck(ncnm);
		return dto;
	}
	@Override
	public MberDto selectOneEmailCheck(String email){// 이메일체크(회원가입) CheckController에서 부름
		MberDto dto = checkDaoQebc.selectOneEmailCheck(email);
		return dto;
	}
	
	@Override
	public MberDto selectOnePw(String code, String pw){	//로그인 된 상태에서 비밀번호 확인용

		MberDto dto = checkDaoQebc.selectOnePw(code, pw);

		return dto;
	}

}
