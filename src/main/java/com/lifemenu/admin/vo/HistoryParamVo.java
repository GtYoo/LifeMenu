package com.lifemenu.admin.vo;

import java.sql.Timestamp;

public class HistoryParamVo extends ConditionParamVo {

	private Timestamp startRcordDt; 	// 검색 범위: 시작 일시
	private Timestamp endRcordDt; 		// 검색 범위: 종료 일시
	
	public Timestamp getStartRcordDt() {
		return startRcordDt;
	}
	public void setStartRcordDt(Timestamp startRcordDt) {
		this.startRcordDt = startRcordDt;
	}
	public void setStartRcordDt(String startRcordDt) {
		this.startRcordDt = Timestamp.valueOf(startRcordDt);
	}
	public Timestamp getEndRcordDt() {
		return endRcordDt;
	}
	public void setEndRcordDt(Timestamp endRcordDt) {
		this.endRcordDt = endRcordDt;
	}
	public void setEndRcordDt(String endRcordDt) {
		this.endRcordDt = Timestamp.valueOf(endRcordDt);
	}
	
	@Override
	public String toString() {
		return "HistoryParamVo [startRcordDt=" + startRcordDt + ", endRcordDt=" + endRcordDt + ", " + super.toString() + "]";
	}
		
}
