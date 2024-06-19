package com.cardproject.myapp.controller;


import java.sql.Date;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.service.AuctionService;




@Controller
@RequestMapping("/auction")
public class AuctionController {
	
	@Autowired
	AuctionService aucs;
	
	@GetMapping("/auctionMain.do")
	public void auctionMain() {
		System.out.println("auctionmain page");
		//aucs.test(); //mybatis test
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
