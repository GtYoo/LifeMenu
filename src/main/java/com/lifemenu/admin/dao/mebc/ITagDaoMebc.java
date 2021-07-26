package com.lifemenu.admin.dao.mebc;

import com.lifemenu.admin.dto.TagDto;

public interface ITagDaoMebc {
	
	TagDto selectOneTag(String tagCode);
	
	void insertTag(TagDto tag);
	
	void updateTag(TagDto tag);
	
	void deleteTag(String tagCode);

}
