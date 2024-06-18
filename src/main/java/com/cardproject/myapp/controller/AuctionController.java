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
		aucs.test(); //mybatis test
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
		System.out.println(item);
		//판매자 아이디 session에서 받아서 set
		item.setUser_id("seoyeon");
		//생성일을 현재 날짜,시간으로 set
		java.util.Date now = new java.util.Date();
	    item.setCreate_date(new Date(now.getTime()));
	    
	    // end_date어케하지리발
        
	    //카테고리 (나중에 if로 분류)
		item.setCat(0);
		item.setImage1("test.png");
		
		System.out.println(item);
		aucs.itemInsert(item);
		return "redirect:auctionMain.do";
		
	}
}
