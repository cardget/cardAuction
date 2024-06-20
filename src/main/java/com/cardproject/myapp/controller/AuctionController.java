package com.cardproject.myapp.controller;


import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.dto.ItemDetailDTO;
import com.cardproject.myapp.service.AuctionService;




@Controller
@RequestMapping("/auction")
public class AuctionController {
	
	@Autowired
	AuctionService aucs;
	
	
	
	@RequestMapping("/auctionMain.do")
	public String auctionMain(@RequestParam(value = "sortOption", required = false) String sortOption,Model model) {
		System.out.println("auctionmain page");
		if (sortOption == null) {
	        sortOption = "recent"; // 기본값 설정
	    }
	    System.out.println("auctionmain page with sortOption: " + sortOption);
		List<ItemDetailDTO> itemDlist = aucs.getSortedItemList(sortOption);
		model.addAttribute("selectedSortOption", sortOption);
		model.addAttribute("itemDlist",itemDlist);
		return "auction/auctionMain";
	}
	@GetMapping("/auctionDetail.do")
	public void auctionDetail() {
		System.out.println("auctionDetail page");
		
	}
	@GetMapping("/auctionInsert.do")
	public void auctionInsert() {
		System.out.println("auctionInsert page");
		
	}
	@PostMapping("/auctionInsert.do")
	public String insertItem(ItemDTO item) {
		
		aucs.itemInsert(item);
		return "redirect:auctionMain.do";
		
	}
}
