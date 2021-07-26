package com.lifemenu.admin.dto;

public class TagReadCntDto {

	private String tagCode;
	private int tagReadCnt;
	
	public String getTagCode() {
		return tagCode;
	}
	public void setTagCode(String tagCode) {
		this.tagCode = tagCode;
	}
	public int getTagReadCnt() {
		return tagReadCnt;
	}
	public void setTagReadCnt(int tagReadCnt) {
		this.tagReadCnt = tagReadCnt;
	}
	
	@Override
	public String toString() {
		return "TagReadCntDto [tagCode=" + tagCode + ", tagReadCnt=" + tagReadCnt + "]";
	}
	
}
