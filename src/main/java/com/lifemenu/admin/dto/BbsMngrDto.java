package com.lifemenu.admin.dto;

import com.lifemenu.dto.BbscttDto;

public class BbsMngrDto {

	private BbscttDto bbscttDto;
	private String mberNcnm;
	private String mberRlnm;
	private String mberEmail;
	
	public BbscttDto getBbscttDto() {
		return bbscttDto;
	}
	public void setBbscttDto(BbscttDto bbscttDto) {
		this.bbscttDto = bbscttDto;
	}
	public String getMberNcnm() {
		return mberNcnm;
	}
	public void setMberNcnm(String mberNcnm) {
		this.mberNcnm = mberNcnm;
	}
	public String getMberRlnm() {
		return mberRlnm;
	}
	public void setMberRlnm(String mberRlnm) {
		this.mberRlnm = mberRlnm;
	}
	public String getMberEmail() {
		return mberEmail;
	}
	public void setMberEmail(String mberEmail) {
		this.mberEmail = mberEmail;
	}
	
	@Override
	public String toString() {
		return "BbsMngrDto [bbscttDto=" + bbscttDto + ", mberNcnm=" + mberNcnm + ", mberRlnm=" + mberRlnm
				+ ", mberEmail=" + mberEmail + "]";
	}
	
}
