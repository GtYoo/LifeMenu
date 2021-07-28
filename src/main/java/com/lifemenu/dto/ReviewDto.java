package com.lifemenu.dto;

import java.util.Date;

//리뷰 DTO
public class ReviewDto {
    private String setleCode;	// 결제 코드
    private String mberCode;	// 회원 코드
    private String reviewCn;	// 리뷰 내용
    private Date reviewDate;	// 리뷰 일자
    
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
	public String getReviewCn() {
		return reviewCn;
	}
	public void setReviewCn(String reviewCn) {
		this.reviewCn = reviewCn;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

}
