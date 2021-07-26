package com.lifemenu.admin.dto;

public class InqryMngrDto {

	private MngrInqryDto mngrInqryDto; 	// 관리자 문의
	private String mberNcnm; 			// 회원 닉네임
	private String mberRlnm; 			// 회원 실명
	private String mberEmail; 			// 회원 이메일
	
	public MngrInqryDto getMngrInqryDto() {
		return mngrInqryDto;
	}
	public void setMngrInqryDto(MngrInqryDto mngrInqryDto) {
		this.mngrInqryDto = mngrInqryDto;
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
		return "InqryMngrDto [mngrInqryDto=" + mngrInqryDto + ", mberNcnm=" + mberNcnm + ", mberRlnm=" + mberRlnm
				+ ", mberEmail=" + mberEmail + "]";
	}
	
}
