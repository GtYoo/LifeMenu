package com.lifemenu.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.lifemenu.dto.ReviewDto;

public interface IReviewService {

	String selectOneReview(Model model, String setleCode);
	
	String registerForm(Model model, HttpSession session, String setleCode);
	
	String insertReview(ReviewDto review);
	
	String updateReview(ReviewDto review);
	
	String deleteReview(HttpSession session, String setleCode);
	
}
