package com.lifemenu.dao.mebc;

import org.apache.ibatis.annotations.Param;

public interface ITagSearchDaoMebc {
	
	void insertTagSearch(@Param("mberCode") String mberCode, @Param("tagCode") String tagCode);
	
	void deleteTagSearch(String mberCode);

}
