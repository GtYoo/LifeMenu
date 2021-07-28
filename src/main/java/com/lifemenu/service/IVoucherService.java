package com.lifemenu.service;

import org.springframework.ui.Model;

import com.lifemenu.dto.VoucherDto;

public interface IVoucherService {
	
	String selectOneVoucher(Model model, String vochrCode);
	
	String selectMultiVoucher(Model model, String mberCode);
	
	String insertVoucher(VoucherDto vochr);
	
	String updateVoucher(VoucherDto vochr);
	
	String deleteVoucher(String vochrCode);
	
}
