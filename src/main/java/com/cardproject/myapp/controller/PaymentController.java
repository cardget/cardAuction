package com.cardproject.myapp.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cardproject.myapp.dto.TradeDTO;
import com.cardproject.myapp.dto.UserDTO;
import com.cardproject.myapp.service.MyPageService;
import com.cardproject.myapp.service.PaymentService;

@Controller
@RequestMapping("/payment")
public class PaymentController {

	@Autowired
	PaymentService pService;
	
	@Autowired
	MyPageService mpService;

	@Autowired
	HttpSession session;
	
	@GetMapping("pay.do")
	public String displayPay(@RequestParam("tradeId") int tradeId, Model model) {
		
		String userid = (String) session.getAttribute("userid");
		
		UserDTO user = mpService.selectUserById(userid);
		TradeDTO trade = pService.selectTradeById(tradeId);
		int point = mpService.selectTotalPointByUser(userid);
		
		model.addAttribute("user", user);
		model.addAttribute("trade", trade);
		model.addAttribute("point", point);
		
		return "payment/payment";
	}
	
	@PostMapping("result.do")
	public String payResult(Model model) {
		return "payment/paymentResult";
	}

}
