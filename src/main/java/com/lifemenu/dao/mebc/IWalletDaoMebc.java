package com.lifemenu.dao.mebc;

import com.lifemenu.dto.MberDto;
import com.lifemenu.dto.WalletDtlsDto;
import com.lifemenu.dto.WalletDto;

public interface IWalletDaoMebc {	//지갑 MEBC
	MberDto selectOneMber(String mberCode);	//단건조회용
	WalletDto selectOneMberWallet(String mberCode);//단건조회용 지갑
	void insertWalletDtls(WalletDtlsDto walletDtlsDto);//지갑 내역
	void updateWallet(String mberCode, int coinCo);//지갑에 코인수 바꾸는 거
	void updateMberAcountNo(String mberCode, String mberAcountNo); //출금계좌번호 등록(업데이트)

}
