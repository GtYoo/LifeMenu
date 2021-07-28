package com.lifemenu.service;

import org.springframework.ui.Model;

import com.lifemenu.dto.RefndDto;

public interface IRefndService {
	
	//환불페이지 출력
	String selectOneSetle(Model model, String setleCode);
	
	//환불등록
	String insertRefnd(Model model, RefndDto refndDto) throws Exception;
}
