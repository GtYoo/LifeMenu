package com.lifemenu.cmmn;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface IUploadCommon {
	
	String getFolder();
	
	List<String> uploadAjax(MultipartFile[] uploadFile);

	List<String> uploadAjax(MultipartFile[] uploadFile, String rootPath);
	
	public String changeAdres(String adres);
	
}
