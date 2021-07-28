package com.lifemenu.dao.qebc;

import java.util.ArrayList;

import com.lifemenu.dto.VoucherDto;

public interface IVoucherDaoQebc {
	
	String selectMaxVoucherCode();
	
	ArrayList<VoucherDto> selectMultiVoucher(String mberCode);
}
