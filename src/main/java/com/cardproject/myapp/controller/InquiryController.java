package com.cardproject.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {

	/*
	 * @GetMapping("InquirySelect.do") public void InquirySelect() {
	 * System.out.println("페이지 커뮤니티 수정해서 긁어와야합니다"); }
	 */
	
	@GetMapping("/InquiryDetail.do")
	public void InquiryDetail() {
	}

	@GetMapping("/InquiryInsert.do")
	public void InquiryInsert() {
	}
}
