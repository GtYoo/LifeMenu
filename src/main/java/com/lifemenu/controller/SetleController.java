package com.lifemenu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lifemenu.dto.SetleDto;
import com.lifemenu.service.ISetleService;

@Controller
@RequestMapping("/Setle")
public class SetleController {

	@Autowired
	private ISetleService setleService;
	
	//식사권정보 및 결제진행페이지
	@RequestMapping("/setleBeForm")
	public String setleBeForm(Model model, @RequestParam(value="VOUCHER_CODE") String voucherCode,
			@RequestParam(value="MBER_CODE") String mberCode) {
		
		return setleService.selectOneVoucher(model, voucherCode, mberCode);
	}
	
	//결제페이지
	@RequestMapping("/setleForm")
	public String setleForm(Model model, @RequestParam(value="SELER_CODE") String selerCode,
			@RequestParam(value="DELNG_CODE") String delngCode, @RequestParam(value="VOCHR_CODE") String vochrCode) {
		
		return setleService.selectOneSetle(model, selerCode, delngCode, vochrCode);
	}
	
	//결제진행
	@RequestMapping("insertSetle")
	public String insertSetle(Model model, SetleDto setleDto) throws Exception {
		
		return setleService.insertSetle(model, setleDto);
	}
	
	//구매확정
	@RequestMapping("puDcAt")
	public String purchsDcsnAt(Model model, @RequestParam(value="SETLE_CODE") String setleCode) throws Exception {
		return setleService.purchsDcsn(model, setleCode);
	}
}
