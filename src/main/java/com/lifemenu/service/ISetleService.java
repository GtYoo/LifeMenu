package com.lifemenu.service;

import org.springframework.ui.Model;

import com.lifemenu.dto.SetleDto;

public interface ISetleService {
	
	//식사권조회
	String selectOneVoucher(Model model, String voucherCode, String mberCode);
	
	//결제페이지출력
	String selectOneSetle(Model model, String selerCode, String delngCode, String vochrCode);
	
	//결제
	String insertSetle(Model model, SetleDto setleDto) throws Exception;
	
	//구매확정
	String purchsDcsn(Model modle, String setleCode) throws Exception;
	
}
