package com.lifemenu.admin.dto.hist;

import java.sql.Timestamp;

import com.lifemenu.admin.dto.HistDto;

public class WalletDtlsHistDto extends HistDto {

	private String mberCode;	// 회원 코드
	private Timestamp rcppayDt;	// 입출금 일자
	private char rcppayCl;		// 입출금 분류
	private int rcppayAmount;	// 입출금 금액
	private int excngCoinCo;	// 환전 코인 수
	private int coinCo;			// 회원 코인 수
	
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
	public char getRcppayCl() {
		return rcppayCl;
	}
	public void setRcppayCl(char rcppayCl) {
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
	public int getCoinCo() {
		return coinCo;
	}
	public void setCoinCo(int coinCo) {
		this.coinCo = coinCo;
	}
	
	@Override
	public String toString() {
		return "WalletDtlsHistDto [mberCode=" + mberCode + ", rcppayDt=" + rcppayDt + ", rcppayCl=" + rcppayCl
				+ ", rcppayAmount=" + rcppayAmount + ", excngCoinCo=" + excngCoinCo + ", coinCo=" + coinCo + "]";
	}
	
}
