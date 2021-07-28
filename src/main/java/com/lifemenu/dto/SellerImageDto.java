package com.lifemenu.dto;

// 판매자 이미지 DTO
public class SellerImageDto {
	
	private String mberCode;		//회원코드
	private int sno;				//순서
	private String imageAdres;		//이미지 경로
	
	public String getMberCode() {
		return mberCode;
	}
	public void setMberCode(String mberCode) {
		this.mberCode = mberCode;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getImageAdres() {
		return imageAdres;
	}
	public void setImageAdres(String imageAdres) {
		this.imageAdres = imageAdres;
	}
	

}
