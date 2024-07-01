package com.cardproject.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cardproject.myapp.dao.InquiryDAO;
import com.cardproject.myapp.dto.QuestionDTO;
import com.cardproject.myapp.dto.UserDTO;

@Service
public class InquiryService {
	@Autowired
	InquiryDAO inquiryDao;

	// 문의 리스트 조회
	public List<QuestionDTO> selectInquiryList(int page, int pageSize) {
		return inquiryDao.selectInquiryList(page, pageSize);
	}

	// 전체 문의 글 수 조회
	public int getTotalInquiryCount() {
		return inquiryDao.getTotalInquiryCount();
	}
	
	// 문의 상세 조회
	public QuestionDTO selectByInquiryId(Integer inquiryId) {
		return inquiryDao.selectByInquiryId(inquiryId);
	}

	// 문의 글 작성
	public int insertInquiry(QuestionDTO question) {
		return inquiryDao.insertInquiry(question);
	}

	// UserDTO에 담아 가져와야할 때
	public UserDTO selectNicknameByUserVOId(String userid) {
		return inquiryDao.selectNicknameByUserVOId(userid);
	}
	
	// 비밀 글 본인 확인
	public String secretBoardCheckById(Integer questId) {
		return inquiryDao.secretBoardCheckById(questId);
	}
}
