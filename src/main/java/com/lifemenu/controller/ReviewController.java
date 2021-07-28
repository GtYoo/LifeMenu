package com.lifemenu.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lifemenu.dto.ReviewDto;
import com.lifemenu.service.IReviewService;

/*
 * 	Author 		: Ma
 * 
 *  Update Date : 2021-07-05
 * 	Version 	: 0.0.1
 * 
 * 	리뷰 컨트롤러
 */

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private IReviewService reviewService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	// 해당 결제건에 대한 리뷰 조회
	@GetMapping("/show/{setleCode}")
	public String show(Model model, @PathVariable @ModelAttribute("setleCode") String setleCode) {
		logger.info("show called =============================");
		return reviewService.selectOneReview(model, setleCode);
	}
	
	// 리뷰 등록 양식
	@GetMapping("/register/{setleCode}")
	public String registerForm(Model model, HttpSession session, @PathVariable @ModelAttribute("setleCode") String setleCode) {
		logger.info("registerForm called =============================");
		return reviewService.registerForm(model, session, setleCode);
	}
	
	// 리뷰 등록
	@PostMapping("/register")
	public String register(ReviewDto review) {
		logger.info("register called =============================");
		return reviewService.insertReview(review);
	}
	
	// 리뷰 수정 Ajax
	@RequestMapping(value = "/modify/{setleCode}", produces ="application/text;charset=UTF-8",
			method=RequestMethod.POST)
	@ResponseBody
	public String modify(@RequestBody ReviewDto review) {
		logger.info("modify called =============================");
		return reviewService.updateReview(review);
	}
	
	// 리뷰 삭제 Ajax
	@RequestMapping(value = "/remove/{setleCode}", produces ="application/text;charset=UTF-8",
			method=RequestMethod.GET)
	@ResponseBody
	public String remove(HttpSession session, @PathVariable String setleCode) {
		logger.info("remove called =============================");
		return reviewService.deleteReview(session, setleCode);
	}

}
