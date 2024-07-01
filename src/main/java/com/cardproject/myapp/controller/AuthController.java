package com.cardproject.myapp.controller;

import javax.servlet.http.HttpServletRequest;
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

import io.jsonwebtoken.io.IOException;

@Controller
@RequestMapping("/auth")
public class AuthController {

	@Autowired
	AuthService aService;
	@Autowired
	private AWSS3Service s3Service;

	@GetMapping("/signUp.do")
	public void signUp() {
		System.out.println("signUp page");
	}	
	
	@PostMapping("/insertSignUp.do")
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
				return "redirect:signUp.do";
			}    		
    	}else {
    		user.setProfile_image(null);
    	}   	    
    	
    	aService.insertSignUp(user);
    	return "redirect:login.do";
    }
	
	
	@GetMapping("/login.do")
	public void login() {
		System.out.println("login page");
	}

	@PostMapping("/login.do")
	public String loginCheck(@RequestParam("userid") String userid,
							 @RequestParam("password") String password,
							 HttpSession session) {

		UserDTO user = aService.login(userid, password);		
		
		if (user == null) {
			session.setAttribute("loginResult", "Login Failure: Invalid Email or Password");
			return "redirect:login.do";
		}else if(user.getIs_able()==0) {
			session.setAttribute("loginResult", "Login Failure: Your account is disabled.");
			return "redirect:login.do";
		}		
		else {
			// login success
			session.setAttribute("loginResult", "Login Success");
			session.setAttribute("userid", user.getUser_id());
			
			return "redirect:../main.do";
		}
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.do";
	}	

	@GetMapping("/findId.do")
	public void findId() {
		System.out.println("findId Page");
	}	
	
	@GetMapping("/findIdResult.do")
	public void findIdResult() {
		System.out.println("findIdResult page");
	}
	@PostMapping("/findIdResult.do")
    public String findIdResult(@RequestParam("userName") String userName, @RequestParam("phoneNumber") String phoneNumber, Model model) {
        System.out.println("POST 요청을 받았습니다."); // 디버깅 로그
        String userId = aService.findUserId(userName, phoneNumber);
        model.addAttribute("userId", userId);
        return "auth/findIdResult";
    }

//	@GetMapping("/findPassword.do")
//	public void findPassword() {
//		System.out.println("findPassword page");
//	}

	@GetMapping("/resetPassword.do")
	public String resetPassword(@RequestParam(value = "userId", required = false) String userId, Model model) {		
		model.addAttribute("userId",userId);
		System.out.println("resetPassword page");
		return "auth/resetPassword";
	}
	
	@PostMapping("/updatePassword.do")
    public String updatePassword(@RequestParam("userId") String userId, @RequestParam("password") String password,
    		Model model, RedirectAttributes redirectAttributes) {        
		aService.updatePassword(userId, password);        
        redirectAttributes.addFlashAttribute("message", "회원정보가 성공적으로 수정되었습니다.");
        return "redirect:login.do";
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
