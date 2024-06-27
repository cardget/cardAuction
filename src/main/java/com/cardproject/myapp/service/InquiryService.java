package com.cardproject.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cardproject.myapp.dao.InquiryDAO;
import com.cardproject.myapp.dto.QuestionDTO;

@Service
public class InquiryService {
	@Autowired
	InquiryDAO inquiryDao;
	
	public List<QuestionDTO> selectInquiryList() {
		return inquiryDao.selectInquiryList();
	}
}
