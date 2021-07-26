package com.lifemenu.admin.service;

import java.util.List;

import org.springframework.ui.Model;

import com.lifemenu.admin.dto.hist.CoinRepositoryHistDto;
import com.lifemenu.admin.dto.hist.RefndHistDto;
import com.lifemenu.admin.dto.hist.SetleHistDto;
import com.lifemenu.admin.dto.hist.VochrHistDto;
import com.lifemenu.admin.dto.hist.WalletDtlsHistDto;
import com.lifemenu.admin.vo.HistoryParamVo;

/*
 * 	Author 		: Lim
 * 
 *  Update Date : 2021-07-17
 * 	Version 	: 1.0.1
 * 
 * 	히스토리
 * 2021-06-17-0.0.2 	- bbsNotice
 * 2021-06-21-0.0.3 	- bbsNotice 삭제, Hist, VochrHist, ResveSetleHist, WalletDtlsHist, CoinRepositoryHist 서비스 명세 및 확인
 * 2021-07-02-0.0.4 	- insert메소드 삭제, aop로 히스토리 insert
 * 2021-07-07-1.0.0 	- 최종 발표 버전
 * 2021-07-17-1.0.1 	- 히스토리 서비스 정리(ajax로 변경?)
 * 
 */

public interface IHistService {

	// 전체 히스토리 조회
	String selectMultiHistByCondition(Model model, HistoryParamVo historyParamVo);
	
	// 식사권 이력 조건 조회
	List<VochrHistDto> selectMultiVochrHistByCondition(HistoryParamVo historyParamVo);
	
	// 결제 이력 조건 조회
	List<SetleHistDto> selectMultiSetleHistByCondition(HistoryParamVo historyParamVo);
	
	// 환불 이력 조건 조회
	List<RefndHistDto> selectMultiRefndHistByCondition(HistoryParamVo historyParamVo);
	
	// 지갑 이력 조건 조회
	List<WalletDtlsHistDto> selectMultiWalletDtlsHistByCondition(HistoryParamVo historyParamVo);
	
	// 코인저장소 이력 조건 조회
	List<CoinRepositoryHistDto> selectMultiCoinRepositoryHistByCondition(HistoryParamVo historyParamVo);
	
}
