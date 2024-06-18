package com.cardproject.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/deckMakers")
public class DeckMakerController {
	
	
	@GetMapping("/deckListDetail.do")
	public void auctionMain() {
		System.out.println("deckDetail page");
		
	}
	@GetMapping("/deckListMain.do")
	public void auctionDetail() {
		System.out.println("deckListMain page");
		
	}
	@GetMapping("/deckMaker.do")
	public void auctionInsert() {
		System.out.println("deckMaker page");
		

	}
}
