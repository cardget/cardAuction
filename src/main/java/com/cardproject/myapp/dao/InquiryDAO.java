package com.cardproject.myapp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cardproject.myapp.dto.QuestionDTO;

@Repository
public class InquiryDAO {

	@Autowired
	SqlSession sqlSession;

	String namespace = "com.cardproject.myapp.dao.";

	// 문의 리스트 조회
	public List<QuestionDTO> selectInquiryList() {
		return sqlSession.selectList(namespace + "selectInquiryList");
	}
}
