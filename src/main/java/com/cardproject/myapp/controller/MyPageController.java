package com.cardproject.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@GetMapping("/myInfo.do")
	public void myInfo() {
	}
	
	@GetMapping("/myBid.do")
	public void myBid() {
	}
	
	@GetMapping("/mySale.do")
	public void mySale() {
	}
	
	@GetMapping("/myInterest.do")
	public void myInterest() {
	}
	
	@GetMapping("/myPoint.do")
	public void myPoint() {
	}
	
	@GetMapping("/myDelivery.do")
	public void myDelivery() {
	}
}
