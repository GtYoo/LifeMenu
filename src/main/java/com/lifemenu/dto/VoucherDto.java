package com.lifemenu.dto;

//식사권 DTO
public class VoucherDto {
	
	private String vochrCode; 			//식사권 코드
	private String mberCode;			//회원 코드
	private int vochrPrice;				//식사권 가격
	private String mealPrearngeDt;		//식사 일시
	private String vochrRegistDt;		//식사권 등록 일시
	private int mealTime;				//식사 소요 시간
	private char delngAt;				//구매 가능 여부
	
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
}
