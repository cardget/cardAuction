package com.cardproject.myapp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cardproject.myapp.dto.BoardListDTO;

@Repository
public class CommunityDAO{

	@Autowired
	SqlSession sqlSession;

	String namespace = "com.cardproject.myapp.dao.";
	
	// 게시글 리스트 조회
	public List<BoardListDTO> selectBoardList(){
		List<BoardListDTO> blist = sqlSession.selectList(namespace + "selectBoardList");
		return blist;
	}
	
	// 게시글 상세 조회
	public BoardListDTO selectBoardByCommId(Integer commId) {
		BoardListDTO board = sqlSession.selectOne(namespace + "selectByCommId", commId);
		return board;
	}

}
