package com.cardproject.myapp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cardproject.myapp.dto.CommunityDTO;

@Repository
public class mypageDAO{

	@Autowired
	SqlSession sqlSession;

	String namespace = "com.cardproject.myapp.dao.";

	// test
	public void test() {
		CommunityDTO var = sqlSession.selectOne(namespace + "selectTest");
		System.out.println(var);
	}


}
