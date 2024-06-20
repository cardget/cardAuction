package com.cardproject.myapp.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cardproject.myapp.dto.BiddingResultDTO;
import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.dto.PointDTO;
import com.cardproject.myapp.dto.UserDTO;
import com.cardproject.myapp.service.MyPageService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	MyPageService mpService;

	@Autowired
	HttpSession session;

	// 내 정보 조회
	@GetMapping("/myInfo.do")
	public String myInfo(Model model) {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			return "redirect:../auth/login.do";
		}

		UserDTO user = mpService.selectUserById(userid);
		model.addAttribute("user", user);
		return "mypage/myInfo";
	}

	// 입찰내역 조회
	@GetMapping("/myBid.do")
	public String myBid(Model model) {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			return "redirect:../auth/login.do";
		}

		UserDTO user = mpService.selectUserById(userid);
		model.addAttribute("user", user);
		
		List<BiddingResultDTO> bids = mpService.selectAllBids(userid);
		model.addAttribute("bids", bids);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String nowStr = sdf.format(new java.util.Date());
		model.addAttribute("now", nowStr);
		
		return "mypage/myBid";
	}

	// 판매내역 조회
	@GetMapping("/mySale.do")
	public String mySale(Model model) {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			return "redirect:../auth/login.do";
		}

		UserDTO user = mpService.selectUserById(userid);
		model.addAttribute("user", user);
		
		List<ItemDTO> sales = mpService.selectAllSales(userid);
		model.addAttribute("sales", sales);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String nowStr = sdf.format(new java.util.Date());
		model.addAttribute("now", nowStr);
		return "mypage/mySale";
	}

	// 관심목록 조회
	@GetMapping("/myInterest.do")
	public String myInterest(Model model) {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			return "redirect:../auth/login.do";
		}

		UserDTO user = mpService.selectUserById(userid);
		model.addAttribute("user", user);
		
		List<ItemDTO> interests = mpService.selectAllLikes(userid);
		model.addAttribute("interests", interests);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String nowStr = sdf.format(new java.util.Date());
		model.addAttribute("now", nowStr);
		return "mypage/myInterest";
	}

	// 포인트 조회
	@GetMapping("/myPoint.do")
	public String myPoint(Model model) {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			return "redirect:../auth/login.do";
		}

		UserDTO user = mpService.selectUserById(userid);
		model.addAttribute("user", user);
		
		List<PointDTO> points = mpService.selectPointByUser(userid);
		int total = mpService.selectTotalPointByUser(userid);
		int purchase = mpService.selectTotalPointByCat(userid, 1);
		int sales = mpService.selectTotalPointByCat(userid, 2);
		int sorry = mpService.selectTotalPointByCat(userid, 3);
		int event = mpService.selectTotalPointByCat(userid, 4);
		int used = mpService.selectTotalPointByCat(userid, 5);
		model.addAttribute("points", points);
		model.addAttribute("purchase", purchase);
		model.addAttribute("sales", sales);
		model.addAttribute("sorry", sorry);
		model.addAttribute("event", event);
		model.addAttribute("total", total);
		model.addAttribute("used", used);
		return "mypage/myPoint";
	}

	// 배송조회
	@GetMapping("/myDelivery.do")
	public String myDelivery(Model model) {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			return "redirect:../auth/login.do";
		}

		UserDTO user = mpService.selectUserById(userid);
		model.addAttribute("user", user);
		return "mypage/myDelivery";
	}
}
