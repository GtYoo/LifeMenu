package com.lifemenu.admin.dto;

public class TagMngrDto {

	private String tagCode;		// 태그 코드
	private String tagNm;		// 태그명
	private String imageAdres;	// 이미지 경로
	private String tagReadCnt;	// 조회수
	
	public String getTagCode() {
		return tagCode;
	}
	public void setTagCode(String tagCode) {
		this.tagCode = tagCode;
	}
	public String getTagNm() {
		return tagNm;
	}
	public void setTagNm(String tagNm) {
		this.tagNm = tagNm;
	}
	public String getImageAdres() {
		return imageAdres;
	}
	public void setImageAdres(String imageAdres) {
		this.imageAdres = imageAdres;
	}
	public String getTagReadCnt() {
		return tagReadCnt;
	}
	public void setTagReadCnt(String tagReadCnt) {
		this.tagReadCnt = tagReadCnt;
	}
	
	@Override
	public String toString() {
		return "TagMngrDto [tagCode=" + tagCode + ", tagNm=" + tagNm + ", imageAdres=" + imageAdres + ", tagReadCnt="
				+ tagReadCnt + "]";
	}
	
}
