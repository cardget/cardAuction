<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="../static/css/myPageStyle.css">
</head>
<body>
	<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
	<div class="container">
        <div class="sidebar">
			<div class="logo">
				<img src="../static/images/logo.png" alt="로고이미지" height=41>
				<h1>회원정보</h1>
			</div>
		    <div class="profile">
		    	<div class="imageinfo">
		    		<img src="../static/images/defaultprofile.png" alt="프로필이미지" height=150>
					<a href="#">
						<img src="../static/images/editprofile.png" alt="프로필편집" height=50 class="editprofile">
					</a>
		    	</div>
				<div class="textinfo">
					<h2>유저스트액티베이티드</h2>
					<p class="grayfont">mytrapcard</p>
				</div>
			</div>
		    <div class="sidemenu">
				<ul>
					<li>
						<a href="myInfo.jsp">내정보</a>
					</li>
					<li>
						<a href="myBid.jsp">입찰내역</a>
					</li>
					<li>
						<a href="mySale.jsp">판매내역</a>
					</li>
					<li>
						<a href="myPoint.jsp">포인트</a>
					</li>
					<li>
						<a href="myInterest.jsp">관심목록</a>
					</li>
					<li class="selected">
						<a href="myDelivery.jsp">배송조회</a>
					</li>
				</ul>
			</div>
			<div class="bottom-div">
				<hr class="grayfont">
				<div>
					<a href="#" class="grayfont">로그아웃</a>
		    		<span class="grayfont"> | </span>
					<a href="#" class="grayfont">회원탈퇴</a>
				</div>
    		</div>
		</div>
        <div class="main">
            <div class="main-header">
            	<div class="dropdown">
            		<a href="#" class="dropdown-toggle">
						<img src="../static/images/uncheckedchat.png" alt="채팅" height=30>
					</a>
            		<div class="dropdown-content">
			            <a href="#">채팅 1</a>
			            <a href="#">채팅 2</a>
			            <a href="#">채팅 3</a>
			        </div>
			    </div>
			    <div class="dropdown">
            		<a href="#" class="dropdown-toggle">
						<img src="../static/images/uncheckednote.png" alt="알림" height=30>
					</a>
					<div class="dropdown-content">
			            <a href="#">알림 1</a>
			            <a href="#">알림 2</a>
			            <a href="#">알림 3</a>
			        </div>
            	</div>
			</div>
            <div class="content">
            	<div class="header">
			        <h2>배송조회</h2>
			    </div>
			    <div class="delivery-section">
			    	<h3>배송현황</h3>
			    	<img src="" alt="배송진행상황">
			    	<div class="status-table">
				    	<table>
				    		<thead>
				    			<tr>
				    				<th>날짜</th>
				    				<th>시간</th>
				    				<th>상품정보</th>
				    				<th>배송 진행상황</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    			<tr>
				    				<td>2024-05-29</td>
				    				<td>14:24</td>
				    				<td>[포켓몬] 피카츄 일러스트레이터 카드 PSA 8 한정판</td>
				    				<td>상품이 접수되었습니다.</td>
				    			</tr>
				    			<tr>
				    				<td>2024-05-29</td>
				    				<td>15:24</td>
				    				<td>[포켓몬] 피카츄 일러스트레이터 카드 PSA 8 한정판</td>
				    				<td>상품이 배송중입니다.</td>
				    			</tr>
				    			<tr>
				    				<td>2024-05-29</td>
				    				<td>16:24</td>
				    				<td>[포켓몬] 피카츄 일러스트레이터 카드 PSA 8 한정판</td>
				    				<td>상품이 완료되었습니다.</td>
				    			</tr>
				    		</tbody>
				    	</table>
			    	</div>
			    </div>
				<div class="item-section">
					<div class="image-section">
					    <img src="../static/images/pikachucard.png" alt="Product Image">
					</div>
					<div class="info-section">
					    <h3>[포켓몬] 1998 피카츄 일러스트레이터 카드 PSA 8 한정판</h3>
					    <p class="grayfont">2024-05-29 거래완료</p>
					    <a href="#" class="grayfont">상세보기 ></a>
					</div>
					<div class="status-section">
					    <button class="status-button-proceeding">배송중</button>
					</div>
				</div>
				<div class="item-section">
					<div class="image-section">
					    <img src="../static/images/pikachucard.png" alt="Product Image">
					</div>
					<div class="info-section">
					    <h3>[포켓몬] 1998 피카츄 일러스트레이터 카드 PSA 8 한정판</h3>
					    <p class="grayfont">2024-05-28 거래완료</p>
					    <a href="#" class="grayfont">상세보기 ></a>
					</div>
					<div class="status-section">
					    <button class="status-button-delivered">배송완료</button>
					</div>
				</div>
            </div>
		</div>
	</div>
</body>
</html>
