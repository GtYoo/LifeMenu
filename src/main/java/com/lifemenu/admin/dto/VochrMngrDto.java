package com.lifemenu.admin.dto;

public class VochrMngrDto {

	private String 		vochrCode;		// 식사권 코드
	private String 		mberCode; 		// 회원 코드(판매자코드)
	private int 		vochrPrice; 	// 식사권 가격
	private String 		mealPrearngeDt; // 식사예정시간
	private String 		vochrRegistDt; 	// 식사권 등록일시
	private int 		mealTime; 		// 식사시간
	private char 		delngAt; 		// 판매가능여부
	private String 		mberNcnm; 		// 회원 닉네임
	private String 		mberRlnm; 		// 회원 실명
	private String 		mberEmail; 		// 회원 이메일
	private String 		mberTel; 		// 회원 전화번호
	private String 		bankCode; 		// 은행코드
	private String 		codeNm; 		// 코드명(은행명)
	private String 		mberAcountNo; 	// 회원 계좌번호
	
	public String getVochrCode() {
		return vochrCode;
	}
	public void setVochrCode(String vochrCode) {
		this.vochrCode = vochrCode;
	}
	public String getMberCode() {
		return mberCode;
	}
	public void setMberCode(String mberCode) {
		this.mberCode = mberCode;
	}
	public int getVochrPrice() {
		return vochrPrice;
	}
	public void setVochrPrice(int vochrPrice) {
		this.vochrPrice = vochrPrice;
	}
	public String getMealPrearngeDt() {
		return mealPrearngeDt;
	}
	public void setMealPrearngeDt(String mealPrearngeDt) {
		this.mealPrearngeDt = mealPrearngeDt;
	}
	public String getVochrRegistDt() {
		return vochrRegistDt;
	}
	public void setVochrRegistDt(String vochrRegistDt) {
		this.vochrRegistDt = vochrRegistDt;
	}
	public int getMealTime() {
		return mealTime;
	}
	public void setMealTime(int mealTime) {
		this.mealTime = mealTime;
	}
	public char getDelngAt() {
		return delngAt;
	}
	public void setDelngAt(char delngAt) {
		this.delngAt = delngAt;
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
	
	@Override
	public String toString() {
		return "VochrMngrDto [vochrCode=" + vochrCode + ", mberCode=" + mberCode + ", vochrPrice=" + vochrPrice
				+ ", mealPrearngeDt=" + mealPrearngeDt + ", vochrRegistDt=" + vochrRegistDt + ", mealTime=" + mealTime
				+ ", delngAt=" + delngAt + ", mberNcnm=" + mberNcnm + ", mberRlnm=" + mberRlnm + ", mberEmail="
				+ mberEmail + ", mberTel=" + mberTel + ", bankCode=" + bankCode + ", codeNm=" + codeNm
				+ ", mberAcountNo=" + mberAcountNo + "]";
	}
	
}
