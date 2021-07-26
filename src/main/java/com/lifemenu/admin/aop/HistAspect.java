package com.lifemenu.admin.aop;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lifemenu.admin.dao.mebc.IVochrHistDaoMebc;
import com.lifemenu.dao.mebc.IVoucherDaoMebc;

// ver.1.0.0

@Component
@Aspect
public class HistAspect {

	@Autowired
	IVoucherDaoMebc voucherDaoMebc;
	@Autowired
	IVochrHistDaoMebc vochrHistDaoMebc;
	
//	@Pointcut("execution(* com.lifemenu.service.IVoucherService.insertVoucher(VoucherDto))")
//	public void insertVochrPointcut() {
//		;
//	}
//	
//	@AfterReturning( "insertVochrPointcut()" )
//	public void insertVoucherHist(JoinPoint jp, Object result) {
//		
//		System.out.println(jp.getSignature().getName());
//		Object[] args = jp.getArgs();
//		VoucherDto voucherDto = (VoucherDto)args[0];
//		
//		VochrHistDto vochrHistDto = AdminCommons.createVochrHist(voucherDto, "VOCHR-INSERT");
//		
//		System.out.println( vochrHistDto.toString() );
//		vochrHistDaoMebc.insertVochrHist( vochrHistDto );
//		
//	}
	
}
