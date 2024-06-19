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
}
