package com.lifemenu.admin.dto.hist;

import java.sql.Date;

import com.lifemenu.admin.dto.HistDto;

public class ResveSetleHistDto extends HistDto {

	private String resveSetleCode;	// 예약 결제 코드
	private String mberCode;		// 회원 코드
	private String vochrCode;		// 식사권 코드
	private int resvePc;			// 예약 가격
	private Date resveDt;			// 예약 일시
	private int setlePc; 			// 결제 가격
	private Date setleDt; 			// 결제 일시
	private String setleAt; 		// 결제 완료 여부
	private String refndReqstAt; 	// 환불 신청 여부
	private String purchsDcsnAt;	// 구매 확정 여부
	
	public String getResveSetleCode() {
		return resveSetleCode;
	}
	public void setResveSetleCode(String resveSetleCode) {
		this.resveSetleCode = resveSetleCode;
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
	public int getResvePc() {
		return resvePc;
	}
	public void setResvePc(int resvePc) {
		this.resvePc = resvePc;
	}
	public Date getResveDt() {
		return resveDt;
	}
	public void setResveDt(Date resveDt) {
		this.resveDt = resveDt;
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
		return "ResveSetleHistDto [resveSetleCode=" + resveSetleCode + ", mberCode=" + mberCode + ", vochrCode="
				+ vochrCode + ", resvePc=" + resvePc + ", resveDt=" + resveDt + ", setlePc=" + setlePc + ", setleDt="
				+ setleDt + ", setleAt=" + setleAt + ", refndReqstAt=" + refndReqstAt + ", purchsDcsnAt=" + purchsDcsnAt
				+ "]";
	}
	
}
