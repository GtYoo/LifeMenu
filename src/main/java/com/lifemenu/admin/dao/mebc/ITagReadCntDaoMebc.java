package com.lifemenu.admin.dao.mebc;

import com.lifemenu.admin.dto.TagReadCntDto;

public interface ITagReadCntDaoMebc {
	
	TagReadCntDto selectOneTagReadCnt(String tagCode);
	
	void insertTagReadCnt(String tagCode);
	
	void updateTagReadCnt(String tagCode);
	
	void deleteTagReadCnt(String tagCode);

}
