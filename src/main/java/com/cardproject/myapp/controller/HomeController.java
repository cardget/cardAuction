package com.cardproject.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cardproject.myapp.dto.NotificationDTO;
import com.cardproject.myapp.dto.UserDTO;
import com.cardproject.myapp.service.MyPageService;

@Controller
public class HomeController {

	@Autowired
	MyPageService mpService;
	
	@Autowired
	HttpSession session;
	
    @GetMapping("/main.do")
    public String home(Model model) {
    	String userid = (String) session.getAttribute("userid");
    	
    	if (userid == null) {
			return "main";
		}else {
			UserDTO user = mpService.selectUserById(userid);
			List<NotificationDTO> nlist = mpService.selectFiveNotifications(userid);

			model.addAttribute("user", user);
			model.addAttribute("nlist", nlist);
			
	        return "main";
		}
    }
}
