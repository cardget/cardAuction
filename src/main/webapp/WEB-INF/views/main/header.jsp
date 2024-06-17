<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="path" value="${pageContext.servletContext.contextPath }" />
<div class="top">
  <nav class="top-nav">
    <a href="main.html" class="top-title">
      <img src="${path }/resources/images/default/logo.png" alt="logo" class="logo">
    </a>
    <div class="main-category">
      <ul class="main-category-box">
        <li class="main-category-item">
          <a href="#">포켓몬</a>
        </li>
        <li class="main-category-item">
          <a href="#">유희왕</a>
        </li>
        <li class="main-category-item">
          <a href="#">디지몬</a>
        </li>
        <li class="main-category-item">
          <a href="#">원피스</a>
        </li>
        <li class="main-category-item">
          <a href="#">스포츠</a>
        </li>
      </ul>
    </div>
    <div class="top-nav-category">
      <ul class="category-box">
        <li class="category-item">
          <a href="#">
            <img src="${path }/resources/icon/user.png" class="icon">김카드님</a>
        </li>
        <li class="category-item">
          <a href="#">
            <img src="${path }/resources/icon/logout.png" class="icon">로그아웃</a>
        </li>
        <li class="category-item">
          <a href="#">
            <img src="${path }/resources/icon/likelist.png" class="icon">관심품목</a>
        </li>
        <li class="category-item">
          <a href="#">
            <img src="${path }/resources/icon/isAlarm.png" class="alarmIcon">
          </a>
        </li>
      </ul>
    </div>
  </nav>
</div>