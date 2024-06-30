package com.cardproject.myapp.service;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class SchedulerService {
	
	
	@Scheduled(cron="*/5 * * * * *")
	public void scheduleRun() {
		System.out.println("...");
	}
}
