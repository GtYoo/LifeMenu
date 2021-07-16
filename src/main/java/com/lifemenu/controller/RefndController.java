package com.lifemenu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lifemenu.dto.RefndDto;
import com.lifemenu.service.IRefndService;

@Controller
@RequestMapping("/Refnd")
public class RefndController {

	@Autowired
	private IRefndService refndService;
	
	//환불페이지
	@RequestMapping("/refndForm")
	public String refndForm(Model model, @RequestParam(value="SETLE_CODE") String setleCode) {
		
		return refndService.selectOneSetle(model, setleCode);
	}
	
	//환불진행
	@RequestMapping("insertRefnd")
	public String insertRefnd(Model model, RefndDto refndDto) throws Exception {
		
		return refndService.insertRefnd(model, refndDto);
	}
}
