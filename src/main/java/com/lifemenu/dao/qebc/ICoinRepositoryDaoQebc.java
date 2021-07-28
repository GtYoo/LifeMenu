package com.lifemenu.dao.qebc;

import java.util.List;

import com.lifemenu.dto.CoinRepositoryDto;

public interface ICoinRepositoryDaoQebc {
	
	//코인저장소 내역 전체조회
	List<CoinRepositoryDto> selectMultiCoinRepository();
	
	//마지막 코인갯수 조회
	int selectOneCoinRepositoryCoin();
	
	//저장소마지막데이터 조회
	CoinRepositoryDto selectOneRepositoryDtlsRownum();
}
