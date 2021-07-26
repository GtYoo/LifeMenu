package com.lifemenu.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lifemenu.admin.service.IExcclcService;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-06-12
 * 	Version 	: 0.0.1
 * 
 * 	정산 관리
 */

@Controller
public class ExcclcController {

	@Autowired
	@Qualifier("excclcService")
	private IExcclcService excclcService;
	
//	@RequestMapping(value="excclcMngr.do")
//	public String excclcMngrStart() {
//		excclcService.toString();
//		return "admin/excclc/excclcMngr";
//	}
	
	//상은
	//환불신청건 리스트
	@RequestMapping(value="excclcMngr.do")
	public String refndAtList(Model model) {
		
		return excclcService.refndList(model);
	}
	
	//환불처리
	@RequestMapping(value="refndOk")
	public String refndOk(Model model, @RequestParam(value="SETLE_CODE") String setleCode) {
		
		return excclcService.refndOk(model, setleCode);
	}
	
	//환불불가
	@RequestMapping(value="refndNo")
	public String refndNo(Model model, @RequestParam(value="SETLE_CODE") String setleCode) {
		
		return excclcService.refndNo(model, setleCode);
	}
}
