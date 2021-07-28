package com.lifemenu.dto;

import java.util.List;

// 판매자 목록 출력용 판매자 DTO
public class SellerSearchDto {
	
	private String mberCode;				//회원코드
	private List<String> selerImageList;	//판매자 이미지경로 목록
	private int selerAge;					//판매자 나이
	private String selerOccp;				//판매자 직업
	private String selerAprsm;				//판매자 명언
	private String mberNcnm; 				//판매자 닉네임
	private int avgPrice;					//판매자의 식사권 평균가
	
	public String getMberCode() {
		return mberCode;
	}
	public void setMberCode(String mberCode) {
		this.mberCode = mberCode;
	}
	public List<String> getSelerImageList() {
		return selerImageList;
	}
	public void setSelerImageList(List<String> selerImageList) {
		this.selerImageList = selerImageList;
	}
	public int getSelerAge() {
		return selerAge;
	}
	public void setSelerAge(int selerAge) {
		this.selerAge = selerAge;
	}
	public String getSelerOccp() {
		return selerOccp;
	}
	public void setSelerOccp(String selerOccp) {
		this.selerOccp = selerOccp;
	}
	public String getSelerAprsm() {
		return selerAprsm;
	}
	public void setSelerAprsm(String selerAprsm) {
		this.selerAprsm = selerAprsm;
	}
	public String getMberNcnm() {
		return mberNcnm;
	}
	public void setMberNcnm(String mberNcnm) {
		this.mberNcnm = mberNcnm;
	}
	public int getAvgPrice() {
		return avgPrice;
	}
	public void setAvgPrice(int avgPrice) {
		this.avgPrice = avgPrice;
	}


}
