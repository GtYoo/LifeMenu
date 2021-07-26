package com.lifemenu.admin.vo;

public class PageParamVo {

	private String start;
	private String cnt;
	
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	
	@Override
	public String toString() {
		return "PageParamVo [start=" + start + ", cnt=" + cnt + "]";
	}
	
}
