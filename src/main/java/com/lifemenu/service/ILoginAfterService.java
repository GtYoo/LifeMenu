package com.lifemenu.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.lifemenu.dto.MberDto;

public interface ILoginAfterService {
	
    public String updateMber(MberDto mberDto, Model model,HttpSession session) throws Exception;	//멤버 정보 수정

    public String updateScenc(MberDto mberDto,HttpSession session) throws Exception;				//회원탈퇴
    
    public String selectOneWalletCoinForm(Model model, HttpSession session);	//회원탈퇴 화면에서 지갑 정보 알기위해서
    
    //상은	
    public String selectMultiMyTransaction(Model model, HttpSession session); 

}
