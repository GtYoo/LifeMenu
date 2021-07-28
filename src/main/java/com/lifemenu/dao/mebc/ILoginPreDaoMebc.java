package com.lifemenu.dao.mebc;

import com.lifemenu.dto.MberDto;
import com.lifemenu.dto.WalletDto;

public interface ILoginPreDaoMebc {
	
	public MberDto selectOneMber(String mberCode);		//회원코드를 이용한 멤버찾기
	
	public WalletDto selectOneWallet(String code);	//회원코드를 이용한 지갑 찾기

    public void insertMber(MberDto mberDto);	//회원가입
    
    public void insertCoinCo(WalletDto walletDto);	//지갑에 코인 수

    public void findUpdatePw(String mberPw, String mberCode); //아이디비번 찾기에서 비밀번호 재설정하는것



}
