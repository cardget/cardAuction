package com.cardproject.myapp.model.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommunityService {
	
	@Autowired
	CommunityDAOInterface myBatisTest;
	
	public void test() {
		myBatisTest.test();
	}
	
}
