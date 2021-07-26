package com.lifemenu.admin.dao.mebc;

import com.lifemenu.admin.dto.CmmnCodeDto;

// 1.0.0

public interface ICmmnCodeDaoMebc {

	// PK 단건 조회(은행코드를 은행명으로 바꿀 때 사용...)
	CmmnCodeDto selectOneCmmnCode(String cmmnCode);
	
}
