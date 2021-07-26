package com.lifemenu.admin.aop;

import org.aspectj.lang.JoinPoint;

public class ServiceAspect {

	public static int seq = 0;
	
	public void before(JoinPoint jp) {
		System.out.println(jp.getSignature().getName()+" 실행!");
		System.out.println("--"+jp.getArgs()+"----");
	}
	
}
