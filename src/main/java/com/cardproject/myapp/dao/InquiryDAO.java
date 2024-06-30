package com.cardproject.myapp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cardproject.myapp.dto.QuestionDTO;
import com.cardproject.myapp.dto.UserDTO;

@Repository
public class InquiryDAO {

	@Autowired
	SqlSession sqlSession;

	String namespace = "com.cardproject.myapp.dao.";

	// 문의 리스트 조회
	public List<QuestionDTO> selectInquiryList(int page, int pageSize) {
	    int offset = (page - 1) * pageSize;
	    Map<String, Object> params = new HashMap<>();
	    params.put("offset", offset);
	    params.put("pageSize", pageSize);
	    return sqlSession.selectList(namespace + "selectInquiryList", params);
	}

	// 전체 문의 글 수 조회 
	public int getTotalInquiryCount() {
		return sqlSession.selectOne(namespace + "getTotalInquiryCount");
	}
	
	// 문의 상세 조회
	public QuestionDTO selectByInquiryId(Integer inquiryId) {
		QuestionDTO inquiry = sqlSession.selectOne(namespace + "selectByQuestionId", inquiryId);
		return inquiry;
	}
	
	// 문의 글 작성
	public int insertInquiry(QuestionDTO question) {
		return sqlSession.insert(namespace + "insertInquiry", question);
	}

	// UserDTO에 담아 가져와야할 때
	public UserDTO selectNicknameByUserVOId(String userid) {
		return sqlSession.selectOne(namespace + "selectNicknameByUserVOId", userid);
	}
}
