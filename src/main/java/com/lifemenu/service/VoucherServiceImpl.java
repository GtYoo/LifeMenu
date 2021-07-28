package com.lifemenu.service;

import java.util.List;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.lifemenu.dao.mebc.IVoucherDaoMebc;
import com.lifemenu.dao.qebc.IVoucherDaoQebc;
import com.lifemenu.dto.VoucherDto;

@Service("voucherService")
public class VoucherServiceImpl implements IVoucherService {
	
	@Autowired
	private IVoucherDaoMebc mebcVochr;
	
	@Autowired
	private IVoucherDaoQebc qebcVochr;
	
	private static final Logger logger = LoggerFactory.getLogger(VoucherServiceImpl.class);

	// 식사권 상세정보 조회 // 현재 미사용
	@Override
	public String selectOneVoucher(Model model, String vochrCode) {
		logger.info("selectOneVoucher called =============================");
		VoucherDto vochr = mebcVochr.selectOneVoucher(vochrCode);
		
		model.addAttribute("vochr", vochr);
		
		return "voucher/show";
	}
	
	// 식사권 목록 조회
	@Override
	public String selectMultiVoucher(Model model, String mberCode) {
		logger.info("selectMultiVoucher called =============================");
		List<VoucherDto> vochrList = qebcVochr.selectMultiVoucher(mberCode);
		
		model.addAttribute("vochrList", vochrList);
		
		return "voucher/list";
	}

	// 식사권 등록
	@Override
	@Transactional
	public String insertVoucher(VoucherDto vochr) {
		logger.info("insertVoucher called =============================");
		String vochrCode = null;
		String maxCode = qebcVochr.selectMaxVoucherCode();
		if(maxCode == null)
		{
			vochrCode = "0001";
		}
		else
		{
			vochrCode = String.format("%04d", (Integer.parseInt(maxCode)+1));
		}
		
		vochr.setVochrCode(vochrCode);
		
		mebcVochr.insertVoucher(vochr);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("vochr", vochr);
		jsonObj.put("result", true);
		
		String jsonOut = jsonObj.toString();
		
		return jsonOut;
	}

	// 식사권 수정 // 현재 미사용
	@Override
	@Transactional
	public String updateVoucher(VoucherDto vochr) {
		logger.info("updateVoucher called =============================");
		mebcVochr.updateVoucher(vochr);
		return "voucher/list";
	}

	// 식사권 삭제
	@Override
	@Transactional
	public String deleteVoucher(String vochrCode) {
		logger.info("deleteVoucher called =============================");
		mebcVochr.deleteVoucher(vochrCode);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("vochrCode", vochrCode);
		jsonObj.put("result", true);
		
		String jsonOut = jsonObj.toString();
		
		return jsonOut;
	}

}
