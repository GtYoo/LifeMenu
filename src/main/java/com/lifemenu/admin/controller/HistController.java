package com.lifemenu.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lifemenu.admin.service.IHistService;
import com.lifemenu.admin.vo.ConditionParamVo;
import com.lifemenu.admin.vo.HistoryParamVo;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-18
 * 	Version 	: 1.0.1
 * 
 * 	히스토리 관리
 * 2021-06-21-0.0.2 	- VochrHist 추가
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-18-1.0.1 	- 조건 조회 변경
 */

@Controller
public class HistController {

	@Autowired
	@Qualifier("histService")
	private IHistService histService;
	
	@RequestMapping(value="histMngrCondition.do")
	public String selectMultiHist(Model model, ConditionParamVo conditionParamVo) {
		
		HistoryParamVo historyParamVo = new HistoryParamVo();
		historyParamVo.setStart(conditionParamVo.getStart());
		historyParamVo.setCnt(conditionParamVo.getCnt());
		historyParamVo.setConditionType(conditionParamVo.getConditionType());
		historyParamVo.setCondition(conditionParamVo.getCondition());
		
		return histService.selectMultiHistByCondition(model, historyParamVo);
		
	}
		
}
