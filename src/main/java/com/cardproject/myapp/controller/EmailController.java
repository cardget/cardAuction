package com.cardproject.myapp.controller;

import com.cardproject.myapp.service.MailSendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/email")
public class EmailController {

    @Autowired
    private MailSendService mailSendService;

    private int generatedCode;

    @PostMapping("/send")
    public String sendVerificationEmail(@RequestParam("email") String email) {
        generatedCode = Integer.parseInt(mailSendService.joinEmail(email));
        return "Verification code sent to " + email;
    }

    @PostMapping("/verify")
    public String verifyCode(@RequestParam("code") String code) {
        if (Integer.toString(generatedCode).equals(code)) {
            return "Email verification successful!";
        } else {
            return "Invalid verification code.";
        }
    }
}
