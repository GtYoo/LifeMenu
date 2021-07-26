package com.lifemenu.admin.dto.hist;

import java.sql.Date;

import com.lifemenu.admin.dto.HistDto;

public class RefndHistDto extends HistDto {

	private String setleCode;	// 결제 코드
	private int refndPc;		// 환불 금액
	private Date refndDt;		// 환불 일시
	private String refndAt;		// 환불 완료 여부
	private String refndResn; 	// 환불 사유
	
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
	
	@Override
	public String toString() {
		return "RefndHistDto [setleCode=" + setleCode + ", refndPc=" + refndPc + ", refndDt=" + refndDt + ", refndAt="
				+ refndAt + ", refndResn=" + refndResn + "]";
	}
	
}
