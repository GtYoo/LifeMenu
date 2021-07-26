package com.lifemenu.admin.dto;

import java.sql.Date;

public class NoticeMngrDto {

	private String bbscttNo;
	private String mberCode;
	private String bbscttSj;
	private String bbscttCn;
	private Date bbscttDt;
	private String mberNcnm;
	public String getBbscttNo() {
		return bbscttNo;
	}
	public void setBbscttNo(String bbscttNo) {
		this.bbscttNo = bbscttNo;
	}
	public String getMberCode() {
		return mberCode;
	}
	public void setMberCode(String mberCode) {
		this.mberCode = mberCode;
	}
	public String getBbscttSj() {
		return bbscttSj;
	}
	public void setBbscttSj(String bbscttSj) {
		this.bbscttSj = bbscttSj;
	}
	public String getBbscttCn() {
		return bbscttCn;
	}
	public void setBbscttCn(String bbscttCn) {
		this.bbscttCn = bbscttCn;
	}
	public Date getBbscttDt() {
		return bbscttDt;
	}
	public void setBbscttDt(Date bbscttDt) {
		this.bbscttDt = bbscttDt;
	}
	public String getMberNcnm() {
		return mberNcnm;
	}
	public void setMberNcnm(String mberNcnm) {
		this.mberNcnm = mberNcnm;
	}
	@Override
	public String toString() {
		return "NoticeMngrDto [bbscttNo=" + bbscttNo + ", mberCode=" + mberCode + ", bbscttSj=" + bbscttSj
				+ ", bbscttCn=" + bbscttCn + ", bbscttDt=" + bbscttDt + ", mberNcnm=" + mberNcnm + "]";
	}
	
}
