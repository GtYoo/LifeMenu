package com.lifemenu.dto;

import java.sql.Timestamp;

public class WalletDtlsDto {
	
	private String mberCode;	//회원코드
	private Timestamp rcppayDt;	//입출금 일시
	private String rcppayCl;	//입출금 분류
	private int rcppayAmount;	//입출금 금액
	private int excngCoinCo;	//환전 코인 수
	
	
	@Override
	public String toString() {
		return "WalletDtlsDto [mberCode=" + mberCode + ", rcppayDt=" + rcppayDt + ", rcppayCl=" + rcppayCl
				+ ", rcppayAmount=" + rcppayAmount + ", excngCoinCo=" + excngCoinCo + "]";
	}
	public String getMberCode() {
		return mberCode;
	}
	public void setMberCode(String mberCode) {
		this.mberCode = mberCode;
	}
	public Timestamp getRcppayDt() {
		return rcppayDt;
	}
	public void setRcppayDt(Timestamp rcppayDt) {
		this.rcppayDt = rcppayDt;
	}
	public String getRcppayCl() {
		return rcppayCl;
	}
	public void setRcppayCl(String rcppayCl) {
		this.rcppayCl = rcppayCl;
	}
	public int getRcppayAmount() {
		return rcppayAmount;
	}
	public void setRcppayAmount(int rcppayAmount) {
		this.rcppayAmount = rcppayAmount;
	}
	public int getExcngCoinCo() {
		return excngCoinCo;
	}
	public void setExcngCoinCo(int excngCoinCo) {
		this.excngCoinCo = excngCoinCo;
	}
	


}
