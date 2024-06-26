package com.cardproject.myapp.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cardproject.myapp.dto.BiddingDTO;
import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.dto.ItemDetailDTO;
import com.cardproject.myapp.dto.LikeDTO;
import com.cardproject.myapp.dto.NotificationDTO;
import com.cardproject.myapp.dto.UserDTO;
import com.cardproject.myapp.service.AWSS3Service;
import com.cardproject.myapp.service.AuctionService;
import com.cardproject.myapp.service.MyPageService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/auction")
public class AuctionController {

	
	final AuctionService aucs;

	private final AWSS3Service s3Service;
	
	final MyPageService mpService; 


	@RequestMapping("/auctionMain.do")
	public String auctionMain(@RequestParam(value = "sortOption", required = false) String sortOption,HttpSession session, Model model) {
		System.out.println("auctionmain page");
		if (sortOption == null) {
			sortOption = "recent";
		}
		System.out.println("auctionmain page with sortOption: " + sortOption);
		List<ItemDetailDTO> itemDlist = aucs.getSortedItemList(sortOption);
		model.addAttribute("selectedSortOption", sortOption);
		model.addAttribute("itemDlist", itemDlist);
		String userid = (String) session.getAttribute("userid");
    	
    	if (userid != null) {
			UserDTO user = mpService.selectUserById(userid);
			List<NotificationDTO> nlist = mpService.selectFiveNotifications(userid);
			model.addAttribute("user", user);
			model.addAttribute("nlist", nlist);
		}
		return "auction/auctionMain";
	}

	@GetMapping("/auctionDetail.do")
	public void auctionDetail(Model model,@RequestParam("item_id") Integer item_id, HttpSession session) {
		System.out.println("auctionDetail page");
		System.out.println(item_id);

		model.addAttribute("itemDetailOne", aucs.selectItemOne(item_id));

	}

	@GetMapping("/auctionInsert.do")
	public void auctionInsert(Model model) {
		System.out.println("auctionInsert page");
		model.addAttribute("plist", aucs.selectPCard());

	}

	@PostMapping("/auctionInsert.do")
	public String insertItem(MultipartHttpServletRequest request, Model model, ItemDTO item) {
		List<MultipartFile> files = request.getFiles("images");
		List<String> uploadedImageUrls = new ArrayList<>();
		if (files.isEmpty()) {
            model.addAttribute("error", "최소한 한 개의 이미지를 업로드해야 합니다.");
            return "redirect:auctionInsert.do"; // 업로드 폼으로 리디렉션
        }
		for (MultipartFile file : files) {
			try {
				String fileName = "items/"+file.getOriginalFilename();
				String url = s3Service.uploadObject(file, fileName);
				uploadedImageUrls.add(url);
			} catch (IOException e) {
				e.printStackTrace();
				// 에러 처리
			}
		}
		// 이미지 URL을 ItemDTO에 설정
		if (!uploadedImageUrls.isEmpty()) {
			for (int i = 0; i < uploadedImageUrls.size(); i++) {
				switch (i) {
				case 0:
					item.setImage1(uploadedImageUrls.get(i));
					break;
				case 1:
					item.setImage2(uploadedImageUrls.get(i));
					break;
				case 2:
					item.setImage3(uploadedImageUrls.get(i));
					break;
				case 3:
					item.setImage4(uploadedImageUrls.get(i));
					break;
				case 4:
					item.setImage5(uploadedImageUrls.get(i));
					break;
				}
			}
		}
		
		aucs.itemInsert(item);
		return "redirect:auctionMain.do";

	}
//	@PostMapping("/auctionBidding.do")
//	public String insertBidding(BiddingDTO bid, Model model, HttpSession session ) {
//
//		System.out.println("auction Bidding");
//		System.out.println(bid);
//		String userId = (String) session.getAttribute("userid");
//		bid.setUser_id(userId);
//		bid.setIs_win(0);
//		
//		
//	    //동일물품에 입찰하려는 경우
//	    if (aucs.isBidding(userId, bid.getItem_id())) {
//	    	session.setAttribute("errorMessage", "이미 입찰하신 경매물품 입니다.");
//	        return "redirect:auctionDetail.do?item_id=" + bid.getItem_id();
//	    }
//	    
//		aucs.biddingInsert(bid);
//		
//		return "redirect:auctionDetail.do?item_id=" + bid.getItem_id();
//	}
	@PostMapping(value= "/auctionBidding.do", produces="application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> insertBidding(@RequestBody BiddingDTO bid, HttpSession session) {
	    System.out.println("auction Bidding");
	    String userId = (String) session.getAttribute("userid");
	    bid.setUser_id(userId);
	    bid.setIs_win(0);
	    
	    Map<String, Object> response = new HashMap<String,Object>();
	    
	    // 동일물품에 입찰하려는 경우
	    if (aucs.isBidding(userId, bid.getItem_id())) {
	    	response.put("success", false);
	    	response.put("message", "이미 입찰한 물품입니다.");
	        System.out.println("이미 입찰한 물품");
	        return ResponseEntity.ok(response);
	    }

	    aucs.biddingInsert(bid);
	    response.put("success", true);
    	response.put("message", "입찰에 성공했습니다.");
	    return ResponseEntity.ok(response);
	}
	@PostMapping("/like/toggle")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> toggleLike(@RequestBody Map<String, String> request,
			HttpSession session) {
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

}
