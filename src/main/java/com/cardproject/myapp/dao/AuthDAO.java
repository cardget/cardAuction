package com.cardproject.myapp.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cardproject.myapp.dto.UserDTO;

@Repository
public class AuthDAO {
  
  @Autowired
  SqlSession sqlSession;

  String namespace = "com.cardproject.myapp.dao";
  
  public UserDTO loginChk(String userid, String password) {
    Map<String, String> params = new HashMap<>();
    params.put("userid", userid);
    params.put("password", password);
    UserDTO user = sqlSession.selectOne(namespace + ".loginChk", params);
    return user;
  }
  //회원가입 insert
  public int insertSignUp(UserDTO user) {
	  int result = sqlSession.insert(namespace +".insertSignUp",user);
	  return result;
  }
  //아이디 중복 확인
  public int isUserIdDuplicate(String userId) {
      int count = sqlSession.selectOne(namespace + ".checkUserId", userId);
      System.out.println("dao: " + count);
      return count;
  }
  // 닉네임 중복 확인
  public int isNicknameDuplicate(String nickname) {
      int count = sqlSession.selectOne(namespace + ".checkNickname", nickname);
      return count;
  }
}
