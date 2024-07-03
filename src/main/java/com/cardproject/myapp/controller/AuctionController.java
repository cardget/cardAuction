package com.cardproject.myapp.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
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
import com.cardproject.myapp.dto.PokemonDTO;
import com.cardproject.myapp.dto.UserDTO;
import com.cardproject.myapp.service.AWSS3Service;
import com.cardproject.myapp.service.AuctionService;
import com.cardproject.myapp.service.MyPageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/auction")
public class AuctionController {

	@Autowired
	AuctionService aucs;
	@Autowired
	private AWSS3Service s3Service;
	@Autowired
	MyPageService mpService;

	@RequestMapping("/auctionMain.do")
	public String auctionMain(@RequestParam(defaultValue = "1") int page,
            				  @RequestParam(defaultValue = "10") int pageSize,
            				  @RequestParam(value = "sortOption", required = false) String sortOption,
            				  @RequestParam(required = false) String keyword,
            				  Model model,HttpSession session) {
		
		System.out.println("auctionmain page");
		//user_id
		String userId = (String) session.getAttribute("userid");
		model.addAttribute("userId", userId);
		System.out.println("###########################keyword:"+keyword);
		System.out.println("###########################sortOption:"+sortOption);
		
		if(keyword!=null && !keyword.isEmpty() ) { //검색했을 때
			int totalCount = aucs.getTotalItemCountByKeyword(keyword);
			System.out.println("###########################keywordFortotalCount:"+totalCount);
			
			List<ItemDetailDTO> itemSearchlist = aucs.selectItemForName(page,pageSize,keyword,sortOption);
			model.addAttribute("itemDlist", itemSearchlist);
			model.addAttribute("keyword",keyword);
			model.addAttribute("sortOption",sortOption);
			model.addAttribute("currentPage", page);
		    model.addAttribute("totalCount", totalCount);
		    model.addAttribute("pageSize", pageSize);
		}
		
		else {//기본
			int totalCount = aucs.getTotalItemCount();
			System.out.println("###########################totalCount:"+totalCount);
			
			if (sortOption == null) {
				sortOption = "recent";
			}
			
			List<ItemDetailDTO> itemDlist = aucs.getSortedItemList(page, pageSize,sortOption);
			model.addAttribute("sortOption", sortOption);
			model.addAttribute("itemDlist", itemDlist);
			model.addAttribute("currentPage", page);
		    model.addAttribute("totalCount", totalCount);
		    model.addAttribute("pageSize", pageSize);
		}
		//head user
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
	public void auctionDetail(Model model, @RequestParam("item_id") Integer item_id, HttpSession session) {
		String userId = (String) session.getAttribute("userid");
		boolean isBidHas = aucs.isBidding(userId,item_id);
		model.addAttribute("isBidHas",isBidHas);
		int price =aucs.myBidPrice(userId, item_id);
		model.addAttribute("price",price);
		System.out.println(session.getAttribute("userid"));
		System.out.println("auctionDetail page");
		System.out.println(item_id);
		model.addAttribute("userId", session.getAttribute("userid"));

		model.addAttribute("itemDetailOne", aucs.selectItemOne(item_id));

	}

	@GetMapping("/auctionInsert.do")
	public void auctionInsert(Model model) {
		System.out.println("auctionInsert page");
		//keyword를 post로 받고 .. 해야하네?
		//model.addAttribute("pSelectlist",aucs.selectPRight(cardKeyword));
		model.addAttribute("plist", aucs.selectPCard());

	}
	@GetMapping("/searchPokemon")
	@ResponseBody
	public List<PokemonDTO> searchPokemon(Model model, String cardKeyword){
		//model.addAttribute("pSelectlist",aucs.selectPRight(cardKeyword));
		return aucs.selectPRight(cardKeyword);
	}

	@PostMapping("/auctionInsert.do")
	public String insertItem(MultipartHttpServletRequest request, Model model, ItemDTO item, HttpSession session) {
		String userId = (String) session.getAttribute("userid");
		item.setUser_id(userId);
		List<MultipartFile> files = request.getFiles("images");
		List<String> uploadedImageUrls = new ArrayList<>();
		if (files.isEmpty()) {
			model.addAttribute("error", "최소한 한 개의 이미지를 업로드해야 합니다.");
			return "redirect:auctionInsert.do"; // 업로드 폼으로 리디렉션
		}
		for (MultipartFile file : files) {
			try {
				String fileName = "items/" + file.getOriginalFilename();
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

	@PostMapping(value = "/auctionBidding.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> insertBidding(@RequestBody BiddingDTO bid, HttpSession session) {
		System.out.println("auction Bidding");
		System.out.println(bid);

		Map<String, Object> response = new HashMap<String, Object>();
		String userId = (String) session.getAttribute("userid");
		bid.setIs_win(0);

		// 자신의 물품에 입찰하려는 경우
		if (aucs.isSeller(userId, bid.getItem_id())) {
			response.put("success", false);
			response.put("message", "본인의 경매 물품에는 입찰할 수 없습니다.");
			return ResponseEntity.ok(response);
		}

		// 동일물품에 입찰하려는 경우
		if (aucs.isBidding(userId, bid.getItem_id())) {
			response.put("success", false);
			response.put("message", "이미 입찰한 물품입니다. 입찰 금액 수정만 가능합니다.");
			System.out.println("이미 입찰한 물품");
			return ResponseEntity.ok(response);
		}

		bid.setUser_id(userId);
		aucs.biddingInsert(bid);
		response.put("success", true);
		response.put("message", "입찰에 성공했습니다.");
		return ResponseEntity.ok(response);
	}
	@PostMapping("/auctionBidUpdate.do")
	public String biddingPriceUpdate(int price, String user_id, Integer item_id) {
		
		int result = aucs.biddingPriceUpdate(price, user_id, item_id);
		
		return "redirect:auctionDetail.do?item_id="+item_id;
	}
	@PostMapping("/addLike")
	@ResponseBody
	public boolean addLike(@RequestParam String userId, @RequestParam Integer itemId) {
		return aucs.addLike(userId, itemId);
	}

	@PostMapping("/removeLike")
	@ResponseBody
	public boolean removeLike(@RequestParam String userId, @RequestParam Integer itemId) {
		return aucs.removeLike(userId, itemId);
	}

	@PostMapping("/isLiked")
	@ResponseBody
	public ResponseEntity<String> isLiked(@RequestParam String userId, @RequestParam Integer itemId) {
		 boolean isLiked = aucs.isLiked(userId, itemId);
		 System.out.println("####################### " + isLiked);
		    
		 if(isLiked) {
		     return ResponseEntity.ok("liked");
		 } else {
		     return ResponseEntity.ok("not liked");
		 }

	}
	//연결만
	@RequestMapping("/auctionDMain.do")
	public String auctionDMain() {
		return "auction/auctionDMain";
	}
	@RequestMapping("/auctionYMain.do")
	public String auctionYMain() {
		return "auction/auctionYMain";
	}
	@RequestMapping("/auctionSMain.do")
	public String auctionSMain() {
		return "auction/auctionSMain";
	}
	@RequestMapping("/auctionOMain.do")
	public String auctionOMain() {
		return "auction/auctionOMain";
	}
	
}
