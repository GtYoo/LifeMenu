package com.lifemenu.dto;

import java.sql.Timestamp;

public class CoinRepositoryDto {
	
	private String delngCode;
	private String mberCode;
	private String setleCode;
	private Timestamp delngDt;
	private char delngSe;
	private int delngAmount;
	private int repositoryCoinCo;
	
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
	public char getDelngSe() {
		return delngSe;
	}
	public void setDelngSe(char delngSe) {
		this.delngSe = delngSe;
	}
	public int getDelngAmount() {
		return delngAmount;
	}
	public void setDelngAmount(int delngAmount) {
		this.delngAmount = delngAmount;
	}
	public String getDelngCode() {
		return delngCode;
	}
	public void setDelngCode(String delngCode) {
		this.delngCode = delngCode;
	}
	public int getRepositoryCoinCo() {
		return repositoryCoinCo;
	}
	public void setRepositoryCoinCo(int repositoryCoinCo) {
		this.repositoryCoinCo = repositoryCoinCo;
	}
	
	@Override
	public String toString() {
		return "CoinRepositoryDto [delngCode=" + delngCode + ", repositoryCoinCo=" + repositoryCoinCo + "]";
	}
	
}
