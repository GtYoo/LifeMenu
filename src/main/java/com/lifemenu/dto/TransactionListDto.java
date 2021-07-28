package com.lifemenu.dto;


public class TransactionListDto {
	
	private String buyMberRlnm;		//구매자이름
	private String setleCode;		//예약코드
	private String setleVochrCode;	//예약한 식사권코드
	private int setlePc;			//결제가격
	private char setleAt;			//결제완료여부
	private String mealPrearngeDt;	//식사예정일
	private int mealTime;			//식사시간
	private String selerMberCode;	//판매자코드
	private String selerMberRlnm;	//판매자이름
	private String selerAprsm;		//판매자명언
	private char purchsDcsnAt;		//구매확정여부
	private char refndReqstAt;		//환불신청여부
	
	public char getRefndReqstAt() {
		return refndReqstAt;
	}
	public void setRefndReqstAt(char refndReqstAt) {
		this.refndReqstAt = refndReqstAt;
	}
	public char getPurchsDcsnAt() {
		return purchsDcsnAt;
	}
	public void setPurchsDcsnAt(char purchsDcsnAt) {
		this.purchsDcsnAt = purchsDcsnAt;
	}
	public String getBuyMberRlnm() {
		return buyMberRlnm;
	}
	public void setBuyMberRlnm(String buyMberRlnm) {
		this.buyMberRlnm = buyMberRlnm;
	}
	public String getSetleCode() {
		return setleCode;
	}
	public void setSetleCode(String resveCode) {
		this.setleCode = resveCode;
	}
	public String getSetleVochrCode() {
		return setleVochrCode;
	}
	public void setSetleVochrCode(String resveVochrCode) {
		this.setleVochrCode = resveVochrCode;
	}
	public int getSetlePc() {
		return setlePc;
	}
	public void setSetlePc(int setlePc) {
		this.setlePc = setlePc;
	}
	public char getSetleAt() {
		return setleAt;
	}
	public void setSetleAt(char setleAt) {
		this.setleAt = setleAt;
	}
	public String getMealPrearngeDt() {
		return mealPrearngeDt;
	}
	public void setMealPrearngeDt(String mealPrearngeDt) {
		this.mealPrearngeDt = mealPrearngeDt;
	}
	public int getMealTime() {
		return mealTime;
	}
	public void setMealTime(int mealTime) {
		this.mealTime = mealTime;
	}
	public String getSelerMberCode() {
		return selerMberCode;
	}
	public void setSelerMberCode(String selerMberCode) {
		this.selerMberCode = selerMberCode;
	}
	public String getSelerMberRlnm() {
		return selerMberRlnm;
	}
	public void setSelerMberRlnm(String selerMberRlnm) {
		this.selerMberRlnm = selerMberRlnm;
	}
	public String getSelerAprsm() {
		return selerAprsm;
	}
	public void setSelerAprsm(String selerAprsm) {
		this.selerAprsm = selerAprsm;
	}
	
}
