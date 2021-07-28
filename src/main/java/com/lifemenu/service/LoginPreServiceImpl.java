package com.lifemenu.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.lifemenu.dao.mebc.ILoginPreDaoMebc;
import com.lifemenu.dao.qebc.ILoginPreDaoQebc;
import com.lifemenu.dto.MberDto;
import com.lifemenu.dto.WalletDto;

@Service("loginPreService")	
public class LoginPreServiceImpl implements ILoginPreService {
	
	@Autowired
    private ILoginPreDaoQebc loginPreDaoQebc;
	@Autowired
    private ILoginPreDaoMebc loginPreDaoMebc;
//	@Autowired
//	private ILoginPreHistDaoMebc histDao;	//아직 인서트히스트는 안해놨음.

	@Override
	public String selectOneLogin(HttpSession session, Model model, String id, String pw) {

		String adminLevel 	= "3";	//관리자 레벨
		
		
		MberDto dto = loginPreDaoQebc.selectOneLogin(id, pw);

		if(dto == null)
		{
			model.addAttribute("msg","ID나 PW 가 틀립니다.");
			return "forward:/start.jsp";
		}
		else if("Y".equals(dto.getMberSecsnAt())) {
			model.addAttribute("msg","회원탈퇴 처리 된 계정입니다.");
			return "forward:/start.jsp";
		}
    	
		else if(adminLevel.equals(dto.getMberAuthorLevel())) {
    		session.setAttribute("dto", dto);
    		
    		return "redirect:/adminMain.do";
    	}

    	session.setAttribute("dto", dto);

//    	return "ok";
		return "redirect:/seller/list";
	}
    
    @Override
	public MberDto selectOneMber(String mberCode) {	//단건조회용
		MberDto dto = loginPreDaoMebc.selectOneMber(mberCode);
		return dto;
	}
    
    @Override
    @Transactional
    public String insertMber(MberDto mberDto, int coinCo){	//회원가입
    	
    	MberDto maxCodeDto = loginPreDaoQebc.selectOneMberRownum();
    	
    	if(maxCodeDto == null) { 	//전체조회했는데 없으면
    		mberDto.setMberCode("0001");		//코드를 1로 설정	
    		System.out.println(mberDto.getMberCode());
    	}
    	else {								//전체조회했는데 있으면
    		int mberCode = Integer.parseInt(maxCodeDto.getMberCode()) +1;	//찾은데이터를 integer로 바꾸고 +1
    		String strMberCode = String.format("%04d", mberCode);
    		System.out.println(strMberCode);
    		mberDto.setMberCode(strMberCode);	//+1 한 데이터를 String으로 변경
 
    	}
    	//코인 수 0 으로 넣기위해.
		WalletDto walletDto = new WalletDto();
		walletDto.setMberCode(mberDto.getMberCode());
		walletDto.setCoinCo(coinCo);

        loginPreDaoMebc.insertMber(mberDto);
        loginPreDaoMebc.insertCoinCo(walletDto);	// 해당코드에 지갑테이블 인서트 치는 것
    	return "redirect:/start.jsp";
    }

    @Override
    public String selectOnefindId(String mberRlnm, String mberEmail, Model model){	//아이디 찾기
    	MberDto dtoResult = loginPreDaoQebc.selectOnefindId(mberRlnm, mberEmail);
    	
    	if(dtoResult == null) {
    		model.addAttribute("ERRMSG", "해당하는 아이디는 존재하지 않습니다.");
    		return "findView";
    	}
    	
    	model.addAttribute("MSG1", "회원님의 아이디는");
    	model.addAttribute("MSG2", "입니다.");
    	model.addAttribute("DATA", dtoResult.getMberId());
//    	return "findIdResultView";
    	return "findView";
    }

    @Override
    public String selectOnefindPw(String mberId, String mberEmail, Model model){	//비번찾기
    	MberDto dtoResult = loginPreDaoQebc.selectOnefindPw(mberId, mberEmail);
    	
    	if(dtoResult == null) {
    		model.addAttribute("PWMSG","가입하지 않은 정보이거나, 잘못 입력하셨습니다.");
    		return "findView";
    	}
    	model.addAttribute("DATA",dtoResult); //비밀번호 찾기 했을때 단건조회 결과 들어있음.
    	
    	return "findPwResultView";
    	
    }
    
    @Override
    @Transactional
    public String findUpdatePw(String mberPw, String mberCode ) throws Exception{	//아이디 비번 찾기에서 비밀번호 업데이트
    	MberDto dto = loginPreDaoMebc.selectOneMber(mberCode);	//단건조회
//    	System.out.println(dto);
    	
    	if(dto == null)
    	{
    		System.out.println("말이 안되는 오류 : 정보가 있어서 findUpdatePw로 왔기때문");
    		throw new Exception();  		
    	}
    	
    	loginPreDaoMebc.findUpdatePw(mberPw, mberCode);
        return "redirect:/start.jsp";	
    }

}
