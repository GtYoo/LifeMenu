package com.lifemenu.dao.mebc;

import com.lifemenu.dto.SellerDto;

public interface ISellerDaoMebc {
	
	SellerDto selectOneSeller(String mberCode);
	
	void insertSeller(SellerDto seler);
	
	void updateSeller(SellerDto seler);
	
	void deleteSeller(String mberCode);

}
