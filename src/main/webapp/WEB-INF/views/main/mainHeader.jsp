<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
<div class="top">
  <nav class="top-nav">
    <a href="main.html" class="top-title">
      <img src="${path}/resources/images/default/logo.png" alt="logo" class="logo">
    </a>
    <div class="top-nav-category">
      <ul class="category-box">
        <li class="category-item">
          <a href="/auth/login.do">
            <img src="${path}/resources/icon/logout.png" class="icon">
            로그인</a>
        </li>
        <li class="category-item">
          <a href="#">
            <img src="${path}/resources/icon/logout.png" class="icon">회원가입</a>
        </li>
      </ul>
    </div>
  </nav>
</div>
<style>
  .top{
    border-bottom:1px solid #E1E6EC ;
  }
</style>