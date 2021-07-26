package com.lifemenu.admin.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lifemenu.admin.dao.qebc.ICoinRepositoryHistDaoQebc;
import com.lifemenu.admin.dao.qebc.IRefndHistDaoQebc;
import com.lifemenu.admin.dao.qebc.ISetleHistDaoQebc;
import com.lifemenu.admin.dao.qebc.IVochrHistDaoQebc;
import com.lifemenu.admin.dao.qebc.IWalletDtlsHistDaoQebc;
import com.lifemenu.admin.dto.HistMngrDto;
import com.lifemenu.admin.dto.hist.CoinRepositoryHistDto;
import com.lifemenu.admin.dto.hist.RefndHistDto;
import com.lifemenu.admin.dto.hist.SetleHistDto;
import com.lifemenu.admin.dto.hist.VochrHistDto;
import com.lifemenu.admin.dto.hist.WalletDtlsHistDto;
import com.lifemenu.admin.vo.HistoryParamVo;
import com.lifemenu.cmmn.IAdminCommons;

@Service("histService")
@Aspect
public class HistServiceImpl implements IHistService {
	
	@Autowired
	private IVochrHistDaoQebc 		vochrHistDaoQebc;
	@Autowired
	private ISetleHistDaoQebc 		setleHistDaoQebc;
	@Autowired
	private IRefndHistDaoQebc 		refndHistDaoQebc;
	@Autowired
	private IWalletDtlsHistDaoQebc 	walletDtlsHistDaoQebc;
	@Autowired
	private ICoinRepositoryHistDaoQebc coinRepositoryHistDaoQebc;
	@Autowired
	private IAdminCommons adminCommons;

	private static final Logger logger = LoggerFactory.getLogger(HistServiceImpl.class);
	
	private static final String VIEW_PAGE = "admin/hist/histMngr";
	private static final int 	PAGE_SIZE = 5;

	@Override
	public String selectMultiHistByCondition(Model model, HistoryParamVo historyParamVo) {
		
		// 출력해야할 목록
		// list.1. 식사권 히스토리
		// list.2. 예약결제 히스토리
		// list.3. 환불 히스토리
		// list.4. 지갑내역 히스토리
		// list.5. 코인저장소 히스토리
		
		adminCommons.convertCondition(historyParamVo);

		String condition = historyParamVo.getCondition();
		if(Pattern.matches("%\\d+%", condition)) {
			String sStartDt = condition.replace('%', ' ').trim();
			historyParamVo.setStartRcordDt(adminCommons.convertDate(sStartDt));
			int year = Integer.parseInt(sStartDt.substring(0, 4));
			String sEndDt = String.valueOf(year+1)+sStartDt.substring(4);
			historyParamVo.setEndRcordDt(adminCommons.convertDate(sEndDt));
		}
		else if(Pattern.matches("%\\d+-\\d+%", historyParamVo.getCondition())) {
			String rcordDt[] = condition.replace('%', ' ').trim().split("-");
			historyParamVo.setStartRcordDt(adminCommons.convertDate(rcordDt[0]));
			historyParamVo.setEndRcordDt(adminCommons.convertDate(rcordDt[1]));
		}
		
		// 1. historyParamVo의 검색조건을 확인한다(디폴트 값 세팅)
		Date today = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String sToday = format.format(today);
		String sYear = sToday.split(" ")[0].split("-")[0];
		String sMonth = sToday.split(" ")[0].split("-")[1];
		String sDayOfMonth = sToday.split(" ")[0].split("-")[2];
		String sHour = sToday.split(" ")[1].split(":")[0];
		String sMinute = sToday.split(" ")[1].split(":")[1];
		String sSecond = sToday.split(" ")[1].split(":")[2];
		String sEndRcordDt = sYear + "-" + sMonth + "-" + sDayOfMonth + " " + sHour + ":" + sMinute + ":" + sSecond + ".0";
		String sStartRcordDt = sYear + "-" + sMonth + "-" + "01" + " " + "00" + ":" + "00" + ":" + "00.0";
		
		if (historyParamVo.getStartRcordDt() == null) {
		    Timestamp startRcordDt = Timestamp.valueOf(sStartRcordDt);
		    historyParamVo.setStartRcordDt(startRcordDt);
		}
		if (historyParamVo.getEndRcordDt() == null) {
		    Timestamp endRcordDt = Timestamp.valueOf(sEndRcordDt);
		    historyParamVo.setEndRcordDt(endRcordDt);
		}
		// condition, conditionType 변경
		historyParamVo.setConditionType("1");
		historyParamVo.setCondition("1");
		System.out.println("step1 : "+historyParamVo.toString());
		
		// 2. 각 히스토리들을 가져온다
		List<VochrHistDto> vochrHistList = vochrHistDaoQebc.selectMultiVochrHistByCondition(historyParamVo);
		List<SetleHistDto> setleHistList = setleHistDaoQebc.selectMultiSetleHistByCondition(historyParamVo);
		List<RefndHistDto> refndHistList = refndHistDaoQebc.selectMultiRefndHistByCondition(historyParamVo);
		List<WalletDtlsHistDto> walletDtlsHistList = walletDtlsHistDaoQebc.selectMultiWalletDtlsHistByCondition(historyParamVo);
		List<CoinRepositoryHistDto> coinRepositoryHistList = coinRepositoryHistDaoQebc.selectMultiCoinRepositoryHistByCondition(historyParamVo);
		System.out.println("step2-vochrHist : "+vochrHistList.toString());
		System.out.println("step2-resveSetleHist : "+setleHistList.toString());
		System.out.println("step2-refndHist : "+refndHistList.toString());
		System.out.println("step2-walletDtlsHist : "+walletDtlsHistList.toString());
		System.out.println("step2-coinRepositoryHist : "+coinRepositoryHistList.toString());

		// 3. 각 히스토리들을 전체 히스토리로 합친다
		List<HistMngrDto> list = new ArrayList<HistMngrDto>();
		if (vochrHistList != null) {
			for(int i = 0; i < vochrHistList.size(); i++) {
				HistMngrDto histMngrDto = new HistMngrDto();
				
				VochrHistDto vochrHistDto = vochrHistList.get(i);
				
				histMngrDto.setRcordDt(vochrHistDto.getRcordDt());
				String[] histSe = vochrHistDto.getHistSe().split("-");
				histMngrDto.setHistSeTable(histSe[0]);
				histMngrDto.setHistSeExec(histSe[1]);
				histMngrDto.setSeCode(vochrHistDto.getVochrCode());// 식사권코드, 히스토리 필터 시 사용
				histMngrDto.setHistBrief(vochrHistDto.toString());
				histMngrDto.setContents(vochrHistDto);
				
				list.add(histMngrDto);
			}
		}
		// 결제 이력 처리
		if (setleHistList != null) {
			for(int i = 0; i < setleHistList.size(); i++) {
				HistMngrDto histMngrDto = new HistMngrDto();
				
				SetleHistDto setleHistDto = setleHistList.get(i);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh24:mm:ss");
				
				histMngrDto.setRcordDt(Timestamp.valueOf(sdf.format(setleHistDto.getSetleDt())));
				histMngrDto.setHistSeTable("SETLE");
				histMngrDto.setHistSeExec("INSERT");
				histMngrDto.setSeCode(setleHistDto.getSetleCode());// 결제코드, 히스토리 필터 시 사용
				histMngrDto.setHistBrief(setleHistDto.toString());
				histMngrDto.setContents(setleHistDto);
				
				list.add(histMngrDto);
			}
		}
		// 환불 이력 처리
		if (refndHistList != null) {
			for(int i = 0; i < refndHistList.size(); i++) {
				HistMngrDto histMngrDto = new HistMngrDto();
				
				RefndHistDto refndHistDto = refndHistList.get(i);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh24:mm:ss");
				
				histMngrDto.setRcordDt(Timestamp.valueOf(sdf.format(refndHistDto.getRefndDt())));
				histMngrDto.setHistSeTable("REFND");
				histMngrDto.setHistSeExec("INSERT");
				histMngrDto.setSeCode(refndHistDto.getSetleCode());// 결제코드, 히스토리 필터 시 사용
				histMngrDto.setHistBrief(refndHistDto.toString());
				histMngrDto.setContents(refndHistDto);
				
				list.add(histMngrDto);
			}
		}
		// 지갑 내역 이력 처리
		if (walletDtlsHistList != null) {
			for(int i = 0; i < walletDtlsHistList.size(); i++) {
				HistMngrDto histMngrDto = new HistMngrDto();
				
				WalletDtlsHistDto walletDtlsHistDto = walletDtlsHistList.get(i);
				
				histMngrDto.setRcordDt(walletDtlsHistDto.getRcppayDt());
				histMngrDto.setHistSeTable("WALLET_DTLS");
				histMngrDto.setHistSeExec("INSERT");
				histMngrDto.setSeCode(walletDtlsHistDto.getMberCode());// 회원코드, 히스토리 필터 시 사용
				histMngrDto.setHistBrief(walletDtlsHistDto.toString());
				histMngrDto.setContents(walletDtlsHistDto);
				
				list.add(histMngrDto);
			}
		}
		// 코인 저장소 이력 처리
		if (coinRepositoryHistList != null) {
			for(int i = 0; i < coinRepositoryHistList.size(); i++) {
				HistMngrDto histMngrDto = new HistMngrDto();

				CoinRepositoryHistDto CoinRepositoryHistDto = coinRepositoryHistList.get(i);
				
				histMngrDto.setRcordDt(CoinRepositoryHistDto.getDelngDt());
				histMngrDto.setHistSeTable("COIN_REPOSITORY");
				histMngrDto.setHistSeExec("INSERT");
				histMngrDto.setSeCode(CoinRepositoryHistDto.getDelngCode());// 거래코드, 히스토리 필터 시 사용
				histMngrDto.setHistBrief(CoinRepositoryHistDto.toString());
				histMngrDto.setContents(CoinRepositoryHistDto);
				
				list.add(histMngrDto);
			}
		}
		System.out.println("step3 : "+list.toString());
		
		// 4. 히스토리를 rcordDt 기준으로 내림차순으로 정렬한다
		list.sort(Comparator.reverseOrder());
		System.out.println("step4 정렬후 : ");
		for (HistMngrDto histMngrDto : list) {
			System.out.println(histMngrDto.toString());
		}
		int totalCnt = vochrHistDaoQebc.selectVochrHistByConditionTotalCount(historyParamVo);
		totalCnt += setleHistDaoQebc.selectSetleHistByConditionTotalCount(historyParamVo);
		totalCnt += refndHistDaoQebc.selectRefndHistByConditionTotalCount(historyParamVo);
		totalCnt += walletDtlsHistDaoQebc.selectWalletDtlsHistByConditionTotalCount(historyParamVo);
		totalCnt += coinRepositoryHistDaoQebc.selectCoinRepositoryHistByConditionTotalCount(historyParamVo);
		System.out.println("totalCnt = "+totalCnt);
		
		// 5. 히스토리 리스트의 크기를 페이지 크기에 맞춘다
		if(list.size() > PAGE_SIZE) {
			list.subList(0, PAGE_SIZE);
		}
		System.out.println("step5 list의 사이즈 : "+list.size());
		
		model.addAttribute("LIST", list);
		model.addAttribute("TOTAL_CNT", totalCnt);
		model.addAttribute("CONDITION_PARAM", historyParamVo);
		
		return VIEW_PAGE;
		
	}

	@Override
	public List<VochrHistDto> selectMultiVochrHistByCondition(HistoryParamVo historyParamVo) {
		
		logger.info("selectMultiVochrHistByCondition");
		
		List<VochrHistDto> vochrHistList = vochrHistDaoQebc.selectMultiVochrHistByCondition(historyParamVo);
		System.out.println(vochrHistList.toString());
		
		return vochrHistList;
		
	}

	@Override
	public List<SetleHistDto> selectMultiSetleHistByCondition(HistoryParamVo historyParamVo) {

		logger.info("selectMultiSetleHistByCondition");
		
		List<SetleHistDto> setleHistList = setleHistDaoQebc.selectMultiSetleHistByCondition(historyParamVo);
		System.out.println(setleHistList.toString());
		
		return setleHistList;
		
	}

	@Override
	public List<RefndHistDto> selectMultiRefndHistByCondition(HistoryParamVo historyParamVo) {

		logger.info("selectMultiRefndHistByCondition");
		
		List<RefndHistDto> refndHistList = refndHistDaoQebc.selectMultiRefndHistByCondition(historyParamVo);
		System.out.println(refndHistList.toString());
		
		return refndHistList;
		
	}

	@Override
	public List<WalletDtlsHistDto> selectMultiWalletDtlsHistByCondition(HistoryParamVo historyParamVo) {

		logger.info("selectMultiWalletDtlsHistByCondition");
		
		List<WalletDtlsHistDto> walletDtlsHistList = walletDtlsHistDaoQebc.selectMultiWalletDtlsHistByCondition(historyParamVo);
		System.out.println(walletDtlsHistList.toString());
		
		return walletDtlsHistList;
		
	}

	@Override
	public List<CoinRepositoryHistDto> selectMultiCoinRepositoryHistByCondition(HistoryParamVo historyParamVo) {

		logger.info("selectMultiCoinRepositoryHistByCondition");
		
		List<CoinRepositoryHistDto> coinRepositoryHistList = coinRepositoryHistDaoQebc.selectMultiCoinRepositoryHistByCondition(historyParamVo);
		System.out.println(coinRepositoryHistList.toString());
		
		return coinRepositoryHistList;
		
	}

}
