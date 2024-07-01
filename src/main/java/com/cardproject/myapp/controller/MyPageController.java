package com.cardproject.myapp.controller;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cardproject.myapp.dto.BiddingResultDTO;
import com.cardproject.myapp.dto.DeliveryDTO;
import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.dto.NotificationDTO;
import com.cardproject.myapp.dto.PointDTO;
import com.cardproject.myapp.dto.TradeDTO;
import com.cardproject.myapp.dto.UserDTO;
import com.cardproject.myapp.service.AWSS3Service;
import com.cardproject.myapp.service.MyPageService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	MyPageService mpService;

	@Autowired
	private AWSS3Service s3Service;
	
	@Autowired
	HttpSession session;

	// 내 정보 조회
	@GetMapping("/")
	public String myPage(Model model) {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			return "redirect:../auth/login.do";
		}

		UserDTO user = mpService.selectUserById(userid);
		List<NotificationDTO> nlist = mpService.selectFiveNotifications(userid);

		model.addAttribute("user", user);
		model.addAttribute("nlist", nlist);

		return "mypage/myPage";
	}

	// 내 정보 조회
	@GetMapping("/myInfo.do")
	public String myInfo(Model model) {
		String userid = (String) session.getAttribute("userid");

		UserDTO user = mpService.selectUserById(userid);
		model.addAttribute("user", user);
		return "mypage/myInfo";
	}

	// 내 정보 수정
	@GetMapping("/editProfile.do")
	public String editProfile(Model model) {
		String userid = (String) session.getAttribute("userid");
		UserDTO user = mpService.selectUserById(userid);
		String[] emailParts = user.getEmail().split("@");
		String localPart = emailParts[0];
		String domainPart = emailParts[1];
		model.addAttribute("user", user);
		model.addAttribute("localPart", localPart);
		model.addAttribute("domainPart", domainPart);
		return "mypage/editProfile";
	}

	@PostMapping("/editProfile.do")
	public String updateProfile(
			@RequestParam(value= "profile_image_name", required=false) MultipartFile file,
			@RequestParam("nickname") String nickname, 
			@RequestParam("email") String email,
			@RequestParam("domain") String domain, 
			@RequestParam("email_agreement") String email_agreement, 
			@RequestParam("address") String address,
			@RequestParam("detailAddress") String addressDetail, 
			@RequestParam("zipCode") String zipCode, 
			@RequestParam("bank") String bank,
			@RequestParam("accnt") String accnt, 
			@SessionAttribute("userid") String userid, 
			Model model, RedirectAttributes redirectAttributes) {
		
		UserDTO user = mpService.selectUserById(userid);
		String fullEmail = email + "@" + domain;
		int i_email_agreement = Integer.parseInt(email_agreement);
		
		String originalFileName = file.getOriginalFilename();
		
		String rawFileName = originalFileName.substring(0,originalFileName.lastIndexOf(".")); // 이름
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		
		if(file!=null&& !file.isEmpty()) {
    		String fileName="profile/"+rawFileName+System.currentTimeMillis()+"."+extension;
	    	try {
				String url=s3Service.uploadObject(file, fileName);
				user.setProfile_image(url);	// 이미지 URL을 UserDTO 에 설정
			} catch (java.io.IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				model.addAttribute("error","이미지 업로드 중 오류가 발생했습니다.");
				return "redirect:signUp.do";
			}    		
    	}else {
    		user.setProfile_image(null);
    	}   
		
		user.setNickname(nickname);
		user.setEmail(fullEmail);
		user.setEmail_agreement(i_email_agreement);
		user.setZip_code(zipCode);
		user.setAddress(address);
		user.setAddress_detail(addressDetail);
		user.setBank(bank);
		user.setAccnt(accnt);

		mpService.userUpdate(user);
		redirectAttributes.addFlashAttribute("message", "회원정보가 성공적으로 수정되었습니다.");

		return "redirect:/mypage/";
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

	// 낙찰내역 조회
	@GetMapping("/myTrade.do")
	public String myTrade(Model model) {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			return "redirect:../auth/login.do";
		}

		List<TradeDTO> tlist = mpService.selectAllTrades(userid);
		for(TradeDTO trade: tlist) {
			System.out.println(trade);
		}
		model.addAttribute("tlist", tlist);

		return "mypage/myTrade";
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

	@GetMapping("/deleteInterest.do")
	public String deleteInterest(Model model) {
		String userid = (String) session.getAttribute("userid");

		int result = mpService.deleteAllLikes(userid);
		String message;
		if (result > 0) {
			message = "관심 물픔을 모두 삭제하였습니다.";
		} else {
			message = "삭제할 대상이 없거나 실패하였습니다.";
		}

		model.addAttribute(message);
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
		List<DeliveryDTO> dlist = mpService.selectAllDeliveries(userid);
		model.addAttribute("user", user);
		model.addAttribute("dlist", dlist);
		return "mypage/myDelivery";
	}

	// 모든 알림 조회
	@GetMapping("/myNoti.do")
	public String myNoti(Model model) {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			return "redirect:../auth/login.do";
		}

		UserDTO user = mpService.selectUserById(userid);
		List<NotificationDTO> nlist = mpService.selectAllNotifications(userid);
		model.addAttribute("user", user);
		model.addAttribute("nlist", nlist);
		return "mypage/myNotification";
	}

	@GetMapping("/readUpdate.do")
	public String readUpdate(Model model) {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			return "redirect:../auth/login.do";
		}

		int result = mpService.isReadUpdateAll(userid);
		String message = result > 0 ? "success" : "failure";

		List<NotificationDTO> nlist = mpService.selectAllNotifications(userid);
		model.addAttribute("nlist", nlist);
		model.addAttribute("message", message);
		return "mypage/myNotification";
	}

	@GetMapping("/deleteAllNoti.do")
	public String deleteAllNoti(Model model) {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			return "redirect:../auth/login.do";
		}

		int result = mpService.deleteAllNotificationRead(userid);
		String message = result > 0 ? "success" : "failure";

		List<NotificationDTO> nlist = mpService.selectAllNotifications(userid);

		model.addAttribute("nlist", nlist);

		return "mypage/myNotification";
	}

	@GetMapping("/markAsRead.do")
	public String markAsRead(@RequestParam("notiId") int notiId, @RequestParam("itemId") int itemId, Model model) {
		mpService.isReadUpdate(notiId);

		return "redirect:../auction/auctionDetail.do?item_id=" + itemId;
	}

	// 회원 탈퇴
	@GetMapping("/updateUserDisabled.do")
	public String displayDeleteUser(Model model) {
		return "mypage/userDisabled";
	}

	@PostMapping("/updateUserDisabled.do")
	@ResponseBody
	public Map<String, Object> updateUserDisabled(@RequestParam("password") String password, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		int result = mpService.updateUserDisabled(userid, password);
		Map<String, Object> response = new HashMap<>();
		response.put("success", result > 0);
		return response;
	}
}
