package com.lifemenu.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.lifemenu.dto.Criteria;
import com.lifemenu.dto.SellerConditionDto;
import com.lifemenu.dto.SellerDto;

public interface ISellerService {
	
	String selectOneSeller(Model model, String mberCode);
	
	String selectOneMySeller(Model model, HttpSession session);
	
	String selectMultiSeller(Model model, Criteria cri);
	
	String selectMultiSellerWithCondition(Model model, Criteria cri, SellerConditionDto con);
	
	String selectMultiSellerWithAjax(Criteria cri, SellerConditionDto con);
	
	String insertFormService(Model model, HttpSession session);
	
	String insertSeller(HttpSession session, SellerDto seler, List<String> tagList, MultipartFile[] uploadFile);
	
	String updateSeller(HttpSession session, SellerDto seler, List<String> tagList, MultipartFile[] uploadFile);
	
	String deleteSeller(String mberCode);
	
}
