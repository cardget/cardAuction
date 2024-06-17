package com.cardproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/auction")
public class AuctionController {
	
	
	@GetMapping("/auctionMain.do")
	public void auctionMain() {
		System.out.println("auctionmain page");
		
	}
	@GetMapping("/auctionDetail.do")
	public void auctionDetail() {
		System.out.println("auctionDetail page");
		
	}
	@GetMapping("/auctionInsert.do")
	public void auctionInsert() {
		System.out.println("auctionInsert page");
		

	}
}
