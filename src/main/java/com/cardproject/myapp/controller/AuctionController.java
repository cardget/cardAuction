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

import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.dto.ItemDetailDTO;
import com.cardproject.myapp.dto.LikeDTO;
import com.cardproject.myapp.service.AWSS3Service;
import com.cardproject.myapp.service.AuctionService;

@Controller
@RequestMapping("/auction")
public class AuctionController {

	@Autowired
	AuctionService aucs;
	@Autowired
	private AWSS3Service s3Service;

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
		// 이미지 URL을 ItemDTO에 설정합니다.
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
		// 경매 데이터와 업로드된 이미지 URL을 저장합니다.
		// model.addAttribute("uploadedImageUrls", uploadedImageUrls);
		aucs.itemInsert(item);
		return "redirect:auctionMain.do";

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
