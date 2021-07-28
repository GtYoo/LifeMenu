package com.lifemenu.dto;

import java.sql.Date;

public class RefndDto {
	
	private String setleCode;
	private int refndPc;
	private Date refndDt;
	private String refndAt;
	private String refndResn;
	
	public String getSetleCode() {
		return setleCode;
	}
	public void setSetleCode(String setleCode) {
		this.setleCode = setleCode;
	}
	public int getRefndPc() {
		return refndPc;
	}
	public void setRefndPc(int refndPc) {
		this.refndPc = refndPc;
	}
	public Date getRefndDt() {
		return refndDt;
	}
	public void setRefndDt(Date refndDt) {
		this.refndDt = refndDt;
	}
	public String getRefndAt() {
		return refndAt;
	}
	public void setRefndAt(String refndAt) {
		this.refndAt = refndAt;
	}
	public String getRefndResn() {
		return refndResn;
	}
	public void setRefndResn(String refndResn) {
		this.refndResn = refndResn;
	}
}
