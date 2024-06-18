package com.cardproject.myapp.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.cardproject.myapp.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {

	@Autowired
	CommunityService cService;

	/*
	 * // 전체 일반조회 ( 페이징 처리 할 때 분할 예정 .. 1이면 1-10 / 2이면 2-10 / 총개수/10 해서만큼 페이지 버튼 생성 )
	 * @GetMapping("/BoardSelect.do") public void BoardSelect(Model model) {
	 * System.out.println("/community/BoardSelect.do 요청");
	 * 
	 * Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
	 * String message = ""; if(flashMap != null) { flashMap.get("resultMessage"); }
	 * 
	 * List<CommunityDTO> blist = cService }
	 */
	
	@GetMapping("/BoardDetail.do")
	public void BoardDetail() {
		cService.test(); // community mybatis test
	}

	@GetMapping("/BoardInsert.do")
	public void BoardInsert() {
	}

	@GetMapping("/BoardModify.do")
	public void BoardModify() {
	}
	
	@GetMapping("/InquirySelect.do")
	public void InquirySelect() {
		
	}

	@GetMapping("/InquiryDetail.do")
	public void InquiryDetail() {
	}
	
	@GetMapping("/InquiryInsert.do")
	public void InquiryInsert() {
	}
}
