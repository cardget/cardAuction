package com.cardproject.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cardproject.myapp.dao.AuthDAO;
import com.cardproject.myapp.dto.UserDTO;

@Service
public class AuthService {

  @Autowired
  private AuthDAO authDAO;
  
  public UserDTO loginChk(String userid, String password) {
    return authDAO.loginChk(userid, password);
  }
  
  public int insertSignUp(UserDTO user) {
	  return authDAO.insertSignUp(user);
  }
  public int isUserIdDuplicate(String userId) {
	  return authDAO.isUserIdDuplicate(userId);
  }
  public int isNicknameDuplicate(String nickname) {
	  return authDAO.isNicknameDuplicate(nickname);
  }
  public String findUserId(String userName, String phoneNumber) {
	  return authDAO.findUserId(userName, phoneNumber);
  }
  public String findPassword(String userId) {
	  return authDAO.findPassword(userId);
  }
  public int updatePassword(String userId, String password) {
	  return authDAO.updatePassword(userId, password);
  }
}
