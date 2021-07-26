package com.lifemenu.admin.dto.hist;

import java.sql.Timestamp;

import com.lifemenu.admin.dto.HistDto;

public class CoinRepositoryHistDto extends HistDto {

	private String delngCode; 		// 거래 코드
	private String mberCode; 		// 회원 코드
	private String setleCode; 		// 결제 코드
	private Timestamp delngDt; 		// 거래 일시
	private String delngSe; 		// 거래 분류
	private int delngAmount; 		// 거래 금액
	private int repositoryCoinCo;	// 저장 코인 수
	
	public String getDelngCode() {
		return delngCode;
	}
	public void setDelngCode(String delngCode) {
		this.delngCode = delngCode;
	}
	public String getMberCode() {
		return mberCode;
	}
	public void setMberCode(String mberCode) {
		this.mberCode = mberCode;
	}
	public String getSetleCode() {
		return setleCode;
	}
	public void setSetleCode(String setleCode) {
		this.setleCode = setleCode;
	}
	public Timestamp getDelngDt() {
		return delngDt;
	}
	public void setDelngDt(Timestamp delngDt) {
		this.delngDt = delngDt;
	}
	public String getDelngSe() {
		return delngSe;
	}
	public void setDelngSe(String delngSe) {
		this.delngSe = delngSe;
	}
	public int getDelngAmount() {
		return delngAmount;
	}
	public void setDelngAmount(int delngAmount) {
		this.delngAmount = delngAmount;
	}
	public int getRepositoryCoinCo() {
		return repositoryCoinCo;
	}
	public void setRepositoryCoinCo(int repositoryCoinCo) {
		this.repositoryCoinCo = repositoryCoinCo;
	}
	
	@Override
	public String toString() {
		return "CoinRepositoryHistDto [delngCode=" + delngCode + ", mberCode=" + mberCode + ", setleCode=" + setleCode
				+ ", delngDt=" + delngDt + ", delngSe=" + delngSe + ", delngAmount=" + delngAmount
				+ ", repositoryCoinCo=" + repositoryCoinCo + "]";
	}
	
}
