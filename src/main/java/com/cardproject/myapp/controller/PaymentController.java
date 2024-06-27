package com.cardproject.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cardproject.myapp.dto.PointDTO;
import com.cardproject.myapp.dto.TradeDTO;
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
		TradeDTO trade = pService.selectTradeById(tradeId);
		int point = mpService.selectTotalPointByUser(userid);
		
		return "payment/payment";
	}
	
	@GetMapping("api/send-pay")
	public void sendPay(HttpServletRequest req) {
		System.out.println(req);
	}

}
