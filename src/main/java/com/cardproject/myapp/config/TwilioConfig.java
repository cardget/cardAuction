package com.cardproject.myapp.config;

import java.beans.JavaBean;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TwilioConfig {
	
	@Value("${twilio.account.sid}")
    private String accountSid;

    @Value("${twilio.auth.token}")
    private String authToken;

    @Value("${twilio.phone.number}")
    private String fromPhoneNumber;

    @Bean
    public String getAccountSid() {
        return accountSid;
    }

    @Bean
    public String getAuthToken() {
        return authToken;
    }

    @Bean
    public String getFromPhoneNumber() {
        return fromPhoneNumber;
    }
}
