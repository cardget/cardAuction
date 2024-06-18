package com.cardproject.myapp.model.community;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cardproject.myapp.dto.CommunityDTO;

@Repository
public class CommunityDAO implements CommunityDAOInterface {

	@Autowired
	SqlSession sqlSession;

	String namespace = "com.cardproject.myapp.model.community.";

	// test
	public void test() {
		CommunityDTO var = sqlSession.selectOne(namespace + "selectTest");
		System.out.println(var);
	}


}
