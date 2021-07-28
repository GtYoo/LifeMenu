package com.lifemenu.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lifemenu.dto.MberDto;
import com.lifemenu.service.ILoginAfterService;

@Controller
public class LoginAfterController {
    
    private static final Logger logger = LoggerFactory.getLogger(LoginAfterController.class);
    
    @Autowired
    private ILoginAfterService loginAfterService;

    @RequestMapping(value="myPageView")
    public String myPageView(){	//회원정보수정 화면
    	logger.info("myPageView called ============");
        return "myPageView";
    }
    @RequestMapping(value="updateMberView")
    public String updateMberView(){	//회원정보수정 화면
    	logger.info("updateMberView called ============");
        return "updateMberView";
    }
    @PostMapping(value="update.do")
    public String updateMber(MberDto mberDto, Model model, HttpSession session) throws Exception{	// 회원수정.do
    	logger.info("update.do called ============");
    	String viewPage = "";
    	viewPage = loginAfterService.updateMber(mberDto, model, session);
    	return viewPage;
    }
    @RequestMapping(value="scencView")
    public String updateScencView(Model model, HttpSession session){	// 회원탈퇴 화면
    	logger.info("updateScencView called ============");
    	
        return loginAfterService.selectOneWalletCoinForm(model, session);
    }
    @PostMapping(value="updateScenc.do")
    public String updateScenc(MberDto mberDto, HttpSession session) throws Exception{	// 회원탈퇴 여부 변경.do
    	logger.info("updateScenc.do called ============");
    	String viewPage ="";
    	
    	viewPage = loginAfterService.updateScenc(mberDto, session);
        return viewPage;
    }
    //상은
    @RequestMapping(value="transactionList")
    public String transactionListForm(Model model, HttpSession session) {
    	
    	return loginAfterService.selectMultiMyTransaction(model, session);
    }

}
