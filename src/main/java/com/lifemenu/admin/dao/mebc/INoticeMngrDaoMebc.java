package com.lifemenu.admin.dao.mebc;

import com.lifemenu.dto.NoticeDto;

// ver.1.0.0

public interface INoticeMngrDaoMebc {

	NoticeDto selectOneNotice(String bbscttNo);
	
	void insertNotice(NoticeDto noticeDto);
	
	void updateNotice(NoticeDto noticeDto);
	
	void deleteNotice(String bbscttNo);
	
}
