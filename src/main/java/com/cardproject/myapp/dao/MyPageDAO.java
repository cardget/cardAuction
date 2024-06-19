package com.cardproject.myapp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.dto.PointDTO;
import com.cardproject.myapp.dto.UserDTO;

@Repository
public class MyPageDAO{

	@Autowired
	SqlSession sqlSession;

	String namespace = "com.cardproject.myapp.dao";

	// 내 정보
	public UserDTO selectUserById(String userid) {
        return sqlSession.selectOne(namespace + ".selectUserById", userid);
    }

	// 내 정보 수정
	public void userUpdate(UserDTO user){
		sqlSession.update(namespace + ".userUpdate", user);
	}
	
	// 프로필 이미지 수정
	public void userProfileUpdate(String userid, String imgpath) {
		Map<String, Object> params = new HashMap<>();
		params.put("userid", userid);
		params.put("imgpath", imgpath);
		sqlSession.update(namespace + ".userProfileUpdate", params);
	}

	// 입찰내역
	public List<ItemDTO> selectAllBids(String userid) {
		return sqlSession.selectList(namespace + ".selectAllBids", userid);
	}
	
	// 판매내역
	public List<ItemDTO> selectAllSales(String userid) {
		return sqlSession.selectList(namespace + ".selectAllSales", userid);
	}
	
	// 포인트
	public List<PointDTO> selectPointByUser(String userid) {
		return sqlSession.selectList(namespace + ".selectPointByUser", userid);
	}
	
	// 관심목록
	public List<ItemDTO> selectAllLikes(String userid) {
		return sqlSession.selectList(namespace + ".selectAllLikes", userid);
	}
}
