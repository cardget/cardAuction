package com.cardproject.myapp.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@PostMapping("result")
    public String payResult(@RequestParam("trade_id") int tradeId,
                            @RequestParam("used_point") int usedPoint,
                            @RequestParam("amount") int amount,
                            @RequestParam("buyer_name") String buyerName,
                            @RequestParam("item_name") String itemName,
                            PaymentDTO payment,
                            Model model) {
		
		String userid = (String) session.getAttribute("userid");
		String cmt = "[구매] " + itemName;
		
		// 포인트 사용 내역 추가
		pService.usingPoint(amount, userid, cmt);
		
		// 결제 여부 갱신
		pService.updatePaid(tradeId);
		
		// 결제 내용 추가
		payment.setTrade_id(tradeId);
		payment.setPoint_used(usedPoint);
		pService.insertPayment(payment);
		
        model.addAttribute("payment", payment);
        model.addAttribute("itemName", itemName);

        return "payment/paymentResult";
    }

}
