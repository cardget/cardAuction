package com.cardproject.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@GetMapping("/adminMain.do")
	public void adminMain() {
		System.out.println("adminMain page");
	}
	@GetMapping("/insertCard.do")
	public void insertCard() {
		System.out.println("insertCard page");
	}
}
