package com.cardproject.myapp.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

import io.github.cdimascio.dotenv.Dotenv;

@Service
public class SmsService {
    private static final Logger logger = LoggerFactory.getLogger(SmsService.class);
    private final Map<String, String> verificationCodes = new HashMap<>();

    @Value("${twilio.account.sid}")
    private String accountSid;

    @Value("${twilio.auth.token}")
    private String authToken;

    @Value("${twilio.phone.number}")
    private String fromPhoneNumber;

    public void sendSms(String to) {
        logger.info("Sending SMS to: {}", to);
        String verificationCode = generateVerificationCode();
        verificationCodes.put(to, verificationCode);
        logger.info("Stored verification code for {}: {}", to, verificationCode);
        try {
            Message message = Message.creator(
                    new PhoneNumber(to),
                    new PhoneNumber(fromPhoneNumber),
                    "인증번호 [" + verificationCode + "]"
            ).create();
            logger.info("Message SID: {}", message.getSid());
        } catch (Exception e) {
            logger.error("Failed to send SMS: {}", e.getMessage());
        }
    }

    public boolean verifyCode(String phoneNumber, String code) {
        String validCode = verificationCodes.get(phoneNumber);
        logger.info("Stored code for {}: {}", phoneNumber, validCode);
        logger.info("Provided code: {}", code);
        return code != null && code.equals(validCode);
    }

    private String generateVerificationCode() {
        Random random = new Random();
        int code = 100000 + random.nextInt(900000);
        return String.valueOf(code);
    }
}
