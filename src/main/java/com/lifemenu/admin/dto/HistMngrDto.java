package com.lifemenu.admin.dto;

import java.sql.Timestamp;

public class HistMngrDto implements Comparable<HistMngrDto> {

	private Timestamp rcordDt; 		// 기록일시
	private String histSeTable; 	// 기록된 테이블명
	private String histSeExec; 		// 기록한 행위(insert, update, delete)
	private String seCode; 			// 구분코드(식사권, 예약결제, 환불, 지갑내역, 코인저장소내역)
	private String histBrief; 		// 기록요약(String)
	private HistDto contents; 		// 기록된 내용(상세정보)
	
	public Timestamp getRcordDt() {
		return rcordDt;
	}
	public void setRcordDt(Timestamp rcordDt) {
		this.rcordDt = rcordDt;
	}
	public String getHistSeTable() {
		return histSeTable;
	}
	public void setHistSeTable(String histSeTable) {
		this.histSeTable = histSeTable;
	}
	public String getHistSeExec() {
		return histSeExec;
	}
	public void setHistSeExec(String histSeExec) {
		this.histSeExec = histSeExec;
	}
	public String getSeCode() {
		return seCode;
	}
	public void setSeCode(String seCode) {
		this.seCode = seCode;
	}
	public String getHistBrief() {
		return histBrief;
	}
	public void setHistBrief(String histBrief) {
		this.histBrief = histBrief;
	}
	public HistDto getContents() {
		return contents;
	}
	public void setContents(HistDto contents) {
		this.contents = contents;
	}
	
	@Override
	public String toString() {
		return "HistMngrDto [rcordDt=" + rcordDt + ", histSeTable=" + histSeTable + ", histSeExec=" + histSeExec
				+ ", seCode=" + seCode + ", histBrief=" + histBrief + ", contents=" + contents + "]";
	}
	@Override
	public int compareTo(HistMngrDto histMngrDto) {
		return rcordDt.compareTo(histMngrDto.getRcordDt());
	}
	
}
