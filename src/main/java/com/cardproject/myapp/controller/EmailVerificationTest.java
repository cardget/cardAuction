//package com.cardproject.myapp.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.cardproject.myapp.service.MailSendService;
//
//@Controller
//public class EmailVerificationTest {
//
//    @Autowired
//    private MailSendService mailSendService;
//
//    @RequestMapping(value = "/sendAuthMail", method = RequestMethod.POST)
//    @ResponseBody
//    public String sendAuthMail(@RequestParam("email") String email) {
//        try {
//            String authKey = mailSendService.sendAuthMail(email);
//            return "인증메일이 발송되었습니다. 인증키: " + authKey;
//        } catch (Exception e) {
//            return "인증메일 발송에 실패했습니다: " + e.getMessage();
//        }
//    }
//}
