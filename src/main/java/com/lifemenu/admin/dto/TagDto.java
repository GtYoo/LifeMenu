package com.lifemenu.admin.dto;

public class TagDto {

	private String tagCode;
	private String tagNm;
	private String imageAdres;
	
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
	
	@Override
	public String toString() {
		return "TagDto [tagCode=" + tagCode + ", tagNm=" + tagNm + ", imageAdres=" + imageAdres + "]";
	}
	
}
