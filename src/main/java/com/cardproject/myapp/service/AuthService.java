package com.cardproject.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.cardproject.myapp.dao.AuthDAO;
import com.cardproject.myapp.dto.UserDTO;

@Service
public class AuthService {

  @Autowired
  private AuthDAO authDAO;
  
  @Autowired
  private PasswordEncoder passwordEncoder;
  
//  public UserDTO loginChk(String userid, String password) {
//    return authDAO.loginChk(userid, password);
//  }
  
  public int insertSignUp(UserDTO user) {
	  // 비밀번호 암호화
      String encodedPassword = passwordEncoder.encode(user.getPw());
      user.setPw(encodedPassword);
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
	  // 비밀번호 암호화
      String encodedPassword = passwordEncoder.encode(password);
	  return authDAO.updatePassword(userId, encodedPassword);
  }
  public UserDTO login(String userId, String rawPassword) {
      UserDTO user = authDAO.findByUserId(userId);
      if (user != null && passwordEncoder.matches(rawPassword, user.getPw())) {
          return user; // 로그인 성공
      } else {
          return null; // 로그인 실패
      }
  }
}
