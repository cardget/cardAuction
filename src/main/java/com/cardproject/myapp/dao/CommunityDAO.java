package com.cardproject.myapp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cardproject.myapp.dto.BoardListDTO;
import com.cardproject.myapp.dto.CommunityDTO;
import com.cardproject.myapp.dto.ReplieDTO;

@Repository
public class CommunityDAO {

	@Autowired
	SqlSession sqlSession;

	String namespace = "com.cardproject.myapp.dao.";

	// 게시글 리스트 조회 (조건검색 + 페이징)
	public List<BoardListDTO> selectBoardList(int page, int pageSize, String sort, String keyword, String tag) {
        int offset = (page - 1) * pageSize;
        Map<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("pageSize", pageSize);
        params.put("sort", sort);
        params.put("keyword", keyword != null ? "%" + keyword + "%" : null);
        params.put("tag", tag != null && !tag.equals("all") ? tag : null);
        return sqlSession.selectList(namespace + "selectBoardList", params);
    }

	// 전체 게시글 수 조회
	public int getTotalBoardCount() {
		return sqlSession.selectOne(namespace + "getTotalBoardCount");
	}
	
	// 검색 게시글 수 조회
	public int getTotalBoardCount(String keyword) {
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword != null ? "%" + keyword + "%" : null);
        return sqlSession.selectOne(namespace + "getTotalBoardCountByKeyword", params);
    }
	
	// 태그 게시글 수 조회
	public int getTotalBoardCount(String keyword, String tag) {
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword != null ? "%" + keyword + "%" : null);
        params.put("tag", tag != null && !tag.equals("all") ? tag : null);
        return sqlSession.selectOne(namespace + "getTotalBoardCountByKeywordAndTag", params);
    }

	// 게시글 상세 조회
	public BoardListDTO selectBoardByCommId(Integer commId) {
		BoardListDTO board = sqlSession.selectOne(namespace + "selectByCommId", commId);
		return board;
	}

	// 게시글 등록 페이지 로드
	public int updateViews(Integer commId) {
		return sqlSession.update(namespace + "updateViews", commId);
	}

	// 게시글 등록
	public int insertBoard(CommunityDTO board) {
		return sqlSession.insert(namespace + "insertBoard", board);
	}

	// 게시글 수정
	public int modifyBoard(CommunityDTO board) {
		return sqlSession.update(namespace + "updateBoard", board);
	}

	// 게시글 삭제
	public int deleteBoard(Integer commId) {
		return sqlSession.delete(namespace + "deleteBoard", commId);
	}
	
	// 게시글 삭제 위한 댓글 삭제
	public int deleteRepliesByCommId(Integer commId) {
		return sqlSession.delete(namespace + "deleteRepliesByCommId", commId);
	}

	// 추천
	public int incrementRecommend(Integer commId) {
		return sqlSession.update(namespace + "incrementRecommend", commId);
	}

	// 추천 수 조회
	public int getRecommendCount(Integer commId) {
		return sqlSession.selectOne(namespace + "getRecommendCount", commId);
	}

	// 댓글 조회
	public List<ReplieDTO> selectReplieList(Integer commId) {
		List<ReplieDTO> rlist = sqlSession.selectList(namespace + "selectReplie", commId);
		return rlist;
	}

	// 댓글 수 조회
	public int getReplieCount(Integer commId) {
		return sqlSession.selectOne(namespace + "selectReplieNum", commId);
	}

	// 댓글 작성
	public int insertComment(ReplieDTO replie) {
		return sqlSession.insert(namespace + "insertComment", replie);
	}
	
	// 세션으로 닉네임 조회
	public String selectNicknameById(String userid) {
		return sqlSession.selectOne(namespace + "selectNicknameById", userid);
	}
}
