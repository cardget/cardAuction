package com.cardproject.myapp.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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
			sortOption = "recent"; 
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
	
	@PostMapping("/like/toggle")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> toggleLike(@RequestBody Map<String, String> request, HttpSession session) {
        String userId = (String) session.getAttribute("userid");
        Integer itemId = Integer.parseInt(request.get("itemId"));
        Map<String, Object> response = new HashMap<>();
        
        if (aucs.isLiked(userId, itemId)) {
            response.put("success", aucs.removeLike(userId, itemId));
            response.put("status", "removed");
        } else {
            response.put("success", aucs.addLike(userId, itemId));
            response.put("status", "added");
        }
        
        return ResponseEntity.ok(response);
    }

    @GetMapping("/like/status")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getLikeStatus(@RequestParam String itemId, HttpSession session) {
        String userId = (String) session.getAttribute("userid");
        Integer itemIdInt = Integer.parseInt(itemId);
        Map<String, Object> response = new HashMap<>();
        boolean isLiked = aucs.isLiked(userId, itemIdInt);
        response.put("isLiked", isLiked);
        return ResponseEntity.ok(response);
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
