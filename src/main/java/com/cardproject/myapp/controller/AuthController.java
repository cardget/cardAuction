package com.cardproject.myapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cardproject.myapp.dto.UserDTO;
import com.cardproject.myapp.service.AuthService;

@Controller
@RequestMapping("/auth")
public class AuthController {

	@Autowired
	AuthService aService;

	@GetMapping("/signUp.do")
	public void signUp() {
		System.out.println("signUp page");
	}

	@GetMapping("/login.do")
	public void login() {
		System.out.println("login page");
	}

	@PostMapping("/login.do")
	public String loginCheck(@RequestParam("userid") String userid, @RequestParam("password") String password,
			HttpSession session, HttpServletRequest request) {

		UserDTO user = aService.loginChk(userid, password);
		if (user == null) {
			session.setAttribute("loginResult", "Login Failure: Invalid Email or Password");
			return "redirect:login.do";
		} else {
			// login success
			session.setAttribute("loginResult", "Login Success");
			session.setAttribute("userid", user.getUser_id());

			String lastRequest = (String) session.getAttribute("lastRequest");
			String queryString = (String) session.getAttribute("queryString");
			String goPage;
			if (lastRequest == null) {
				goPage = "../";
			} else {
				int length = request.getContextPath().length();
				goPage = lastRequest.substring(length);
				if (queryString != null)
					goPage = goPage + "?" + queryString;
			}
			return "redirect:" + goPage;
		}
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
