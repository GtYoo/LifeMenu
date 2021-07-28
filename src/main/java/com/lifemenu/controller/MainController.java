package com.lifemenu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping(value = "/")
	public String main() {
		return "redirect:/start.jsp";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "header")
	public String header(Model model) {
		return "include/header";
	}
	
	@RequestMapping(value = "footer")
	public String footer(Model model) {
		return "include/footer";
	}
}
