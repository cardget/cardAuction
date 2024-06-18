package com.cardproject.myapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cardproject.myapp.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {

	@Autowired
	CommunityService coms;
	
	@GetMapping("/BoardDetail.do")
	public void BoardDetail() {
		System.out.println("BoardDetail page");
		coms.test(); // community mybatis test
	}
	
	@GetMapping("/BoardInsert.do")
	public void BoardInsert() {
		System.out.println("BoardInsert page");
	}
	
	@GetMapping("/BoardModify.do")
	public void BoardModify() {
		System.out.println("BoardModify page");
	}
	
	@GetMapping("/InquiryDetail.do")
	public void InquiryDetail() {
		System.out.println("InquiryDetail page");
	}
	
	@GetMapping("/InquiryInsert.do")
	public void InquiryInsert() {
		System.out.println("InquiryInsert page");
	}
}
