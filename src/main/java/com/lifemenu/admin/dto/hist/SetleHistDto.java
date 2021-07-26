package com.lifemenu.admin.dto.hist;

import java.sql.Date;

import com.lifemenu.admin.dto.HistDto;

public class SetleHistDto extends HistDto {

	private String 	setleCode;		// 결제 코드
	private String 	mberCode;		// 회원 코드
	private String 	vochrCode;		// 식사권 코드
	private int 	setlePc; 		// 결제 가격
	private Date 	setleDt; 		// 결제 일시
	private String 	setleAt; 		// 결제 완료 여부
	private String 	refndReqstAt; 	// 환불 신청 여부
	private String 	purchsDcsnAt;	// 구매 확정 여부
	
	public String getSetleCode() {
		return setleCode;
	}
	public void setSetleCode(String setleCode) {
		this.setleCode = setleCode;
	}
	public String getMberCode() {
		return mberCode;
	}
	public void setMberCode(String mberCode) {
		this.mberCode = mberCode;
	}
	public String getVochrCode() {
		return vochrCode;
	}
	public void setVochrCode(String vochrCode) {
		this.vochrCode = vochrCode;
	}
	public int getSetlePc() {
		return setlePc;
	}
	public void setSetlePc(int setlePc) {
		this.setlePc = setlePc;
	}
	public Date getSetleDt() {
		return setleDt;
	}
	public void setSetleDt(Date setleDt) {
		this.setleDt = setleDt;
	}
	public String getSetleAt() {
		return setleAt;
	}
	public void setSetleAt(String setleAt) {
		this.setleAt = setleAt;
	}
	public String getRefndReqstAt() {
		return refndReqstAt;
	}
	public void setRefndReqstAt(String refndReqstAt) {
		this.refndReqstAt = refndReqstAt;
	}
	public String getPurchsDcsnAt() {
		return purchsDcsnAt;
	}
	public void setPurchsDcsnAt(String purchsDcsnAt) {
		this.purchsDcsnAt = purchsDcsnAt;
	}
	
	@Override
	public String toString() {
		return "SetleHistDto [setleCode=" + setleCode + ", mberCode=" + mberCode + ", vochrCode=" + vochrCode
				+ ", setlePc=" + setlePc + ", setleDt=" + setleDt + ", setleAt=" + setleAt + ", refndReqstAt="
				+ refndReqstAt + ", purchsDcsnAt=" + purchsDcsnAt + "]";
	}
	
}
