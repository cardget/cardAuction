package com.cardproject.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cardproject.myapp.dao.CommunityDAO;
import com.cardproject.myapp.dto.BoardListDTO;

@Service
public class CommunityService {

	@Autowired
	CommunityDAO communityDao;

	// 게시글 리스트 조회
	public List<BoardListDTO> selectBoardList() {
		return communityDao.selectBoardList();
	}
	
	// 게시글 상세 조회
	public BoardListDTO selectBoardByCommId(Integer commId) {
		return communityDao.selectBoardByCommId(commId);
	}

}
