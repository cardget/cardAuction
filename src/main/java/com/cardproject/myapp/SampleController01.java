package com.cardproject.myapp;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SampleController01 {
	private static final Logger log = LoggerFactory.getLogger(SampleController01.class);
	
	//http://localhost:9090/myapp/doTest
	@RequestMapping("/doTest")
	public void doTest() {
		System.out.println("@@@ doTest로 이동!");
		log.info("@@@로그출력@@@");
		
	}
}
