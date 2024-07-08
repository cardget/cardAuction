package com.cardproject.myapp.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cardproject.myapp.dto.PaymentDTO;
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
	
	@PostMapping("/result")
    public String payResult(@RequestBody PaymentDTO paymentRequest) {
		
		String userid = (String) session.getAttribute("userid");
		
		int tradeId = paymentRequest.getTrade_id();
        int pointUsed = paymentRequest.getPoint_used();
        int paidAmount = paymentRequest.getPaid_amount();
        String itemName = paymentRequest.getItem_name();
        String buyerAddr = paymentRequest.getBuyer_addr();
        
        String seller = pService.selectSeller(tradeId);
        
        final double POINT_RATE = 0.02;
        
        // 로직 처리
        if (pointUsed > 0) {
        	pService.usingPoint(pointUsed, userid, "[구매] " + itemName);
        }
        pService.updatePaid(tradeId);
        pService.insertDelivery(tradeId, buyerAddr);
        pService.getPoint((int) (paidAmount*POINT_RATE), "[구매] " + itemName, userid, 1);
        pService.getPoint((int) (paidAmount*POINT_RATE), "[판매] " + itemName, seller, 2);
        
        return "payment/paymentResult";
    }
	
	@GetMapping("result")
    public String payResult() {
        return "payment/paymentResult";
    }

}
