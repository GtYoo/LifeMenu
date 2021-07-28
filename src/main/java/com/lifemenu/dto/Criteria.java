package com.lifemenu.dto;

// 페이지 처리용
public class Criteria {
	
	private int pageNum;	 //페이지 넘버(현재)
	private int amount;		 //조회할 건수
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}

}
