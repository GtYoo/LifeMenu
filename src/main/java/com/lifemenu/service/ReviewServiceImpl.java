package com.lifemenu.service;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.lifemenu.dao.mebc.IReviewDaoMebc;
import com.lifemenu.dao.qebc.ISellerDaoQebc;
import com.lifemenu.dto.MberDto;
import com.lifemenu.dto.ReviewDto;

@Service("reviewService")
public class ReviewServiceImpl implements IReviewService {
	
	@Autowired
	private IReviewDaoMebc mebcReview;
	
	@Autowired
	private ISellerDaoQebc qebcSeller;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewServiceImpl.class);

	// 리뷰 단건 조회
	@Override
	public String selectOneReview(Model model, String setleCode) {
		logger.info("selectOneReview called =============================");
		
		ReviewDto review = mebcReview.selectOneReview(setleCode);
		
		if(review == null) {
			return "redirect:/review/register/" + setleCode;
		}
		
		model.addAttribute("review", review);
		
		return "review/show";
	}
	
	// 리뷰 등록 양식
	@Override
	public String registerForm(Model model, HttpSession session, String setleCode) {
		logger.info("registerForm called =============================");
		MberDto dto = (MberDto) session.getAttribute("dto");
		String mberCode = dto.getMberCode();
		
		String selerNcnm = qebcSeller.selectNickName(qebcSeller.selectMberCode(setleCode));
		
		model.addAttribute("selerNcnm", selerNcnm);
		model.addAttribute("mberCode", mberCode);
		
		return "review/register";
	}

	// 리뷰 등록
	@Override
	@Transactional
	public String insertReview(ReviewDto review) {
		logger.info("insertReview called =============================");
		
		review.setReviewCn(review.getReviewCn().replace("\n", "<br>"));
		
		mebcReview.insertReview(review);
		
		return "redirect:/review/show/" + review.getSetleCode();
	}

	// 리뷰 수정
	@Override
	@Transactional
	public String updateReview(ReviewDto review) {
		logger.info("updateReview called =============================");
		
		review.setReviewCn(review.getReviewCn().replace("\n", "<br>"));
		
		mebcReview.updateReview(review);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("review", review);
		
		String jsonOut = jsonObj.toString();
		
		return jsonOut;
	}

	// 리뷰 삭제
	@Override
	@Transactional
	public String deleteReview(HttpSession session, String setleCode) {
		logger.info("deleteReview called =============================");
		MberDto dto = (MberDto) session.getAttribute("dto");
		String mberCode = dto.getMberCode();
		
		if(mberCode.equals(mebcReview.selectOneReview(setleCode).getMberCode())) {
			mebcReview.deleteReview(setleCode);
		}
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("setleCode", setleCode);
		
		String jsonOut = jsonObj.toString();
		
		return jsonOut;
	}


}
