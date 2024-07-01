package com.cardproject.myapp.controller;

import java.nio.charset.StandardCharsets;

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

    private int generatedCode;

    @PostMapping("/send")
    @ResponseBody
    public ResponseEntity<String> sendVerificationEmail(@RequestParam("email") String email) {
        generatedCode = Integer.parseInt(mailSendService.joinEmail(email));
        String message = "인증번호 전송을 완료하였습니다. " + email;
        return ResponseEntity.ok()
                .contentType(new MediaType("text", "plain", StandardCharsets.UTF_8))
                .body(message);
    }

    @PostMapping("/verify")
    @ResponseBody
    public ResponseEntity<String> verifyCode(@RequestParam("code") String code) {
        String message;
        if (Integer.toString(generatedCode).equals(code)) {
            message = "인증에 성공하였습니다!";
        } else {
            message = "유효하지 않은 인증번호입니다.";
        }
        return ResponseEntity.ok()
                .contentType(new MediaType("text", "plain", StandardCharsets.UTF_8))
                .body(message);
    }
}
