package com.lifemenu.service;

import org.springframework.ui.Model;

public interface INoticeService {

	//단건
	String selectOneNotice(Model model, String bbscttNo);

	//다건
	String selectMultiNotice(Model model);
//	String selectMultiNoticeByCondition(Model model, ConditionParamVo conditionParamVo);




}
