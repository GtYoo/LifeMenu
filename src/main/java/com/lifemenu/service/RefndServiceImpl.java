package com.lifemenu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lifemenu.dao.mebc.ILoginPreDaoMebc;
import com.lifemenu.dao.mebc.IRefndDaoMebc;
import com.lifemenu.dao.mebc.ISellerImageDaoMebc;
import com.lifemenu.dao.mebc.ISetleDaoMebc;
import com.lifemenu.dao.mebc.IVoucherDaoMebc;
import com.lifemenu.dao.qebc.ISetleDaoQebc;
import com.lifemenu.dto.MberDto;
import com.lifemenu.dto.RefndDto;
import com.lifemenu.dto.SetleDto;
import com.lifemenu.dto.VoucherDto;

@Service("refndService")
public class RefndServiceImpl implements IRefndService{
	
	@Autowired
	private IRefndDaoMebc refndDaoMebc;
	@Autowired
	private IVoucherDaoMebc voucherDaoMebc;
	@Autowired
	private ISetleDaoMebc setleDaoMebc;
	@Autowired
	private ISetleDaoQebc setleDaoQebc;
	@Autowired
	private ISellerImageDaoMebc sellerImageDaoMebc;
	@Autowired
	private ILoginPreDaoMebc loginPreDaoMebc;
	
	//환불페이지 출력
	@Override
	public String selectOneSetle(Model model, String setleCode) {
		
		//결제코드로 식사권코드 조회

		//결제코드로 판매자코드 조회
		String selerCode = setleDaoQebc.selectSelerCode(setleCode);
		//결제코드로 결제내역조회
		SetleDto setleDto = setleDaoMebc.selectOneSetle(setleCode);
		//식사권코드로 식사권조회
		VoucherDto voucherDto = voucherDaoMebc.selectOneVoucher(setleDto.getVochrCode());
		//판매자코드로 판매자이미지조회
		String adres = sellerImageDaoMebc.selectOneSellerImage(selerCode);
		adres = adres.replace("\\", "/");
		//판매자코드로 판매자회원정보조회
		MberDto mberDto = loginPreDaoMebc.selectOneMber(selerCode);
		//식사예정일 날짜처리
		String voucherDay = voucherDto.getMealPrearngeDt();
		String voucherDayst;
		voucherDayst = voucherDay.substring(0, 4) + "년 " + voucherDay.substring(4, 6) + "월 "
				+ voucherDay.substring(6, 8) + "일 " + voucherDay.substring(8, 10) + "시 " + 
				voucherDay.substring(10, 12) + "분 ";
		
		model.addAttribute("SETLE_INFO", setleDto);
		model.addAttribute("SELER_IMAGE", adres);
		model.addAttribute("VOUCHER_MEALDT", voucherDayst);
		model.addAttribute("VOUCHER_INFO", voucherDto);
		model.addAttribute("SELER_INFO", mberDto);

		return "refnd/refndForm";
	}
	
	//환불
	@Override
	public String insertRefnd(Model model, RefndDto refndDto) throws Exception {
		
		SetleDto setleDto = setleDaoMebc.selectOneSetle(refndDto.getSetleCode());
		
		if(setleDto == null)
		{
			model.addAttribute("SETLE_DTO", setleDto);
			return "err/resveSetleErr";
		}
		
		RefndDto refndDtoConfirm = refndDaoMebc.selectOneRefnd(refndDto.getSetleCode());
		
		if(refndDtoConfirm == null)
		{
			;
		}
		else
		{
			model.addAttribute("REFND", refndDtoConfirm);
			return "err/resveSetleErr";
		}
		String strDate = setleDto.getSetleDt();
		String setleDate = strDate.substring(0, 10);
		setleDto.setSetleDt(setleDate);
		
		//결제테이블 환불신청여부업뎃
		setleDaoMebc.updateRefndReqst(setleDto);
		System.out.println("환불신청여부 업데이트 완료");
		//환불테이블 등록
		refndDaoMebc.insertRefnd(refndDto);
		System.out.println("환불신청 완료");
		
		return "refnd/refndConfirm";
	}

}
