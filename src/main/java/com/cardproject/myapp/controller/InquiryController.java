package com.cardproject.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {

	@GetMapping("/InquiryDetail.do")
	public void InquiryDetail() {
	}

	@GetMapping("/InquiryInsert.do")
	public void InquiryInsert() {
	}
}
