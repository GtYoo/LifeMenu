package com.lifemenu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lifemenu.dto.Criteria;
import com.lifemenu.dto.SellerConditionDto;
import com.lifemenu.dto.SellerDto;
import com.lifemenu.service.ISellerService;

/*
 * 	Author 		: Ma
 * 
 *  Update Date : 2021-07-05
 * 	Version 	: 0.0.1
 * 
 * 	판매자 컨트롤러
 */

@Controller
@RequestMapping("/seller")
public class SellerController {

	@Autowired
	private ISellerService sellerService;

	private static final Logger logger = LoggerFactory.getLogger(SellerController.class);

	// 판매자 정보 상세조회
	@GetMapping("/show/{mberCode}")
	public String show(Model model,@PathVariable String mberCode) {
		logger.info("get called =============================");
		return sellerService.selectOneSeller(model, mberCode);
	}

	// 나의 판매자 정보 조회
	@GetMapping("/myinfo")
	public String myinfo(Model model, HttpSession session) {
		logger.info("myinfo called =============================");
		return sellerService.selectOneMySeller(model, session);
	}
	
	// 판매자 목록 조회
	@GetMapping("/list")
	public String list(Model model, Criteria cri) {
		logger.info("list called =============================");
		return sellerService.selectMultiSeller(model, cri);
	}

	// 판매자 목록 조건 조회
	@GetMapping("/result")
	public String listByCondition(Model model, Criteria cri, SellerConditionDto con) {
		logger.info("result called =============================");
		sellerService.selectMultiSellerWithCondition(model, cri, con);
		return "seller/list";
	}
	
	// 판매자 목록 Ajax로 추가 조회
	@RequestMapping(value = "/listByAjax", produces ="application/text;charset=UTF-8",
			method=RequestMethod.GET)
	@ResponseBody
	public String listByAjax(Criteria cri, SellerConditionDto con) {
		logger.info("listByAjax called =============================");
		return sellerService.selectMultiSellerWithAjax(cri, con);
	}

	// 판매자 정보 등록 양식 
	@GetMapping("/register")
	public String registerForm(Model model, HttpSession session) {
		logger.info("registerform called =============================");
		return sellerService.insertFormService(model, session);
	}

	// 판매자 정보 등록
	@PostMapping("/register")
	public String register(HttpSession session, SellerDto seler, @RequestParam(name="tagList") List<String> tagList, MultipartFile[] uploadFile) {
		logger.info("register called =============================");
		return sellerService.insertSeller(session, seler, tagList, uploadFile);
	}

	// 판매자 정보 수정 양식
	@GetMapping("/modify")
	public String modifyForm(Model model, HttpSession session) {
		logger.info("modifyForm called =============================");
		sellerService.selectOneMySeller(model, session);
		return "seller/modify";
	}

	// 판매자 정보 수정
	@PostMapping("/modify")
	public String modify(HttpSession session, SellerDto seler, @RequestParam(name="tagList") List<String> tagList, MultipartFile[] uploadFile) {
		logger.info("modifyForm called =============================");
		return sellerService.updateSeller(session, seler, tagList, uploadFile);
	}

	//판매자 정보 삭제
	@PostMapping("/remove")
	public String remove(String mberCode) {
		return null;
	}
	
}
