package com.lifemenu.dao.mebc;

import com.lifemenu.dto.VoucherDto;

public interface IVoucherDaoMebc {

	VoucherDto selectOneVoucher(String vochrCode);
	
	void insertVoucher(VoucherDto vochr);
	
	void updateVoucher(VoucherDto vochr);
	
	void deleteVoucher(String vochrCode);
}
