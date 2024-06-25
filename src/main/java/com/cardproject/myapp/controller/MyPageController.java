package com.cardproject.myapp.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cardproject.myapp.dto.BiddingResultDTO;
import com.cardproject.myapp.dto.DeliveryDTO;
import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.dto.NotificationDTO;
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
	public String updateProfile(@RequestParam("nickname") String nickname,
			@RequestParam("phone_number") String phoneNumber, @RequestParam("email") String email, @RequestParam("domain") String domain,
			@RequestParam("address") String address, @RequestParam("address_detail") String addressDetail,
			@RequestParam("accnt") String account, @SessionAttribute("user") UserDTO user,
			RedirectAttributes redirectAttributes) {
		user.setNickname(nickname);
		user.setPhone_number(phoneNumber);
		user.setEmail(email);
		user.setAddress(address);
		user.setAddress_detail(addressDetail);
		user.setAccnt(account);

		mpService.userUpdate(user);
		redirectAttributes.addFlashAttribute("message", "회원정보가 성공적으로 수정되었습니다.");

		return "redirect:mypage/";
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
	
	@GetMapping("/deleteInterest.do")
	public String deleteInterest(Model model) {
		String userid = (String) session.getAttribute("userid");
		
		int result = mpService.deleteAllLikes(userid);
		String message;
		if (result > 0) {
			message = "관심 물픔을 모두 삭제하였습니다.";
		}else {
			message = "삭제할 대상이 없거나 실패하였습니다.";
		}
		
		model.addAttribute(message);
		return "redirect:mypage/myInterest";
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
		
		List<NotificationDTO> nlist = mpService.selectAllNotifications(userid);
		
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
		String message = result>0?"success":"failure";
		
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
		String message = result>0?"success":"failure";
		
		List<NotificationDTO> nlist = mpService.selectAllNotifications(userid);
		
		model.addAttribute("nlist", nlist);
		
		return "mypage/myNotification";
	}
	
	@GetMapping("/markAsRead.do")
	public String markAsRead(@RequestParam("notiId") int notiId,
							@RequestParam("itemId") int itemId,
							Model model) {
		mpService.isReadUpdate(notiId);

	    return "redirect:../auction/auctionDetail.do?item_id=" + itemId;
	}
}
