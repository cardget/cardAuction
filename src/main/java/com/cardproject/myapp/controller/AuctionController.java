package com.cardproject.myapp.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.dto.ItemDetailDTO;
import com.cardproject.myapp.dto.LikeDTO;
import com.cardproject.myapp.service.AuctionService;

@Controller
@RequestMapping("/auction")
public class AuctionController {

	@Autowired
	AuctionService aucs;

	@RequestMapping("/auctionMain.do")
	public String auctionMain(@RequestParam(value = "sortOption", required = false) String sortOption, Model model) {
		System.out.println("auctionmain page");
		if (sortOption == null) {
			sortOption = "recent"; // �⺻�� ����
		}
		System.out.println("auctionmain page with sortOption: " + sortOption);
		List<ItemDetailDTO> itemDlist = aucs.getSortedItemList(sortOption);
		model.addAttribute("selectedSortOption", sortOption);
		model.addAttribute("itemDlist", itemDlist);
		return "auction/auctionMain";
	}

	@GetMapping("/auctionDetail.do")
	public void auctionDetail(Model model, Integer item_id, HttpSession session) {
		System.out.println("auctionDetail page");
		System.out.println(item_id);
		// ItemDetailDTO itemDetailOne = aucs.selectItemOne(item_id);
		// System.out.println(itemDetailOne);
		model.addAttribute("itemDetailOne", aucs.selectItemOne(item_id));
//		String userId = (String) session.getAttribute("userid");
//		int itemId = item_id;
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("user_id", userId);
//		map.put("item_id", itemId);
//		aucs.likeDelete(map);
	}

	@GetMapping("/auctionInsert.do")
	public void auctionInsert(Model model) {
		System.out.println("auctionInsert page");
		model.addAttribute("plist", aucs.selectPCard());

	}

	@PostMapping("/auctionInsert.do")
	public String insertItem(ItemDTO item) {

		aucs.itemInsert(item);
		return "redirect:auctionMain.do";

	}

	@PostMapping("/removeInterest")
	@ResponseBody
	public String removeInterest(@RequestParam("item_id") int itemId, HttpSession session) {
		String userId = (String) session.getAttribute("userid");

		if (userId != null) {
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("user_id", userId);
			paramMap.put("item_id", itemId);

			int result = aucs.likeDelete(paramMap);
			if (result > 0) {
				return "success";
			} else {
				return "fail";
			}
		} else {
			return "fail";
		}
	}

	@PostMapping("/registerInterest")
	@ResponseBody
	public String registerInterest(@RequestParam("item_id") int itemId, HttpSession session) {
		String userId = (String) session.getAttribute("userid");

		if (userId != null) {
			LikeDTO like = new LikeDTO();
			like.setUser_id(userId);
			like.setItem_id(itemId);

			int result = aucs.likeInsert(like);
			if (result > 0) {
				return "success";
			} else {
				return "fail";
			}
		} else {
			return "fail";
		}
	}
//	@PostMapping("/registerInterest")
//	@ResponseBody
//	public String registerInterest(@RequestParam("item_id") int itemId, HttpSession session) {
//		String userId = (String) session.getAttribute("userid"); 
//
//		if (userId != null) {
//			LikeDTO like = new LikeDTO();
//			like.setUser_id(userId);
//			like.setItem_id(itemId);
//
//			aucs.likeInsert(like);
//			return "success";
//		} else {
//			return "fail";
//		}
//	}
}
