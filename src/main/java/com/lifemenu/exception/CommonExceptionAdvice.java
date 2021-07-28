package com.lifemenu.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

/*
 * 	Author 		: Ma
 * 
 *  Update Date : 2021-07-05
 * 	Version 	: 0.0.1
 * 
 * 	익셉션 컨트롤러
 */

@ControllerAdvice
public class CommonExceptionAdvice {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);
	
	// 에러 처리
	@ExceptionHandler(Exception.class)
	public String except(Exception ex, Model model) {
		
		logger.error("Exception......." + ex.getMessage());
		model.addAttribute("exception", ex);
		logger.error(model.toString());
		return "err/error_page";
		
	}
	
	// 404 에러 처리
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
		return "err/error_404";
	}

}
