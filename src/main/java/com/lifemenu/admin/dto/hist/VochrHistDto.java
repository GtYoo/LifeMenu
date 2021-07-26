package com.lifemenu.admin.dto.hist;

import java.sql.Date;

import com.lifemenu.admin.dto.HistDto;

public class VochrHistDto extends HistDto {

	private String vochrCode;		// 식사권 코드
	private String mberCode;		// 회원 코드
	private int vochrPrice;			// 식사권 가격
	private String mealPrearngeDt;	// 식사 예정 일시
	private Date vochrRegistDt; 	// 식사권 등록 일시
	private int mealTime; 			// 식사시간
	private String delngAt; 		// 거래 가능 여부
	
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
	public Date getVochrRegistDt() {
		return vochrRegistDt;
	}
	public void setVochrRegistDt(Date vochrRegistDt) {
		this.vochrRegistDt = vochrRegistDt;
	}
	public int getMealTime() {
		return mealTime;
	}
	public void setMealTime(int mealTime) {
		this.mealTime = mealTime;
	}
	public String getDelngAt() {
		return delngAt;
	}
	public void setDelngAt(String delngAt) {
		this.delngAt = delngAt;
	}
	
	@Override
	public String toString() {
		return "VochrHistDto [vochrCode=" + vochrCode + ", mberCode=" + mberCode + ", vochrPrice=" + vochrPrice
				+ ", mealPrearngeDt=" + mealPrearngeDt + ", vochrRegistDt=" + vochrRegistDt + ", mealTime=" + mealTime
				+ ", delngAt=" + delngAt + "]";
	}
	
}
