package com.lifemenu.admin.dto;

import java.sql.Date;

public class MngrInqryDto {

	private String mngrInqryNo;		// 관리자 문의 번호
	private String mberCode;		// 회원 코드
	private String mngrAnswerNo;	// 관리자 답변 번호
	private String inqrySj;			// 문의 제목
	private String inqryCn;			// 문의 내용
	private Date inqryDt;			// 문의 일시
	
	public String getMngrInqryNo() {
		return mngrInqryNo;
	}
	public void setMngrInqryNo(String mngrInqryNo) {
		this.mngrInqryNo = mngrInqryNo;
	}
	public String getMberCode() {
		return mberCode;
	}
	public void setMberCode(String mberCode) {
		this.mberCode = mberCode;
	}
	public String getMngrAnswerNo() {
		return mngrAnswerNo;
	}
	public void setMngrAnswerNo(String mngrAnswerNo) {
		this.mngrAnswerNo = mngrAnswerNo;
	}
	public String getInqrySj() {
		return inqrySj;
	}
	public void setInqrySj(String inqrySj) {
		this.inqrySj = inqrySj;
	}
	public String getInqryCn() {
		return inqryCn;
	}
	public void setInqryCn(String inqryCn) {
		this.inqryCn = inqryCn;
	}
	public Date getInqryDt() {
		return inqryDt;
	}
	public void setInqryDt(Date inqryDt) {
		this.inqryDt = inqryDt;
	}
	
	@Override
	public String toString() {
		return "MngrInqryDto [mngrInqryNo=" + mngrInqryNo + ", mberCode=" + mberCode + ", mngrAnswerNo=" + mngrAnswerNo
				+ ", inqrySj=" + inqrySj + ", inqryCn=" + inqryCn + ", inqryDt=" + inqryDt + "]";
	}
	
}
