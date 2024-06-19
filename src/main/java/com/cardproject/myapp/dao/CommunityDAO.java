package com.cardproject.myapp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cardproject.myapp.dto.CommunityDTO;

@Repository
public class CommunityDAO{

	@Autowired
	SqlSession sqlSession;

	String namespace = "com.cardproject.myapp.dao.";
	
	// 전체 일반조회 ( 페이징 처리 할 때 분할 예정 .. 1이면 1-10 / 2이면 2-10 / 총개수/10 해서만큼 페이지 버튼 생성 )
	public List<CommunityDTO> selectAll(){
		List<CommunityDTO> blist = sqlSession.selectList(namespace + "selectAll");
		return blist;
	}
	
	// test
	public void test() {
		CommunityDTO var = sqlSession.selectOne(namespace + "selectTest");
		System.out.println(var);
	}

	

}
