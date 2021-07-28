package com.lifemenu.service;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.dao.mebc.IBbscttDaoMebc;
import com.lifemenu.dao.mebc.ILoginPreDaoMebc;
import com.lifemenu.dao.qebc.IBbscttDaoQebc;
import com.lifemenu.dto.BbscttDto;
import com.lifemenu.dto.MberDto;



@Service("bbscttService")
public class BbscttServiceImpl implements IBbscttService {

	@Autowired
	private IBbscttDaoMebc bbscttDaoMebc;
	@Autowired
	private IBbscttDaoQebc bbscttDaoQebc;
	@Autowired
	private ILoginPreDaoMebc loginPreDaoMebc;
	
	//전체목록 조회
	@Override
	public String selectMultiBbsctt(Model model, PageParamVo pageParamVo) {

		List<BbscttDto> bbscttList = bbscttDaoQebc.selectMultiBbsctt(pageParamVo);
		int totalCnt = bbscttDaoQebc.selectBbsTotalCount();
		
		int cCnt;
		List<Integer> comentCnt = new ArrayList<Integer>();
		
		List<MberDto> mberNcnmList = new ArrayList<MberDto>();
		
		for(int i = 0; i < bbscttList.size(); i++)
		{
			cCnt = bbscttDaoQebc.selectComentCount(bbscttList.get(i).getBbscttNo());
			String mberCode = bbscttList.get(i).getMberCode();
			mberNcnmList.add(loginPreDaoMebc.selectOneMber(mberCode));
			comentCnt.add(cCnt);
		}
		
		model.addAttribute("MBER_LIST", mberNcnmList);
		model.addAttribute("COMENT_CNT", comentCnt);
		model.addAttribute("START", pageParamVo.getStart());
		model.addAttribute("CNT", pageParamVo.getCnt());
		model.addAttribute("TNT", totalCnt);
		model.addAttribute("IS_MULTI", "Y");
		model.addAttribute("LIST", bbscttList);
		
		return "bbsctt/bbscttList";
		
	}
	
	//글 상세조회
	@Override	
	public String selectOneBbsctt(Model model, HttpSession session, String bbscttNo) {

		BbscttDto bbscttDto = bbscttDaoMebc.selectOneBbsctt(bbscttNo);
		MberDto ssMberDto = (MberDto) session.getAttribute("dto");
		String upNo = bbscttNo;
		MberDto writerDtoNm = loginPreDaoMebc.selectOneMber(bbscttDto.getMberCode());
		List<BbscttDto> list = bbscttDaoQebc.selectMultiComent(upNo);

		List<MberDto> mberComentList = new ArrayList<MberDto>();

		for(int i = 0; i < list.size(); i++)
		{
			String mberCode = list.get(i).getMberCode();
			mberComentList.add(loginPreDaoMebc.selectOneMber(mberCode));
		}

		model.addAttribute("COMENT_LIST", list);
		model.addAttribute("BBSCTT", bbscttDto);
		model.addAttribute("SS_MBER_DTO", ssMberDto);
		model.addAttribute("COMENT_LIST_NM", mberComentList);
		model.addAttribute("WRITER_DTO", writerDtoNm);


		return "bbsctt/bbscttDetail";

	}
		
	//새글 등록
	@Override
	@Transactional
	public String insertBbsctt(Model model, HttpSession session, BbscttDto bbDto) throws Exception {

		MberDto ssMberDto = (MberDto) session.getAttribute("dto");

		BbscttDto bbscttDto = bbscttDaoQebc.selectOneBbscttNoRownum();

		if(bbscttDto == null)
		{
			bbDto.setBbscttNo("0001");
		}
		else
		{
			int bbNo = Integer.parseInt(bbscttDto.getBbscttNo()) + 1;
			String strBbNo = String.format("%04d", bbNo);
			bbDto.setBbscttNo(strBbNo);
		}

		bbDto.setMberCode(ssMberDto.getMberCode());

		//새글등록
		bbscttDaoMebc.insertBbsctt(bbDto);

		return "redirect:/bbscttMulti.do?start=1&cnt=8";
	}

	//댓글등록
	@Override
	@Transactional
	public String insertComent(Model model, HttpSession session, BbscttDto bbscDto, String bbscttNo) throws Exception {

		MberDto ssMberDto = (MberDto) session.getAttribute("dto");

		BbscttDto bbscttDto = bbscttDaoQebc.selectOneBbscttNoRownum();

		int bbNo = Integer.parseInt(bbscttDto.getBbscttNo()) + 1;
		String strBbNo = String.format("%04d", bbNo);

		bbscDto.setBbscttNo(strBbNo);
		bbscDto.setMberCode(ssMberDto.getMberCode());
		bbscDto.setUpBbscttNo(bbscttNo);

		//답글등록
		bbscttDaoMebc.insertComent(bbscDto);

		model.addAttribute("COMENT", bbscDto);

		return "redirect:/bbscttDetail.do?BBSCTT_NO=" + bbscttNo;
	}

	//본글수정 페이지
	@Override
	public String bbscttUpdateForm(Model model, HttpSession session, String bbscttNo) {

		BbscttDto bbscttDto = bbscttDaoMebc.selectOneBbsctt(bbscttNo);

		System.out.println(bbscttDto.getBbscttDt());

		model.addAttribute("BBS_ONE", bbscttDto);

		return "bbsctt/bbscttUpdateForm";
	}

	//본글 수정
	@Override
	@Transactional
	public String bbscttUpdate(Model model, HttpSession session, BbscttDto bbDto) throws Exception {

		BbscttDto bbscttUdDto = new BbscttDto();

		bbscttUdDto.setBbscttNo(bbDto.getBbscttNo());
		bbscttUdDto.setMberCode(bbDto.getMberCode());
		bbscttUdDto.setUpBbscttNo(bbDto.getUpBbscttNo());
		bbscttUdDto.setBbscttSj(bbDto.getBbscttSj());
		bbscttUdDto.setBbscttCn(bbDto.getBbscttCn());
		bbscttUdDto.setBbscttDt(bbDto.getBbscttDt());

		bbscttDaoMebc.bbscttUpdate(bbscttUdDto);

		return "redirect:/bbscttMulti.do?start=1&cnt=8";
	}

	//본글 삭제
	@Override
	@Transactional
	public String deleteBbsctt(Model model, String bbscttNo) throws Exception {

		List<BbscttDto> bbscttDto = bbscttDaoQebc.selectMultiComent(bbscttNo);

		if(bbscttDto.size() != 0)
		{
			bbscttDaoMebc.deleteBbscttComent(bbscttNo);
		}

		bbscttDaoMebc.deleteBbsctt(bbscttNo);

		return "redirect:/bbscttMulti.do?start=1&cnt=8";
	}

	//댓글 삭제
	@Override
	@Transactional
	public String deleteComent(Model model, String upBbscttNo, String bbsctNo) throws Exception {

		bbscttDaoMebc.deleteComent(upBbscttNo, bbsctNo);

		return "redirect:/bbscttDetail.do?BBSCTT_NO=" + upBbscttNo;
	}
}
