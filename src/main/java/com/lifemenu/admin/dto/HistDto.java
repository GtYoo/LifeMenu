package com.lifemenu.admin.dto;

import java.sql.Timestamp;

public class HistDto {
	
	private Timestamp rcordDt;	// 기록 일시
	private String histSe; 		// 이력 구분, EnumCRUD 사용
	
	public Timestamp getRcordDt() {
		return rcordDt;
	}
	public void setRcordDt(Timestamp rcordDt) {
		this.rcordDt = rcordDt;
	}
	public String getHistSe() {
		return histSe;
	}
	public void setHistSe(String histSe) {
		this.histSe = histSe;
	}
	
	@Override
	public String toString() {
		return "HistDto [rcordDt=" + rcordDt + ", histSe=" + histSe + "]";
	}
	
}
