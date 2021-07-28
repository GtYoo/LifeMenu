package com.lifemenu.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lifemenu.dto.MberDto;
import com.lifemenu.dto.VoucherDto;
import com.lifemenu.service.IVoucherService;

/*
 * 	Author 		: Ma
 * 
 *  Update Date : 2021-07-05
 * 	Version 	: 0.0.1
 * 
 * 	식사권 컨트롤러
 */

@Controller
@RequestMapping("/voucher")
public class VoucherController {
	
	@Autowired
	private IVoucherService voucherService;
	
	private static final Logger logger = LoggerFactory.getLogger(VoucherController.class);
	
	// 식사권 정보 상세조회 // 현재 미사용
	@GetMapping("/show/{vochrCode}")
	public String show(Model model, @PathVariable String vochrCode) {
		logger.info("show called =============================");
		return voucherService.selectOneVoucher(model, vochrCode);
	}
	
	// 해당 판매자의 식사권 목록 조회
	@GetMapping("/list/{mberCode}")
	public String list(Model model, @PathVariable String mberCode) {
		logger.info("list called =============================");
		return voucherService.selectMultiVoucher(model, mberCode);
	}
	
	// 나의 식사권 목록 조회
	@GetMapping("/mylist")
	public String mylist(Model model, HttpSession session) {
		logger.info("mylist called =============================");
		MberDto dto = (MberDto) session.getAttribute("dto");
		String mberCode = dto.getMberCode();
		voucherService.selectMultiVoucher(model, mberCode);
		return "voucher/mylist";
	}
	
	// 식사권 등록 양식
	@GetMapping("/register")
	public String registerForm(Model model, HttpSession session) {
		logger.info("registerForm called =============================");
		MberDto dto = (MberDto) session.getAttribute("dto");
		String mberCode = dto.getMberCode();
		model.addAttribute("mberCode", mberCode);
		return "voucher/register";
	}
	
	// 식사권 등록 Ajax
	@RequestMapping(value = "/register", produces ="application/text;charset=UTF-8",
			method=RequestMethod.POST)
	@ResponseBody
	public String register(@RequestBody VoucherDto vochr) {
		logger.info("register called =============================");
		return voucherService.insertVoucher(vochr);
	}
	
	// 식사권 수정 // 현재 미사용
	@PostMapping("/modify")
	public String modify(VoucherDto vochr) {
		logger.info("modify called =============================");
		return voucherService.updateVoucher(vochr);
	}
	
	// 식사권 삭제 Ajax
	@RequestMapping(value = "/remove/{vochrCode}", produces ="application/text;charset=UTF-8",
			method=RequestMethod.GET)
	@ResponseBody
	public String remove(@PathVariable String vochrCode) {
		logger.info("remove called =============================");
		return voucherService.deleteVoucher(vochrCode);
	}
	
}
