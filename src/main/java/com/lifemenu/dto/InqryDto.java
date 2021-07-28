package com.lifemenu.dto;


public class InqryDto {
    private String mngrInqryNo;	// 게시글 번호
    private String mberCode;	// 회원 코드
    private String mngrAnswerNo;	// 답변 게시글 번호
    private String inqrySj;	// 게시글 제목
    private String inqryCn;	// 게시글 내용
    private String inqryDt;		// 작성 일시
    
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
	public String getInqryDt() {
		return inqryDt;
	}
	public void setInqryDt(String inqryDt) {
		this.inqryDt = inqryDt;
	}
	
	@Override
	public String toString() {
		return "InqryDto [mngrInqryNo=" + mngrInqryNo + ", mberCode=" + mberCode + ", mngrAnswerNo=" + mngrAnswerNo
				+ ", inqrySj=" + inqrySj + ", inqryCn=" + inqryCn + ", inqryDt=" + inqryDt + "]";
	}
    
    
}
