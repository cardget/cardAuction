<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>InquirySelect</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/BoardSelect.css" type="text/css" rel="stylesheet">
<link rel="icon" href="${path}/resources/icon/favicon.ico" type="image/x-icon">
</head>
<body>
    <c:set var="path" value="${pageContext.servletContext.contextPath}" />
    <!--header-->
    <c:choose>
        <c:when test="${empty userid}">
            <%@ include file="/WEB-INF/views/main/defaultHeader.jsp" %>
        </c:when>
        <c:otherwise>
            <%@ include file="/WEB-INF/views/main/loginHeader.jsp" %>
        </c:otherwise>
    </c:choose>
    <div class="defaultBanner"></div>

    <div class="container2">
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">
                ${errorMessage}
            </div>
        </c:if>
        <c:if test="${empty errorMessage}">
            <br>
            <div class="breadcrumbs">
                <a href="${path}/main.do">홈</a> &gt; <span>문의</span>
            </div>
            <div class="form-inline">
                <input type="submit" class="btn-primary" value="문의하기" onClick="location.href='${path}/inquiry/InquiryInsert.do'">
            </div>
            <table class="table">
                <thead>
                    <tr>
                        <th></th>
                        <th>비밀글 여부</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>답변</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="question" items="${ilist}">
                        <tr onClick="location.href='${path}/inquiry/InquiryDetail.do?questId=${question.quest_id}'">
                            <td>${question.sort_num}</td>
                            <td><c:if test="${question.is_secret == 1}">
                                    <img src="${path}/resources/icon/logout.png" alt="" style="width: 20px; height: 20px;">
                                </c:if></td>
                            <td class="titleText">${question.title}</td>
                            <td>${question.nickname}</td>
                            <td>${question.answer_exist}</td>
                            <td>${question.create_date}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="pagination">
                <c:forEach var="i" begin="1" end="${(totalCount / pageSize) + (totalCount % pageSize > 0 ? 1 : 0)}">
                    <a href="${path}/inquiry/InquirySelect.do?page=${i}&pageSize=${pageSize}" class="${i == currentPage ? 'active' : ''}">${i}</a>
                </c:forEach>
            </div>
        </c:if>
    </div>
    <!--footer-->
    <%@ include file="/WEB-INF/views/main/footer.jsp" %>
</body>
</html>
