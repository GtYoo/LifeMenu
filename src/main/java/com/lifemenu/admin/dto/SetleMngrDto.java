package com.lifemenu.admin.dto;

import java.sql.Date;

public class SetleMngrDto {

	private String 	setleCode; 		// 결제코드
	private String 	mberCode; 		// 회원코드
	private String 	vochrCode; 		// 식사권코드
	private int 	setlePc; 		// 결제 가격
	private Date 	setleDt; 		// 결제 일시
	private String 	setleAt; 		// 결제완료여부
	private String 	refndReqstAt; 	// 환불요청여부
	private String 	purchsDcsnAt; 	// 구매가능여부
	private String 	mberNcnm; 		// 회원 닉네임
	private String 	mberRlnm; 		// 회원 실명
	private String 	mberEmail; 		// 회원 이메일
	private String 	mberTel; 		// 회원 전화번호
	private String 	bankCode; 		// 은행코드
	private String 	codeNm; 		// 코드명(은행명)
	private String 	mberAcountNo; 	// 회원 계좌번호
	private String 	currentNo; 		// 현재 결제 건수 번호
	
	public String getSetleCode() {
		return setleCode;
	}
	public void setSetleCode(String setleCode) {
		this.setleCode = setleCode;
	}
	public String getMberCode() {
		return mberCode;
	}
	public void setMberCode(String mberCode) {
		this.mberCode = mberCode;
	}
	public String getVochrCode() {
		return vochrCode;
	}
	public void setVochrCode(String vochrCode) {
		this.vochrCode = vochrCode;
	}
	public int getSetlePc() {
		return setlePc;
	}
	public void setSetlePc(int setlePc) {
		this.setlePc = setlePc;
	}
	public Date getSetleDt() {
		return setleDt;
	}
	public void setSetleDt(Date setleDt) {
		this.setleDt = setleDt;
	}
	public String getSetleAt() {
		return setleAt;
	}
	public void setSetleAt(String setleAt) {
		this.setleAt = setleAt;
	}
	public String getRefndReqstAt() {
		return refndReqstAt;
	}
	public void setRefndReqstAt(String refndReqstAt) {
		this.refndReqstAt = refndReqstAt;
	}
	public String getPurchsDcsnAt() {
		return purchsDcsnAt;
	}
	public void setPurchsDcsnAt(String purchsDcsnAt) {
		this.purchsDcsnAt = purchsDcsnAt;
	}
	public String getMberNcnm() {
		return mberNcnm;
	}
	public void setMberNcnm(String mberNcnm) {
		this.mberNcnm = mberNcnm;
	}
	public String getMberRlnm() {
		return mberRlnm;
	}
	public void setMberRlnm(String mberRlnm) {
		this.mberRlnm = mberRlnm;
	}
	public String getMberEmail() {
		return mberEmail;
	}
	public void setMberEmail(String mberEmail) {
		this.mberEmail = mberEmail;
	}
	public String getMberTel() {
		return mberTel;
	}
	public void setMberTel(String mberTel) {
		this.mberTel = mberTel;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getCodeNm() {
		return codeNm;
	}
	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}
	public String getMberAcountNo() {
		return mberAcountNo;
	}
	public void setMberAcountNo(String mberAcountNo) {
		this.mberAcountNo = mberAcountNo;
	}
	public String getCurrentNo() {
		return currentNo;
	}
	public void setCurrentNo(String currentNo) {
		this.currentNo = currentNo;
	}
	
	@Override
	public String toString() {
		return "SetleMngrDto [setleCode=" + setleCode + ", mberCode=" + mberCode + ", vochrCode=" + vochrCode
				+ ", setlePc=" + setlePc + ", setleDt=" + setleDt + ", setleAt=" + setleAt + ", refndReqstAt="
				+ refndReqstAt + ", purchsDcsnAt=" + purchsDcsnAt + ", mberNcnm=" + mberNcnm + ", mberRlnm=" + mberRlnm
				+ ", mberEmail=" + mberEmail + ", mberTel=" + mberTel + ", bankCode=" + bankCode + ", codeNm=" + codeNm
				+ ", mberAcountNo=" + mberAcountNo + ", currentNo=" + currentNo + "]";
	}
		
}
