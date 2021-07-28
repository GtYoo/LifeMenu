package com.lifemenu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lifemenu.dao.mebc.INoticeDaoMebc;
import com.lifemenu.dao.qebc.INoticeDaoQebc;
import com.lifemenu.dto.NoticeDto;





@Service("noticeService")
public class NoticeServiceImpl implements INoticeService {
	
	@Autowired
    private INoticeDaoQebc noticeDaoQebc;
	@Autowired
	private INoticeDaoMebc noticeDaoMebc;

	private static final String VIEW_PAGE 			= "notice/noticeList";
	private static final String VIEW_DETAIL_PAGE 	= "notice/noticeDetail";

	
	
  //전체조회
  	@Override
  	public String selectMultiNotice(Model model) {
  		
  		
  		List<NoticeDto> noticeList = noticeDaoQebc.selectMultiNotice();
//		int totalCnt = noticeDaoQebc.selectNoticeTotalCount();
		
		model.addAttribute("LIST", noticeList);
//		model.addAttribute("TOTAL_CNT", totalCnt);
//		model.addAttribute("START", pageParamVo.getStart());
//		model.addAttribute("CNT", pageParamVo.getCnt());
		
		System.out.println(noticeList);
		
		return VIEW_PAGE;
  	}

  	
	// 상세 조회
	@Override
	public String selectOneNotice(Model model, String bbscttNo) {

		NoticeDto noticeDto = noticeDaoMebc.selectOneNotice(bbscttNo);
		
		model.addAttribute("NOTICE", noticeDto);
		model.addAttribute("MBER", noticeDto);
//		model.addAttribute("START", pageParamVo.getStart());
//		model.addAttribute("CNT", pageParamVo.getCnt());
		
		return VIEW_DETAIL_PAGE;
		
	}


}
