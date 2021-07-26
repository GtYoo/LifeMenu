package com.lifemenu.admin.dto;

public class CmmnCodeDto {

	private String cmmnCode;	// 공통코드
	private String codeNm; 		// 코드명
	
	public String getCmmnCode() {
		return cmmnCode;
	}
	public void setCmmnCode(String cmmnCode) {
		this.cmmnCode = cmmnCode;
	}
	public String getCodeNm() {
		return codeNm;
	}
	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}
	
	@Override
	public String toString() {
		return "CmmnCodeDto [cmmnCode=" + cmmnCode + ", codeNm=" + codeNm + "]";
	}
	
}
