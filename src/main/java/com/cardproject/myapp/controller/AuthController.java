package com.cardproject.myapp.controller;

import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cardproject.myapp.dto.UserDTO;
import com.cardproject.myapp.service.AWSS3Service;
import com.cardproject.myapp.service.AuthService;

@Controller
@RequestMapping("/auth")
public class AuthController {

	@Autowired
	AuthService aService;
	@Autowired
	private AWSS3Service s3Service;

	@GetMapping("/signUp")
	public void signUp() {
		System.out.println("signUp page");
	}	
	
	@PostMapping("/insertSignUp")
    public String profileUpload(@RequestParam(value= "profile_image_name", required=false) MultipartFile file, Model model, UserDTO user ) {
		
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
				return "redirect:signUp";
			}    		
    	}else {
    		user.setProfile_image(null);
    	}   	    
    	
    	aService.insertSignUp(user);
    	return "redirect:login";
    }
	
	
	@GetMapping("/login")
	public void login() {
		System.out.println("login page");
	}

	@PostMapping("/login")
	public String loginCheck(@RequestParam("userid") String userid,
							 @RequestParam("password") String password,
							 HttpSession session) {

		UserDTO user = aService.login(userid, password);		
		
		if (user == null) {
			session.setAttribute("loginResult", "로그인 실패 : 유효하지 않은 아이디 또는 패스워드");
			return "redirect:login";
		}else if(user.getIs_able()==0) {
			session.setAttribute("loginResult", "로그인 실패 : 해당 아이디로 된 정보를 찾을 수 없습니다.");
			return "redirect:login";
		}		
		else {
			// login success
			session.setAttribute("loginResult", "Login Success");
			session.setAttribute("userid", user.getUser_id());
			session.setAttribute("nickname", user.getNickname());
			session.setAttribute("isAdmin", user.getIs_admin());
			return "redirect:../main";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}	

	@GetMapping("/findId")
	public void findId() {
		System.out.println("findId Page");
	}	
	
	@GetMapping("/findIdResult")
	public void findIdResult() {
		System.out.println("findIdResult page");
	}
	
	@PostMapping("/findIdResult")
    public String findIdResult(@RequestParam("userName") String userName,
                               @RequestParam("phone_number") String phoneNumber,
                               Model model) {
        String userId = aService.findUserId(userName, phoneNumber);
        if (userId != null && !userId.isEmpty()) {
        	model.addAttribute("userId", userId);
            model.addAttribute("userFound", true);
        } else {
        	userId = "해당 정보와 일치하는 아이디가 없습니다.";
            model.addAttribute("userFound", false);
        }
        
        return "auth/findIdResult";
    }

//	@GetMapping("/findPassword")
//	public void findPassword() {
//		System.out.println("findPassword page");
//	}

	@GetMapping("/resetPassword")
	public String resetPassword(@RequestParam(value = "userId", required = false) String userId, Model model) {		
		model.addAttribute("userId",userId);
		System.out.println("resetPassword page");
		return "auth/resetPassword";
	}
	
	@PostMapping("/updatePassword")
    public String updatePassword(@RequestParam("userId") String userId, @RequestParam("password") String password,
    		Model model, RedirectAttributes redirectAttributes) {        
		aService.updatePassword(userId, password);        
        redirectAttributes.addFlashAttribute("message", "회원정보가 성공적으로 수정되었습니다.");
        return "redirect:login";
    }
	
	@GetMapping("/smsAPI")
	public String verificationSMS_API(){
		return "auth/Twilio_Verification";
	}
	
	@GetMapping("/checkUserId")
	@ResponseBody
    public String checkUserId(@RequestParam String userId) {		
        int isDuplicate = aService.isUserIdDuplicate(userId);        
        return isDuplicate+"";
    }	

    @GetMapping("/checkNickname")
    @ResponseBody
    public String checkNickname(@RequestParam String nickname) {    
        int isDuplicate = aService.isNicknameDuplicate(nickname);
        return isDuplicate+"";
    }
    
    
   
}
