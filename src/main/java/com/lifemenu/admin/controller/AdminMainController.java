package com.lifemenu.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-06-17
 * 	Version 	: 0.0.1
 * 
 * 	관리자 메인 화면
 */

@Controller
public class AdminMainController {

	@RequestMapping(value="adminMain.do")
	public String adminStart() {
		return "admin/admin_main";
	}
	
	@RequestMapping(value="test.do")
	public String test() {
		return "admin/test";
	}
	
}
