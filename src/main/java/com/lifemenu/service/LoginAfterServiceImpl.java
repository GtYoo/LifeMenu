package com.lifemenu.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.lifemenu.dao.mebc.ILoginAfterDaoMebc;
import com.lifemenu.dao.mebc.IWalletDaoMebc;
import com.lifemenu.dao.qebc.ILoginAfterDaoQebc;
import com.lifemenu.dto.MberDto;
import com.lifemenu.dto.TransactionListDto;
import com.lifemenu.dto.WalletDto;

@Service("loginAfterService")
public class LoginAfterServiceImpl implements ILoginAfterService {
    
	@Autowired
	private ILoginAfterDaoMebc loginAfterDaoMebc;
	
	@Autowired
	private ILoginAfterDaoQebc loginAfterDaoQebc;
	
	@Autowired
	private IWalletDaoMebc walletDaoMebc;
	
	@Override
    @Transactional
    public String updateMber(MberDto mberDto, Model model, HttpSession session) throws Exception{ //회원정보수정

    	String code = mberDto.getMberCode();
    	
    	MberDto checkDto = loginAfterDaoMebc.selectOneMber(code);
    	
    	if(checkDto == null) {
    		System.out.println("정보수정 할 dto 멤버가 없다.(코드 못찾는다)");
    		throw new Exception();
    	}

    	loginAfterDaoMebc.updateMber(mberDto);
    	System.out.println("update완료됨");
    	session.setAttribute("dto", mberDto);
    	model.addAttribute("dto", mberDto);//업데이트한 dto 넘김
    	
        return "redirect:/seller/list";
    }
	
    @Override
    @Transactional
    public String updateScenc(MberDto mberDto, HttpSession session) throws Exception{	//회원탈퇴
    	
    	String code = mberDto.getMberCode();
    	
    	MberDto checkDto = loginAfterDaoMebc.selectOneMber(code);
    	
    	if(checkDto == null) {
    		System.out.println("정보수정 할 dto 멤버가 없다.(코드 못찾는다)");
    		throw new Exception();
    	}
    		
    	loginAfterDaoMebc.updateScenc(code);
    	
    	session.invalidate();
        return "redirect:/start.jsp";
    }
    
	@Override
	public String selectOneWalletCoinForm(Model model, HttpSession session) {
		
		MberDto mberDto = (MberDto) session.getAttribute("dto");
		
		WalletDto walletDto = walletDaoMebc.selectOneMberWallet(mberDto.getMberCode());
		
		model.addAttribute("WALLET_INFO", walletDto);
		
		return "scencView";
	}
    
    //상은
	@Override
	public String selectMultiMyTransaction(Model model, HttpSession session) {
		
		MberDto mberDto = (MberDto) session.getAttribute("dto");
		List<TransactionListDto> tlDto = loginAfterDaoQebc.selectMultiMyTransaction(mberDto.getMberCode());
		List<TransactionListDto> tlSellDto = loginAfterDaoQebc.selectMultiMySellList(mberDto.getMberCode());

		if(tlDto == null)
		{
			model.addAttribute("T_LIST", tlDto);
			return "err/resveSetleErr";
		}
		
		model.addAttribute("T_LIST", tlDto);
		model.addAttribute("SELL_LIST", tlSellDto);
		
		return "transactionHistoryView";
	}
}
