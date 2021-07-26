package com.lifemenu.admin.service;

import org.springframework.ui.Model;

public interface IExcclcService {

	// 보류
	
	//상은
	//환불신청리스트 조회
	String refndList(Model model);
	
	//환불승인
	String refndOk(Model model, String setleCode);
	
	//환불불가
	String refndNo(Model model, String setleCode);
}
