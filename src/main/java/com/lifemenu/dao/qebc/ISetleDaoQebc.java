package com.lifemenu.dao.qebc;

import com.lifemenu.dto.MberDto;
import com.lifemenu.dto.VoucherDto;
import com.lifemenu.dto.WalletDto;

public interface ISetleDaoQebc {
	
	//예약코드로 식사권코드 조회
	String selectOneVoucherCode(String resveCode);
	
	//회원코드로 지갑코인조회
	int selectOneMberWalletCoin(String mberCode);
	
	//결제시 회원코드 차감
	void updateMberCoin(WalletDto walletDto);
	
	//결제시 식사권 거래가능여부 N
	void updateVoucherDelngAt(VoucherDto voucherDto);
	
	//판매자DTO 조회
	MberDto selectSelerName(String mberCode);
	
	//마지막 결제번호 조회
	String selectMaxSetleCode();
	
	//결제번호로 판매자코드 조회
	String selectSelerCode(String setleCode);

}
