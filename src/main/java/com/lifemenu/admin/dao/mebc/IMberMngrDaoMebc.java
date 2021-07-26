package com.lifemenu.admin.dao.mebc;

import com.lifemenu.dto.MberDto;

// ver.1.0.1

public interface IMberMngrDaoMebc {

	// PK로 단건 조회
	MberDto selectOneMberMngr(String mberCode);
	
}
