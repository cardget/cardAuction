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
}
