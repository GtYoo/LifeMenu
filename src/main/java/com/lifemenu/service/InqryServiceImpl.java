package com.lifemenu.service;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.lifemenu.admin.vo.PageParamVo;
import com.lifemenu.dao.mebc.IInqryDaoMebc;
import com.lifemenu.dao.mebc.ILoginPreDaoMebc;
import com.lifemenu.dao.qebc.IInqryDaoQebc;
import com.lifemenu.dto.InqryDto;
import com.lifemenu.dto.MberDto;



@Service("inqryService")
public class InqryServiceImpl implements IInqryService {

	@Autowired
	private IInqryDaoMebc inqryDaoMebc;
	@Autowired
	private IInqryDaoQebc inqryDaoQebc;
	@Autowired
	private ILoginPreDaoMebc loginPreDaoMebc;
	
	//전체목록 조회
	@Override
	public String selectMultiInqry(Model model, PageParamVo pageParamVo) {

		List<InqryDto> inqryList = inqryDaoQebc.selectMultiInqry(pageParamVo);
		int totalCnt = inqryDaoQebc.selectBbsTotalCount();
		System.out.println(totalCnt);
		
		int cCnt;
		List<Integer> comentCnt = new ArrayList<Integer>();
		
		List<MberDto> mberNcnmList = new ArrayList<MberDto>();
		
		for(int i = 0; i < inqryList.size(); i++)
		{
			cCnt = inqryDaoQebc.selectComentCount(inqryList.get(i).getMngrInqryNo());
			String mberCode = inqryList.get(i).getMberCode();
			mberNcnmList.add(loginPreDaoMebc.selectOneMber(mberCode));
			comentCnt.add(cCnt);
		}
		
		model.addAttribute("MBER_LIST", mberNcnmList);
		model.addAttribute("COMENT_CNT", comentCnt);
		model.addAttribute("START", pageParamVo.getStart());
		model.addAttribute("CNT", pageParamVo.getCnt());
		model.addAttribute("TNT", totalCnt);
		model.addAttribute("IS_MULTI", "Y");
		model.addAttribute("LIST", inqryList);
		
		return "inqry/inqryList";
		
	}
	
	//문의 게시글 상세조회
	@Override	
	public String selectOneInqry(Model model, HttpSession session, String mngrInqryNo) {
	
		InqryDto inqryDto = inqryDaoMebc.selectOneInqry(mngrInqryNo);
		MberDto ssMberDto = (MberDto) session.getAttribute("dto");
		String upNo = mngrInqryNo;
		MberDto writerDtoNm = loginPreDaoMebc.selectOneMber(inqryDto.getMberCode());
		List<InqryDto> list = inqryDaoQebc.selectMultiComent(upNo);

		List<MberDto> mberComentList = new ArrayList<MberDto>();

		for(int i = 0; i < list.size(); i++)
		{
			String mberCode = list.get(i).getMberCode();
			mberComentList.add(loginPreDaoMebc.selectOneMber(mberCode));
		}

		model.addAttribute("COMENT_LIST", list);
		model.addAttribute("INQRY", inqryDto);
		model.addAttribute("SS_MBER_DTO", ssMberDto);
		model.addAttribute("COMENT_LIST_NM", mberComentList);
		model.addAttribute("WRITER_DTO", writerDtoNm);


		return "inqry/inqryDetail";

	}
		
	//새글 등록
	@Override
	@Transactional
	public String insertInqry(Model model, HttpSession session, InqryDto bbDto) throws Exception {

		MberDto ssMberDto = (MberDto) session.getAttribute("dto");

		InqryDto inqryDto = inqryDaoQebc.selectOneInqryNoRownum();

		if(inqryDto == null)
		{
			bbDto.setMngrInqryNo("0001");
		}
		else
		{
			int bbNo = Integer.parseInt(inqryDto.getMngrInqryNo()) + 1;
			String strBbNo = String.format("%04d", bbNo);
			bbDto.setMngrInqryNo(strBbNo);
		}

		bbDto.setMberCode(ssMberDto.getMberCode());

		//새글등록
		inqryDaoMebc.insertInqry(bbDto);

		return "redirect:/inqryMulti.do?start=1&cnt=8";
	}

	//댓글등록
	@Override
	@Transactional
	public String insertComent(Model model, HttpSession session, InqryDto bbscDto, String mngrInqryNo) throws Exception {

		MberDto ssMberDto = (MberDto) session.getAttribute("dto");

		InqryDto inqryDto = inqryDaoQebc.selectOneInqryNoRownum();

		int bbNo = Integer.parseInt(inqryDto.getMngrInqryNo()) + 1;
		String strBbNo = String.format("%04d", bbNo);
 
		bbscDto.setMngrInqryNo(strBbNo);
		bbscDto.setMberCode(ssMberDto.getMberCode());
		bbscDto.setMngrAnswerNo(mngrInqryNo);

		//답글등록
		inqryDaoMebc.insertComent(bbscDto);

		model.addAttribute("COMENT", bbscDto);

		return "redirect:/inqryDetail.do?MNGR_INQRY_NO=" + mngrInqryNo;
	}

	//본글수정 페이지
	@Override
	public String inqryUpdateForm(Model model, HttpSession session, String mngrInqryNo) {

		InqryDto inqryDto = inqryDaoMebc.selectOneInqry(mngrInqryNo);

		System.out.println(inqryDto.getInqryDt());

		model.addAttribute("INQRY_ONE", inqryDto);

		return "inqry/inqryUpdateForm";
	}

	//본글 수정
	@Override
	@Transactional
	public String inqryUpdate(Model model, HttpSession session, InqryDto bbDto) throws Exception {

		InqryDto inqryUdDto = new InqryDto();

		inqryUdDto.setMngrInqryNo(bbDto.getMngrInqryNo());
		inqryUdDto.setMberCode(bbDto.getMberCode());
		inqryUdDto.setMngrAnswerNo(bbDto.getMngrAnswerNo());
		inqryUdDto.setInqrySj(bbDto.getInqrySj());
		inqryUdDto.setInqryCn(bbDto.getInqryCn());
		inqryUdDto.setInqryDt(bbDto.getInqryDt());

		inqryDaoMebc.inqryUpdate(inqryUdDto);

		return "redirect:/inqryMulti.do?start=1&cnt=8";
	}

	//본글 삭제
	@Override
	@Transactional
	public String deleteInqry(Model model, String mngrInqryNo) throws Exception {

		List<InqryDto> inqryDto = inqryDaoQebc.selectMultiComent(mngrInqryNo);

		if(inqryDto.size() != 0)
		{
			inqryDaoMebc.deleteInqryComent(mngrInqryNo);
		}

		inqryDaoMebc.deleteInqry(mngrInqryNo);

		return "redirect:/inqryMulti.do?start=1&cnt=8";
	}

	//댓글 삭제
	@Override
	@Transactional
	public String deleteComent(Model model, String mngrAnswerNo, String mngrInqryNo) throws Exception {

		inqryDaoMebc.deleteComent(mngrAnswerNo, mngrInqryNo);

		return "redirect:/iqnryDetail.do?MNGR_INQRY_NO=" + mngrAnswerNo;
	}


}
