package com.lifemenu.cmmn;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("uploadCommon")
public class UploadCommonImpl implements IUploadCommon {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadCommonImpl.class);

	@Override
	public String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}

	@Override
	public List<String> uploadAjax(MultipartFile[] uploadFile) {
		
		String uploadFolder = "C:\\upload";
		
		return uploadAjax(uploadFile, uploadFolder);
		
	}

	@Override
	public List<String> uploadAjax(MultipartFile[] uploadFile, String rootPath){
		List<String> imageAdresList = new ArrayList<String>();
		
		String uploadFolder = rootPath;
		
		// make folder -------
		File uploadPath = new File(uploadFolder, getFolder());
		logger.info("upload path: " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		//make YYYY/MM/DD folder
		
		for(MultipartFile multipartFile : uploadFile) {
			logger.info("----------------------------------");
			logger.info("Upload File Name: " + multipartFile.getOriginalFilename()); 
			logger.info("Upload File Size: " + multipartFile.getSize()); 
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			logger.info("only file name: " + uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			// File saveFile = new File(uploadFolder, uploadFileName);
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
				imageAdresList.add(uploadPath + "\\" + uploadFileName);
			} catch (Exception e) {
				logger.error(e.getMessage());
			} // end catch
			
		} // end for
		
		return imageAdresList;
	}
	
	@Override
	public String changeAdres(String adres) {
		return adres.replace("\\", "/");
	}
	
}
