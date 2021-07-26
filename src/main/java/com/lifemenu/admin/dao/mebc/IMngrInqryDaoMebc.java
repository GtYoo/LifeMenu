package com.lifemenu.admin.dao.mebc;

import com.lifemenu.admin.dto.MngrInqryDto;

// ver.1.0.0

public interface IMngrInqryDaoMebc {

	MngrInqryDto selectOneMngrInqry(String mngrInqryNo);
	
	void insertMngrInqry(MngrInqryDto mngrInqryDto);
	
	void updateMngrInqry(MngrInqryDto mngrInqryDto);
	
	void deleteMngrInqry(String mngrInqryNo);
	
}
