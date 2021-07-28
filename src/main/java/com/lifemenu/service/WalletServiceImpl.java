package com.lifemenu.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.lifemenu.dao.mebc.IWalletDaoMebc;
import com.lifemenu.dao.qebc.IWalletDaoQebc;
import com.lifemenu.dto.MberDto;
import com.lifemenu.dto.WalletDtlsDto;
import com.lifemenu.dto.WalletDto;

@Service("walletService")	
public class WalletServiceImpl implements IWalletService {
	
	@Autowired
    private IWalletDaoQebc walletDaoQebc;
	@Autowired
    private IWalletDaoMebc walletDaoMebc;
	
	
	@Override
	public MberDto selectOneMber(String mberCode) {
		MberDto dto = walletDaoMebc.selectOneMber(mberCode);
		return dto;
	}
	
	@Override
	public String selectMultiWalletDtls(HttpSession session, Model model) {	//거래내역 조회
		List<Object> list = null;
		
		MberDto dto = (MberDto) session.getAttribute("dto");
    	
   	 String mberCode = dto.getMberCode();
   	 WalletDto walletDto = selectOneMberWallet(mberCode);
   	 int havedCoinCo = walletDto.getCoinCo();
   	 
		list = walletDaoQebc.selectMultiWalletDtls(mberCode);
		if(list.size() == 0) {
   		 model.addAttribute("walletDtlsMsg","거래내역이 존재 하지 않습니다.");
   	 	}
		
		model.addAttribute("COIN", havedCoinCo);
   	 	model.addAttribute("LIST", list);
   	 	
		return "walletView";
	}
	
	@Override
	public WalletDto selectOneMberWallet(String mberCode) {//회원 지갑 정보
		WalletDto walletDto = walletDaoMebc.selectOneMberWallet(mberCode);
		return walletDto;
	}
	
	
	@Override
	@Transactional
	public String deposit(HttpSession session, WalletDtlsDto walletDtlsDto) throws Exception{
		int coinCo = 0;		//선택한 금액에 대한 코인
		int havedCoinCo;	//가지고 있던 코인
		int totalCoinCo;	//가지고있던것 + 입금한 금액에 대한 코인
		
		String mberCode = walletDtlsDto.getMberCode();	//멤버 코드 구하기

	    MberDto dto = selectOneMber(mberCode);	//멤버코드로  회원 단건조회
	       
	    if(dto == null) 
	    {
	       	System.out.println("해당 회원코드의 회원은 존재하지 않음.");
	       	throw new Exception();
	    }
	        
		WalletDto walletDto = selectOneMberWallet(walletDtlsDto.getMberCode());	//지갑 가져오기
        if(walletDto == null)
        {
        	System.out.println("해당 회원코드의 지갑이 없음");
        	throw new Exception();
        }
        
        System.out.println("원래가지고 있던 보유코인 = " + walletDto.getCoinCo());
        havedCoinCo = walletDto.getCoinCo();

        int  selectedRcppayAmount = walletDtlsDto.getRcppayAmount();	// 입금페이지에서 선택했던 금액
        System.out.println("서비스에서 일하는중.. 입금페이지에서 선택했던 금액 = " + selectedRcppayAmount);
        
        coinCo = changeCoin(selectedRcppayAmount);//입금했던 금액을 코인으로
        walletDtlsDto.setExcngCoinCo(coinCo);
        
        totalCoinCo = havedCoinCo + coinCo;
   
		walletDaoMebc.insertWalletDtls(walletDtlsDto);	//거래내역 인서트
		walletDaoMebc.updateWallet(walletDtlsDto.getMberCode(), totalCoinCo);	//지갑 코인 업데이트
		
		return "redirect:/walletView";
	}

	@Override
	@Transactional
	public String withdraw(HttpSession session, WalletDtlsDto walletDtlsDto) throws Exception {
	
		int coinCo = 0;		//선택한 금액에 대한 코인
		int havedCoinCo;	//가지고 있던 코인
		int totalCoinCo;	//가지고있던것 + 출금한 금액에 대한 코인
		
		 String mberCode = walletDtlsDto.getMberCode();	//멤버 코드 구하기
	        
	     MberDto dto = selectOneMber(mberCode);	//멤버코드로  회원 단건조회
	        
	     if(dto == null) 
	     {
	    	System.out.println("해당 회원코드의 회원은 존재하지 않음.");
	        throw new Exception();
	     }

		WalletDto walletDto = selectOneMberWallet(walletDtlsDto.getMberCode());	//지갑 가져오기
        if(walletDto == null)
        {
        	System.out.println("해당 회원코드의 지갑이 없음");
        	throw new Exception();
        }
        
        System.out.println("원래가지고 있던 보유코인 = " + walletDto.getCoinCo());
        havedCoinCo = walletDto.getCoinCo();

        int  money = walletDtlsDto.getRcppayAmount();	// 출금페이지에서 입력했던 금액
        System.out.println("서비스에서 일하는중.. 출금페이지에서 선택했던 금액 = " + money);
        
        coinCo = changeCoin(money);//출금했던 금액을 코인으로
        walletDtlsDto.setExcngCoinCo(coinCo);
        
        totalCoinCo = havedCoinCo - coinCo;
   
		walletDaoMebc.insertWalletDtls(walletDtlsDto);	//거래내역 인서트
		walletDaoMebc.updateWallet(walletDtlsDto.getMberCode(), totalCoinCo);	//지갑 코인 업데이트
		
		return "redirect:/walletView";
	}

	@Override
	public int changeCoin(int selectedRcppayAmount) {	//금액에 따라 코인으로 바꿔주는거
		
		int coinCo = 0;
		
		if(selectedRcppayAmount == 10000)	//입금 금액이 만원 이면 코인 한개
		{
			coinCo = 1;
		}
		else if(selectedRcppayAmount == 20000)
		{
			coinCo = 2;
		}
		else if(selectedRcppayAmount == 30000)
		{
			coinCo = 3;
		}
		else if(selectedRcppayAmount == 50000)
		{
			coinCo = 5;
		}
		else if(selectedRcppayAmount == 100000)
		{
			coinCo = 10;
		}
		else if(selectedRcppayAmount == 200000)
		{
			coinCo = 20;
		}
		
		return coinCo;
	}
	
	@Override
	public  int changeMoney(int coinCo)	//코인을 받아서 돈으로 바꿔주는 거
	{
	
		int money = 0;
		
		for(int i=0; i < coinCo; i++ ) {
			money += 10000;
		}
		
		return money;
	}

	@Override
	@Transactional
	public String updateMberAcountNo(HttpSession session, String mberAcountNo) throws Exception {	//출금계좌번호 등록
		MberDto dto = (MberDto) session.getAttribute("dto");
		   	 
	   	String mberCode = dto.getMberCode();
	   	
		MberDto mberDto = walletDaoMebc.selectOneMber(mberCode);
		
		if(mberDto == null) {
			System.out.println("로그인이 되지않아서 오류뜨겠지");
			throw new Exception();
		}
		
		walletDaoMebc.updateMberAcountNo(mberCode, mberAcountNo);	//계좌번호 업데이트
		dto.setMberAcountNo(mberAcountNo); //dto에 계좌번호 set
		session.setAttribute("dto", dto);	//세션에 dto set
		
		return "redirect:/walletView";
	}
}
