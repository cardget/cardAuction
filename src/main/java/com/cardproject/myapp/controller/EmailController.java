package com.cardproject.myapp.controller;

import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cardproject.myapp.service.MailSendService;

@RestController
@RequestMapping("/email")
public class EmailController {

    @Autowired
    private MailSendService mailSendService;

    @PostMapping("/send")
    @ResponseBody
    public ResponseEntity<String> sendVerificationEmail(@RequestParam("email") String email, HttpSession session) {
        int generatedCode = Integer.parseInt(mailSendService.joinEmail(email));
        session.setAttribute("generatedCode", generatedCode);
        
        System.out.println("세션에 저장된 인증 코드: " + session.getAttribute("generatedCode"));
        
        String message = "인증번호가 발송되었습니다.";
        return ResponseEntity.ok()
                .contentType(new MediaType("text", "plain", StandardCharsets.UTF_8))
                .body(message);
    }

    @PostMapping("/verify")
    @ResponseBody
    public ResponseEntity<String> verifyCode(@RequestParam("code") String code, HttpSession session) {
        String message;
        Integer generatedCode = (Integer) session.getAttribute("generatedCode");
        if (generatedCode != null && generatedCode.toString().equals(code)) {
            message = "인증 성공";
            session.removeAttribute("generatedCode");  // 인증이 성공하면 세션에서 제거
        } else {
            message = "인증 실패";
        }
        return ResponseEntity.ok()
                .contentType(new MediaType("text", "plain", StandardCharsets.UTF_8))
                .body(message);
    }
}
