package com.lifemenu.dao.qebc;

import java.util.List;

public interface IWalletDaoQebc {	//지갑서비스 dao QEBC

	List<Object> selectMultiWalletDtls(String mberCode);
}
