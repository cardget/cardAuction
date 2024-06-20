package com.cardproject.myapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cardproject.myapp.dto.BoardListDTO;
import com.cardproject.myapp.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {

	@Autowired
	CommunityService cService;

	// 게시글 리스트 조회
	@GetMapping("/BoardSelect.do")
	public String BoardSelect(Model model) {
		System.out.println("/community/BoardSelect.do get요청");

		List<BoardListDTO> blist = cService.selectBoardList();
		System.out.println(blist);
		model.addAttribute("blist", blist);
		return "community/BoardSelect";
	}

	// 게시글 상세 조회
	@GetMapping("/BoardDetail.do")
	public String BoardDetail(Integer commId, Model model) {
		System.out.println("/community/BoardDetail.do get요청");
		
		cService.updateViews(commId); // 상세 조회시 조회수 증가
		model.addAttribute("board", cService.selectBoardByCommId(commId));
		return "community/BoardDetail";
	}

	// 게시글 등록 페이지
	@GetMapping("/BoardInsert.do")
	public void BoardInsertPage() {
		System.out.println("/community/BoardDetail.do get요청");
	}

	// 게시글 등록
	@PostMapping("/BoardInsert.do")
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
