package com.lifemenu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lifemenu.service.INoticeService;


@Controller
public class NoticeReadController {
	
	@Autowired
	private INoticeService noticeService;
	

	
	//전체목록
	@RequestMapping("noticeMulti.do")
	public String main(Model model) throws Exception{
		return noticeService.selectMultiNotice(model);
	}

	// 공지사항 상세 조회
	@RequestMapping(value="noticeDetail.do")
	public String selectOneNoticeDetail(Model model, @RequestParam("bbscttNo") String bbscttNo) {
		System.out.println(bbscttNo);
		return noticeService.selectOneNotice(model, bbscttNo);
	}

}
