package com.lifemenu.dao.qebc;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lifemenu.dto.Criteria;
import com.lifemenu.dto.ReviewDto;
import com.lifemenu.dto.SellerConditionDto;
import com.lifemenu.dto.SellerSearchDto;
import com.lifemenu.dto.SellersVoucherPriceDto;

public interface ISellerDaoQebc {
	
	// 판매자의 이미지 목록 조회
	List<String> selectMultiSellerImage(String mberCode);
	
	// 판매자 목록 찾기
	List<SellerSearchDto> selectMultiSeller(@Param("cri") Criteria cri);
	
	// 판매자 목록 찾기(조건 조회)
	List<SellerSearchDto> selectMultiSellerWithCondition(@Param("con")SellerConditionDto con, @Param("cri") Criteria cri);

	// 판매자 상세정보용 닉네임조회;;
	String selectNickName(String mberCode);
	
	// 판매자의 식사권 판매 데이터 조회
	List<SellersVoucherPriceDto> selectMultiSellersVoucherPrice(String mberCode);
	
	// 판매자에 대한 구매자들의 리뷰 조회
	List<ReviewDto> selectMultiReview(String mberCode);
	
	// 판매자에 대한 구매자들의 연령 조회
	List<String> selectMultiPurchaserAge(String mberCode);
	
	// 결제코드로 판매자의 회원코드 조회
	String selectMberCode(String setleCode);

}
