package com.lifemenu.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lifemenu.dao.mebc.ICoinRepositoryDaoMebc;
import com.lifemenu.dao.mebc.IRefndDaoMebc;
import com.lifemenu.dao.qebc.ICoinRepositoryDaoQebc;
import com.lifemenu.dao.qebc.IRefndDaoQebc;
import com.lifemenu.dto.CoinRepositoryDto;
import com.lifemenu.dto.RefndDto;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-06-09
 * 	Version 	: 0.0.1
 * 
 * 	------보류
 * 	정산관리
 */

@Service("excclcService")
public class ExcclcServiceImpl implements IExcclcService {

	@Autowired
	private IRefndDaoMebc refndDaoMebc;
	@Autowired
	private IRefndDaoQebc refndDaoQebc;
	@Autowired
	private ICoinRepositoryDaoQebc coinRepositoryDaoQebc;
	@Autowired
	private ICoinRepositoryDaoMebc coinRepositoryDaoMebc;
//	@Autowired
//	private IWalletDaoMebc walletDaoMebc;
//	@Autowired
//	private IVoucherDaoMebc voucherDaoMebc;
	
	//환불신청 리스트 조회
	@Override
	public String refndList(Model model) {
		
		List<RefndDto> refndDtoList = refndDaoQebc.selectMultiRefndAtList();
		List<RefndDto> refndDtoAllList = refndDaoQebc.selectMultiRefndAllList();
		model.addAttribute("REFND_AT_LIST", refndDtoList);
		model.addAttribute("REFND_AT_ALL_LIST", refndDtoAllList);
		System.out.println(refndDtoList.toString());
		
		return "admin/excclc/excclcMngr";
	}
	
	//환불승인
	@Override
	public String refndOk(Model model, String setleCode) {
		
		RefndDto refndDto = refndDaoMebc.selectOneRefnd(setleCode);
		
		if(refndDto == null)
		{
			//환불신청 데이터가 없습니다.
		}
		
		refndDaoMebc.updateRefnd(refndDto);
		System.out.println("환불이 완료되었습니다.");
		
		//코인저장소의 마지막데이터 및 총 코인갯수 조회
		CoinRepositoryDto crDto = coinRepositoryDaoQebc.selectOneRepositoryDtlsRownum();
		CoinRepositoryDto setCrDto = new CoinRepositoryDto();

		int crCode = Integer.parseInt(crDto.getDelngCode()) + 1;
		String strCrCode = String.format("%06d", crCode);

		setCrDto.setDelngCode(strCrCode);

		int lastCoin = crDto.getRepositoryCoinCo();
		
		//결제했던 코인
		int setleCoin = refndDto.getRefndPc();
		//코인저장소의 마지막코인 - 결제한 코인
		setCrDto.setRepositoryCoinCo(lastCoin - setleCoin);
//		ResveDto refndMberDto = resveDaoMebc.selectOneResve(setleCode);
//		setCrDto.setMberCode(refndMberDto.getMberCode());
		setCrDto.setDelngSe('W');
		setCrDto.setSetleCode(setleCode);
		setCrDto.setDelngAmount(setleCoin);
		//구매자 코드로 코인저장소 insert
		coinRepositoryDaoMebc.insertCoinRepository(setCrDto);
		
		
		//구매자 지갑 코인 갯수 증감
//		WalletDto walletDto = walletDaoMebc.selectOneMberWallet(refndMberDto.getMberCode());
//		int mberCoin = walletDto.getCoinCo() + setleCoin;
//		System.out.println("현재 구매자 지갑 총코인: " + walletDto.getCoinCo() + " 환불코인: " + setleCoin);
//		System.out.println("구매자 지갑 총코인: " + mberCoin);
//		walletDaoMebc.updateWallet(walletDto.getMberCode(), mberCoin);
		
		//식사권코드 조회
//		String voucherCode = refndDaoQebc.selectOneVoucherCode(refndDto.getSetleCode());
		//식사권코드로 식사권조회
//		VoucherDto voucherDto = voucherDaoMebc.selectOneVoucher(voucherCode);
		//식사권의 거래가능여부 업데이트
//		refndDaoQebc.updateVoucherDelngAt(voucherDto);
		System.out.println("식사권의 거래가능여부가 Y로 업데이트 되었습니다.");
		
		model.addAttribute("REFND_INFO", refndDto);
		
		return "redirect:/excclcMngr.do";
	}

	//환불불가
	@Override
	public String refndNo(Model model, String setleCode) {
		
		RefndDto refndDto = refndDaoMebc.selectOneRefnd(setleCode);
		
		if(refndDto == null)
		{
			//환불신청 데이터가 없습니다.
		}
		
		refndDaoQebc.updateRefndAt(refndDto);
		System.out.println("환불불가 처리되었습니다.");
		
		return "redirect:/excclcMngr.do";
	}
}
