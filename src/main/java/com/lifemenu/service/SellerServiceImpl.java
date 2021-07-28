package com.lifemenu.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.lifemenu.admin.dao.mebc.ITagDaoMebc;
import com.lifemenu.admin.dao.mebc.ITagReadCntDaoMebc;
import com.lifemenu.admin.dao.qebc.ITagDaoQebc;
import com.lifemenu.admin.dto.TagDto;
import com.lifemenu.cmmn.IUploadCommon;
import com.lifemenu.dao.mebc.ILoginPreDaoMebc;
import com.lifemenu.dao.mebc.ISellerDaoMebc;
import com.lifemenu.dao.mebc.ISellerImageDaoMebc;
import com.lifemenu.dao.mebc.ITagSearchDaoMebc;
import com.lifemenu.dao.qebc.ISellerDaoQebc;
import com.lifemenu.dto.Criteria;
import com.lifemenu.dto.MberDto;
import com.lifemenu.dto.ReviewDto;
import com.lifemenu.dto.SellerConditionDto;
import com.lifemenu.dto.SellerDto;
import com.lifemenu.dto.SellerImageDto;
import com.lifemenu.dto.SellerSearchDto;
import com.lifemenu.dto.SellersVoucherPriceDto;

/*
 * 	Author 		: Ma
 * 
 *  Update Date : 2021-07-05
 * 	Version 	: 0.0.1
 * 
 * 	판매자 서비스
 */

@Service("sellerService")
public class SellerServiceImpl implements ISellerService {
	
	@Autowired
	private ISellerDaoMebc mebcSeler;
	
	@Autowired
	private ISellerDaoQebc qebcSeler;
	
	@Autowired
	private ISellerImageDaoMebc mebcSelerImage;
	
	@Autowired
	private ITagReadCntDaoMebc mebcTagReadCnt;
	
	@Autowired
	private ITagDaoMebc mebcTag;
	
	@Autowired
	private ITagDaoQebc qebcTag;
	
	@Autowired
	private ITagSearchDaoMebc mebcTagSearch;
	
	@Autowired
	private ILoginPreDaoMebc mebcMber;
	
	@Autowired
	private IUploadCommon uploadCommon;
	
	private static final Logger logger = LoggerFactory.getLogger(SellerServiceImpl.class);
	
	// 첫 화면 페이지 넘버
	private final int FIRST_PAGE_NUM = 1;
	// 한번에 출력할 목록 수
	private final int AMOUNT = 10;
	// 최대 연령(조건 조회용)
	private final int AGE_MAX = 100;
	// 최소 연령(조건 조회용)
	private final int AGE_MIN = 0;
	// 최대 가격(조건 조회용)
	private final int PRICE_MAX = 10000;
	// 최소 가격(조건 조회용)
	private final int PRICE_MIN	= 0;

	// 판매자 정보 상세 조회
	@Override
	public String selectOneSeller(Model model, String mberCode) {
		logger.info("selectOneSeller called =============================");
		SellerDto seller = mebcSeler.selectOneSeller(mberCode);
		
		List<String> sellerImageList = processAdres(qebcSeler.selectMultiSellerImage(mberCode));
		
		List<String> tagCodeList = qebcTag.selectMultiTagSearch(mberCode);
		List<TagDto> tagList = new ArrayList<TagDto>();
		
		// 태그 목록 처리
		if(tagCodeList.size() > 0)
		{
			for(int i = 0; i < tagCodeList.size(); i++)
			{
				String tagCode = tagCodeList.get(i);
				TagDto tag = mebcTag.selectOneTag(tagCode);
				if(tag.getImageAdres() != null)
				{
					tag.setImageAdres(tag.getImageAdres().replace("\\", "/"));
				}
				tagList.add(tag);
			}
		}
		//
		
		String mberNcnm = qebcSeler.selectNickName(mberCode);
		
		// 가격 히스토리 처리
		List<SellersVoucherPriceDto> sellersVoucherPrice = qebcSeler.selectMultiSellersVoucherPrice(mberCode);
		//
		
		// 리뷰 목록 처리
		List<ReviewDto> reviewList = qebcSeler.selectMultiReview(mberCode);
		//
		
		// 해당 판매자에 대한 구매자 연령 처리
		List<String> ageList = qebcSeler.selectMultiPurchaserAge(mberCode);
		LinkedHashMap<String, Integer> ageGroupMap = new LinkedHashMap<String, Integer>();
		int thisYear = Integer.parseInt(LocalDate.now().toString().substring(0, 4));
		
		for(int i = 0; i < ageList.size(); i++)
		{
			int ageGroup = (thisYear - Integer.parseInt(ageList.get(i).substring(0, 4)) + 1) / 10;
			String strAgeGroup = ageGroup + "0대";
			
			if(ageGroupMap.containsKey(strAgeGroup)) 
			{
				ageGroupMap.put(strAgeGroup, ageGroupMap.get(strAgeGroup) + 1);
			}
			else
			{
				ageGroupMap.put(strAgeGroup, 1);
			}
		}
		//
		
		model.addAttribute("seller", seller);
		model.addAttribute("sellerImageList", sellerImageList);
		model.addAttribute("tagList", tagList);
		model.addAttribute("mberNcnm", mberNcnm);
		model.addAttribute("sellersVoucherPrice", sellersVoucherPrice);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("ageGroupMap", ageGroupMap);

		return "seller/show";
	}
	
	// 나의 판매자 정보 조회
	@Override
	public String selectOneMySeller(Model model, HttpSession session) {
		logger.info("selectOneMySeller called =============================");
		MberDto dto = (MberDto) session.getAttribute("dto");
		String mberCode = dto.getMberCode();
		
		SellerDto seler = mebcSeler.selectOneSeller(mberCode);
		
		// 판매자 정보가 없을시 리턴
		if(seler == null)
		{
			model.addAttribute("existence", false);
			return "seller/myinfo";
		}
		
		List<String> sellerImageList = processAdres(qebcSeler.selectMultiSellerImage(mberCode));
		// 판매자가 가지고 있는 태그 목록
		List<String> tagCodeList = qebcTag.selectMultiTagSearch(mberCode);
		List<TagDto> tagList = null;
		// 현재 존재하는 태그 목록
		List<TagDto> existentTagList = qebcTag.selectMultiTag();
		
		// 태그 목록 처리 // 수정 필요
		if(tagCodeList != null)
		{
			if(tagCodeList.size() != 0)
			{
				tagList = new ArrayList<TagDto>();
				for(int i = 0; i < tagCodeList.size(); i++)
				{
					TagDto tag = mebcTag.selectOneTag(tagCodeList.get(i));
					tagList.add(tag);
				}
			}
		}
		
		String mberNcnm = qebcSeler.selectNickName(mberCode);
		
		model.addAttribute("existence", true);
		model.addAttribute("seler", seler);
		model.addAttribute("mberNcnm", mberNcnm);
		model.addAttribute("sellerImageList", sellerImageList);
		model.addAttribute("tagList", tagList);
		model.addAttribute("existentTagList", existentTagList);

		return "seller/myinfo";
	}

	// 판매자 목록 조회 
	@Override
	public String selectMultiSeller(Model model, Criteria cri ) {
		logger.info("selectMultiSeller called =============================");
		cri = chkNullCriteria(cri);
		
		List<SellerSearchDto> sellerList = qebcSeler.selectMultiSeller(cri);
		
		// 셀러 리스트에 셀러 이미지 삽입
		for(SellerSearchDto seler : sellerList)
		{
			List<String> sellerImageList = processAdres(qebcSeler.selectMultiSellerImage(seler.getMberCode()));
			seler.setSelerImageList(sellerImageList);
		}
		
		List<String> tagNameList = qebcTag.selectMultiTagName();
		
		SellerConditionDto con = createSellerConditionDto();
		
		model.addAttribute("sellerList", sellerList);
		model.addAttribute("tagNameList", tagNameList);
		model.addAttribute("criteria", cri);
		model.addAttribute("con", con);
		
		return "seller/list";
	}

	// 판매자 목록 조건 조회
	@Override
	@Transactional
	public String selectMultiSellerWithCondition(Model model, Criteria cri, SellerConditionDto con) {
		logger.info("selectMultiSellerWithCondition called =============================");
		cri = chkNullCriteria(cri);
		String tagCode = qebcTag.selectTagCodeByName(con.getTagName());
		
		// 입력된 태그가 존재하지 않는 태그일 경우 리턴
		if(tagCode == null)
			return "seller/result";
		
		con.setTagCode(tagCode);
		
		mebcTagReadCnt.updateTagReadCnt(tagCode);
		
		List<SellerSearchDto> sellerList = qebcSeler.selectMultiSellerWithCondition(con, cri);
		
		for(SellerSearchDto seler : sellerList)
		{
			List<String> sellerImageList = processAdres(qebcSeler.selectMultiSellerImage(seler.getMberCode()));
			seler.setSelerImageList(sellerImageList);
		}
		
		List<String> tagNameList = qebcTag.selectMultiTagName();
		
		model.addAttribute("sellerList", sellerList);
		model.addAttribute("tagNameList", tagNameList);
		model.addAttribute("criteria", cri);
		model.addAttribute("con", con);
		
		return "seller/result";
	}
	
	// 판매자 목록 Ajax로 추가
	@Override
	public String selectMultiSellerWithAjax(Criteria cri, SellerConditionDto con) {
		logger.info("selectMultiSellerWithAjax called =============================");
		List<SellerSearchDto> sellerList = null;
		
		cri = chkNullCriteria(cri);
		String tagCode = qebcTag.selectTagCodeByName(con.getTagName());
		
		if(tagCode == null) {
			sellerList = qebcSeler.selectMultiSeller(cri);
		}
		else {
			con.setTagCode(tagCode);
			sellerList = qebcSeler.selectMultiSellerWithCondition(con, cri);
		}
		
		for(SellerSearchDto seler : sellerList)
		{
			List<String> sellerImageList = processAdres(qebcSeler.selectMultiSellerImage(seler.getMberCode()));
			seler.setSelerImageList(sellerImageList);
		}
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("sellerList", sellerList);
		jsonObj.put("pageNum", cri.getPageNum());
		
		String jsonOut = jsonObj.toString();
		
		return jsonOut;
	}
	
	@Override
	public String insertFormService(Model model, HttpSession session) {
		logger.info("insertFormService called =============================");
		MberDto dto = (MberDto) session.getAttribute("dto");
		String mberCode = dto.getMberCode();
		
		List<TagDto> tagList = qebcTag.selectMultiTag();
		model.addAttribute("tagList", tagList);
		model.addAttribute("mberCode", mberCode);
		
		return "seller/register";
	}
	

	@Override
	@Transactional
	public String insertSeller(HttpSession session, SellerDto seler, List<String> tagList, MultipartFile[] uploadFile) {
		logger.info("insertSeller called =============================");
		MberDto dto = (MberDto) session.getAttribute("dto");
		String mberCode = dto.getMberCode();
		
		seler.setMberCode(mberCode);
		
		String brthdy = mebcMber.selectOneMber(mberCode).getMberBrthdy();
		int age = Integer.parseInt(LocalDate.now().toString().substring(0, 4)) - Integer.parseInt(brthdy.substring(0, 4)) + 1;
		seler.setSelerAge(age);
		
		seler.setSelerCareer(seler.getSelerCareer().replace("\n", "<br>"));
		seler.setSelerAcdmcr(seler.getSelerAcdmcr().replace("\n", "<br>"));
		seler.setSelerSelfIntrcn(seler.getSelerSelfIntrcn().replace("\n", "<br>"));
		
		mebcSeler.insertSeller(seler);
		
		for(int i = 0; i < tagList.size(); i++)
		{
			String tagCode = tagList.get(i);
			if(mebcTag.selectOneTag(tagCode) != null)
			{
				mebcTagSearch.insertTagSearch(mberCode, tagCode);
			}
		}
		
		List<String> imageAdresList = uploadCommon.uploadAjax(uploadFile);
		
		for(int i = 0; i < imageAdresList.size(); i++)
		{
			SellerImageDto selerImg = new SellerImageDto();
			selerImg.setMberCode(mberCode);
			selerImg.setSno(i+1);
			selerImg.setImageAdres(imageAdresList.get(i));
			
			mebcSelerImage.insertSellerImage(selerImg);
		}
		
		return "redirect:myinfo";
	}

	@Override
	@Transactional
	public String updateSeller(HttpSession session, SellerDto seler, List<String> tagList, MultipartFile[] uploadFile) {
		logger.info("updateSeller called =============================");
		MberDto dto = (MberDto) session.getAttribute("dto");
		String mberCode = dto.getMberCode();
		seler.setMberCode(mberCode);
		
		seler.setSelerCareer(seler.getSelerCareer().replace("\n", "<br>"));
		seler.setSelerAcdmcr(seler.getSelerAcdmcr().replace("\n", "<br>"));
		seler.setSelerSelfIntrcn(seler.getSelerSelfIntrcn().replace("\n", "<br>"));
		
		mebcSeler.updateSeller(seler);
		
		mebcTagSearch.deleteTagSearch(mberCode);
		
		for(int i = 0; i < tagList.size(); i++)
		{
			String tagCode = tagList.get(i);
			if(mebcTag.selectOneTag(tagCode) != null)
			{
				mebcTagSearch.insertTagSearch(mberCode, tagCode);
			}
		}
		
		if(uploadFile.length > 0)
		{
			mebcSelerImage.deleteSellerImage(mberCode);
			
			List<String> imageAdresList = uploadCommon.uploadAjax(uploadFile);
			
			for(int i = 0; i < imageAdresList.size(); i++)
			{
				SellerImageDto selerImg = new SellerImageDto();
				selerImg.setMberCode(mberCode);
				selerImg.setSno(i+1);
				selerImg.setImageAdres(imageAdresList.get(i));
				
				mebcSelerImage.insertSellerImage(selerImg);
			}
		}
		
		return "redirect:myinfo";
	}

	@Override
	public String deleteSeller(String mberCode) {
		logger.info("deleteSeller called =============================");
		return null;
	}
	
	// 첫 페이지 Criteria 처리
	public Criteria chkNullCriteria(Criteria cri) {
		if(cri.getPageNum() == 0)
			cri.setPageNum(FIRST_PAGE_NUM);
		if(cri.getAmount() == 0)
			cri.setAmount(AMOUNT);
		
		return cri;
	}
	
	// 이미지 경로 처리
	public List<String> processAdres(List<String> sellerImageList) {
		for(int i = 0; i < sellerImageList.size(); i++)
		{
			String selerImage = sellerImageList.get(i);
			selerImage = selerImage.replace("\\", "/");
			sellerImageList.set(i, selerImage);
		}
		return sellerImageList;
	}
	
	public SellerConditionDto createSellerConditionDto() {
		SellerConditionDto con = new SellerConditionDto();
		con.setAgeMax(AGE_MAX);
		con.setAgeMin(AGE_MIN);
		con.setPriceMax(PRICE_MAX);
		con.setPriceMin(PRICE_MIN);
		return con;
	}


}
