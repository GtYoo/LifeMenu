package com.lifemenu.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lifemenu.dto.MberDto;
import com.lifemenu.service.ILoginPreService;

//CREATE SEQUENCE seq_mberCode
//START WITH 1
//maxvalue 9999
//INCREMENT BY 1
//nocache;

@Controller
public class LoginPreController {
    
    private static final Logger logger = LoggerFactory.getLogger(LoginPreController.class);
    
    @Autowired
    private ILoginPreService loginPreService;

    @RequestMapping(value="loginMain.do")
	public String adminStart() {
		return "redirect:/start.jsp";
	}
    
    @RequestMapping(value="login.do", method=RequestMethod.POST)
    public String login(HttpSession session,Model model, String id, String pw){	//로그인.do
    	logger.info("login.do called ============");
  
    	String viewPage="";
    	
    	viewPage = loginPreService.selectOneLogin(session, model, id,pw);
    	
    	return viewPage;
    	
    }
    
    @RequestMapping(value="insertPreView")	//회원등록 전 이용약관 페이지로 이동
    public String insertPreView(){	//회원등록 전 이용약관 화면
    	logger.info("insertPreView called ============");
    	return "insertPreView";
    }

    @RequestMapping(value="insertMberView")	//회원가입 페이지로 이동
    public String insertMberView(){	//회원등록 화면
    	logger.info("insertMberView called ============");
    	return "insertMberView";
    }
    
    @RequestMapping(value="insert.do" , method= RequestMethod.POST)
    public String insertMber(MberDto mberDto, int coinCo){	//회원등록.do
        String viewPage = "";
        viewPage = loginPreService.insertMber(mberDto,coinCo);

    	return viewPage;
    }
    
    @RequestMapping(value="findView")	//ID/PW 찾기 페이지로 이동
    public String findView(){	// id, pw 찾기 화면
    	logger.info("findView called ============");
        return "findView";
    }

    @RequestMapping(value="findId.do", method=RequestMethod.POST)	//ID찾기
    public String findId(String mberRlnm, String mberEmail, Model model){	// id 찾기.do
    	String viewPage = "";
   	
    	viewPage = loginPreService.selectOnefindId(mberRlnm, mberEmail, model);
        return viewPage;
    }
    
    @RequestMapping(value="findPw.do", method=RequestMethod.POST)	//PW 찾기 
    public String findPw(String mberId, String mberEmail, Model model){	// pw 찾기.do
    	String viewPage = "";
    	viewPage = loginPreService.selectOnefindPw(mberId, mberEmail,model );
        return viewPage;
    }

    @RequestMapping(value="findUpdatePw.do", method=RequestMethod.POST)	//비번찾고 변경하기 
    public String updatePw(String mberPw, @ModelAttribute("mberCode") String mberCode) throws Exception{	//pw 변경.do
    	String viewPage = "";
    	System.out.println(mberCode);	
       	
    	viewPage = loginPreService.findUpdatePw(mberPw, mberCode);
        return viewPage;
    }

}
