package com.cardproject.myapp.controller;

import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cardproject.myapp.service.SmsService;

@RestController
@RequestMapping("/api")
public class SmsController {
	@Autowired
    private final SmsService smsService;
	
	@Autowired
    public SmsController(SmsService smsService) {
        this.smsService = smsService;
    }

	@PostMapping("/send-code")
    public ResponseEntity<String> sendCode(@RequestParam String phoneNumber) {
        try {
            // URL 인코딩된 전화번호를 디코딩
            String decodedPhoneNumber = URLDecoder.decode(phoneNumber, StandardCharsets.UTF_8.name());
            // 전화번호 형식 검사 및 수정
            decodedPhoneNumber = formatPhoneNumber(decodedPhoneNumber);

            smsService.sendSms(decodedPhoneNumber);
            return ResponseEntity.ok("Code sent successfully");
        } catch (Exception e) {
            return ResponseEntity.status(400).body("Failed to send code: " + e.getMessage());
        }
    }

	@PostMapping("/verify-code")
    public ResponseEntity<Boolean> verifyCode(@RequestParam String phoneNumber, @RequestParam String code) {
        try {
            // URL 인코딩된 전화번호를 디코딩
            String decodedPhoneNumber = URLDecoder.decode(phoneNumber, StandardCharsets.UTF_8.name());
            String formattedPhoneNumber = formatPhoneNumber(decodedPhoneNumber);
            boolean isValid = smsService.verifyCode(formattedPhoneNumber, code);
            return ResponseEntity.ok(isValid);
        } catch (Exception e) {
            return ResponseEntity.status(400).body(false);
        }
    }
	
	
	private String formatPhoneNumber(String phoneNumber) {
        // 전화번호 형식을 통일하는 로직을 추가합니다.
        if (!phoneNumber.startsWith("+")) {
            if (phoneNumber.startsWith("0")) {
                // 지역번호로 시작하는 경우 +82 추가 후 첫 번째 0 제거
                phoneNumber = "+82" + phoneNumber.substring(1);
            } else {
                // + 없이 번호가 온 경우 + 추가
                phoneNumber = "+" + phoneNumber;
            }
        }
        return phoneNumber;
    }
}
