package com.lifemenu.admin.dto;

import com.lifemenu.dto.MberDto;
import com.lifemenu.dto.SellerDto;

public class MberMngrDto {
	
	private MberDto mberDto;		// 회원 Dto
	private SellerDto sellerDto;	// 판매자 Dto
	
	public MberDto getMberDto() {
		return mberDto;
	}
	public void setMberDto(MberDto mberDto) {
		this.mberDto = mberDto;
	}
	public SellerDto getSellerDto() {
		return sellerDto;
	}
	public void setSellerDto(SellerDto sellerDto) {
		this.sellerDto = sellerDto;
	}
	
}
