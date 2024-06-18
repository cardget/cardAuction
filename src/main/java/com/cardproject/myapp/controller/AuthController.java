package com.cardproject.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class AuthController {
	
	@GetMapping("/signUp.do")
	public void signUp() {
		System.out.println("signUp page");
	}
	@GetMapping("/logIn.do")
	public void logIn() {
		System.out.println("logIn page");
	}
	@GetMapping("/findId.do")
	public void findId() {
		System.out.println("findId page");
	}
	@GetMapping("/findIdResult.do")
	public void findIdResult() {
		System.out.println("findIdResult page");
	}
	@GetMapping("/findPassword.do")
	public void findPassword() {
		System.out.println("findPassword page");
	}
	@GetMapping("/resetPassword.do")
	public void resetPassword() {
		System.out.println("resetPassword page");
	}
	

}
