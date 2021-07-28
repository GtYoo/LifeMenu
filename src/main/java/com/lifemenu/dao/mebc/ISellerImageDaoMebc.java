package com.lifemenu.dao.mebc;

import com.lifemenu.dto.SellerImageDto;

public interface ISellerImageDaoMebc {
	
	String selectOneSellerImage(String mberCode);
	
	void insertSellerImage(SellerImageDto selerImage);
	
	void deleteSellerImage(String mberCode);

}
