package com.lifemenu.controller;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lifemenu.dto.MberDto;
import com.lifemenu.service.ICheckService;

@Controller
public class CheckController {
	
	@Autowired
    private ICheckService checkService;
	
	@RequestMapping(value = "idCheck.do", produces = "application/text;charset=UTF-8")
	@ResponseBody//에이젝스에 반응하는놈
	public String idChk(@ModelAttribute("id") String id) {
		
		MberDto mberDto = checkService.selectOneIdCheck(id);
		
		boolean result = false;	//있단 전제하에 그냥 false로 해놓은것.
		
		if(mberDto == null)
		{
			result = true;//dto가 널이면 result를 true로.
		}
		
		JSONObject jsonObj = new JSONObject();//제이슨 오브젝트객체 만들고,
		jsonObj.put("result", result);//result라는 키값으로 result를 오브젝트객체에 넣는다.
		
		String jsonOut = jsonObj.toString(); //제이슨객체를 스트링으로 만들기위해. url 쿼리? > ?뒤에 머시기머시기로 만들기 위해.
		System.out.println("====" + jsonOut);
		
		return jsonOut; //스프링에서 여기 든 걸 읽어서 jsp던져줌(ResponseBody 어노테이션 떄문에)
    }
	
	@RequestMapping(value = "ncnmCheck.do", produces = "application/text;charset=UTF-8")
	@ResponseBody
    public String ncnmChk(@ModelAttribute("ncnm") String ncnm){
    	System.out.println(ncnm);
    	MberDto mberDto = checkService.selectOneNcnmCheck(ncnm);
		
		boolean result = false;	//있단 전제하에 그냥 false로 해놓은것.
		
		if(mberDto == null)
		{
			result = true;//dto가 널이면 result를 true로.
		}
		
		JSONObject jsonObj = new JSONObject();//제이슨 오브젝트객체 만들고,
		jsonObj.put("result", result);//result라는 키값으로 result를 오브젝트객체에 넣는다.
		
		String jsonOut = jsonObj.toString(); //제이슨객체를 스트링으로 만들기위해. url 쿼리? > ?뒤에 머시기머시기로 만들기 위해.
		System.out.println("====" + jsonOut);
		
		return jsonOut; //스프링에서 여기 든 걸 읽어서 jsp던져줌(ResponseBody 어노테이션 떄문에)
    }
	
	@RequestMapping(value = "emailCheck.do", produces = "application/text;charset=UTF-8")
	@ResponseBody
    public String emailChk(@ModelAttribute("email") String email){
    	System.out.println(email);
    	MberDto mberDto = checkService.selectOneEmailCheck(email);
		
		boolean result = false;	//있단 전제하에 그냥 false로 해놓은것.
		
		if(mberDto == null)
		{
			result = true;//dto가 널이면 result를 true로.
		}
		
		JSONObject jsonObj = new JSONObject();//제이슨 오브젝트객체 만들고,
		jsonObj.put("result", result);//result라는 키값으로 result를 오브젝트객체에 넣는다.
		
		String jsonOut = jsonObj.toString(); //제이슨객체를 스트링으로 만들기위해. url 쿼리? > ?뒤에 머시기머시기로 만들기 위해.
		System.out.println("====" + jsonOut);
		
		return jsonOut; //스프링에서 여기 든 걸 읽어서 jsp던져줌(ResponseBody 어노테이션 떄문에)
    }
	
	@RequestMapping(value = "pwCheck.do", produces = "application/text;charset=UTF-8")
	@ResponseBody
    public String pwChk(@ModelAttribute("code") String code, @ModelAttribute("pw") String pw) {	//뭔일 할때 비밀번호 체크용
		
		MberDto mberDto = checkService.selectOnePw(code, pw);
		
		boolean result = false;	//있단 전제하에 그냥 false로 해놓은것.
		
		if(mberDto == null)
		{
			result = false;//dto가 널이면 result를 false로.
		}
		else {
			result = true;
		}
		
		JSONObject jsonObj = new JSONObject();//제이슨 오브젝트객체 만들고,
		jsonObj.put("result", result);//result라는 키값으로 result를 오브젝트객체에 넣는다.
		
		String jsonOut = jsonObj.toString(); //제이슨객체를 스트링으로 만들기위해. url 쿼리? > ?뒤에 머시기머시기로 만들기 위해.
		System.out.println("====" + jsonOut);
		
		return jsonOut; //스프링에서 여기 든 걸 읽어서 jsp던져줌(ResponseBody 어노테이션 떄문에)
    	
    }

}
