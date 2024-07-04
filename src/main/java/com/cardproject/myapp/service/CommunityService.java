package com.cardproject.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cardproject.myapp.dao.CommunityDAO;
import com.cardproject.myapp.dto.BoardListDTO;
import com.cardproject.myapp.dto.CommunityDTO;
import com.cardproject.myapp.dto.ReplieDTO;
import com.cardproject.myapp.dto.UserDTO;

@Service
public class CommunityService {

	@Autowired
	CommunityDAO communityDao;

	// 게시글 리스트 조회 (조건검색 + 페이징)
	public List<BoardListDTO> selectBoardList(int page, int pageSize, String sort, String keyword, String tag, Integer cat) {
		return communityDao.selectBoardList(page, pageSize, sort, keyword, tag, cat);
	}

	// 총 게시글 수 조회
	public int getTotalBoardCount() {
		return communityDao.getTotalBoardCount();
	}

	// 검색 게시글 수 조회
	public int getTotalBoardCount(String keyword) {
		return communityDao.getTotalBoardCount(keyword);
	}

	// 태그 게시글 수 조회
	public int getTotalBoardCount(String keyword, String tag) {
		return communityDao.getTotalBoardCount(keyword, tag);
	}

	// 카테고리 게시글 수 조회
	public int getTotalBoardCount(Integer cat) {
		return communityDao.getTotalBoardCount(cat);
	}

	// 검색 + 태그 + 카테고리 게시글 수 조회
	public int getTotalBoardCount(String keyword, String tag, Integer cat) {
		return communityDao.getTotalBoardCount(keyword, tag, cat);
	}

	// 게시글 상세 조회
	public BoardListDTO selectBoardByCommId(Integer commId) {
		return communityDao.selectBoardByCommId(commId);
	}

	// 게시글 등록 페이지 로드
	public int updateViews(Integer commId) {
		return communityDao.updateViews(commId);
	}

	// 게시글 등록
	public int insertBoard(CommunityDTO board) {
		return communityDao.insertBoard(board);
	}

	// 게시글 수정
	public int modifyBoard(CommunityDTO board) {
		return communityDao.modifyBoard(board);
	}

	// 게시글 삭제
	public int deleteBoard(Integer commId) {
		return communityDao.deleteBoard(commId);
	}

	// 게시글 삭제 위한 댓글 삭제
	public int deleteRepliesByCommId(Integer commId) {
		return communityDao.deleteRepliesByCommId(commId);
	}

	// 추천
	public int incrementRecommend(Integer commId) {
		return communityDao.incrementRecommend(commId);
	}

	// 추천 수 조회
	public int getRecommendCount(Integer commId) {
		return communityDao.getRecommendCount(commId);
	}

	// 댓글 조회
	public List<ReplieDTO> selectReplieList(Integer commId) {
		return communityDao.selectReplieList(commId);
	}

	// 댓글 수 조회
	public int getReplieCount(Integer commId) {
		return communityDao.getReplieCount(commId);
	}

	// 댓글 작성
	public int insertComment(ReplieDTO replie) {
		return communityDao.insertComment(replie);
	}


	// 세션으로 닉네임 조회
	public String selectNicknameById(String userid) {
		return communityDao.selectNicknameById(userid);
	}

	// UserDTO에 담아 가져와야할 때
	public UserDTO selectNicknameByUserDTOId(String userid) {
		return communityDao.selectNicknameByUserDTOId(userid);
	}
	
	// 매니저 여부
	public int checkManagerByIdInCommunity(String userid) {
		return communityDao.checkManagerByIdInCommunity(userid);
	}
	
	// 공지글
	public List<BoardListDTO> selectTopNotices() {
        return communityDao.selectTopNotices();
    }
	
	// 공지글 (카테고리별)
	public List<BoardListDTO> selectTopNotices(Integer cat) {
        return communityDao.selectTopNotices(cat);
    }
	
	// 글쓴이 여부
	public String getWriterByCommId(int commId) {
		return communityDao.getWriterByCommId(commId);
	}

}
