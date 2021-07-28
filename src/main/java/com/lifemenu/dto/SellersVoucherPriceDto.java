package com.lifemenu.dto;

// 판매자 가격 히스토리 DTO
public class SellersVoucherPriceDto {
	
	private String mealPrearngeDt; 	//식사일시
	private int vochrPrice;			//식사권 가격
	
	public String getMealPrearngeDt() {
		return mealPrearngeDt;
	}
	public void setMealPrearngeDt(String mealPrearngeDt) {
		this.mealPrearngeDt = mealPrearngeDt;
	}
	public int getVochrPrice() {
		return vochrPrice;
	}
	public void setVochrPrice(int vochrPrice) {
		this.vochrPrice = vochrPrice;
	}

}
