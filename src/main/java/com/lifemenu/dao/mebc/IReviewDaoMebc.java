package com.lifemenu.dao.mebc;

import com.lifemenu.dto.ReviewDto;

public interface IReviewDaoMebc {

	ReviewDto selectOneReview(String setleCode);
	
    void insertReview(ReviewDto review);
    
    void updateReview(ReviewDto review);
    
    void deleteReview(String setleCode);

}
