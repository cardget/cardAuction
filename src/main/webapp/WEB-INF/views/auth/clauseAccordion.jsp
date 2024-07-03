<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관 동의</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/js/signUp.js"></script>  
<link rel="stylesheet" href="${path}/resources/css/signUp.css"> 

</head>
<body>
  <div class="container my-5">
    <h2>약관 동의</h2>
    <form>
      <div class="form-check mb-3">
        <input class="form-check-input" type="checkbox" value="" id="checkAll" onclick="toggleCheckboxes(this)">
        <label class="form-check-label" for="checkAll">
          필수 약관 전체 동의
        </label>
      </div>
      <div class="accordion" id="accordionExample">
        <div class="accordion-item">
          <h2 class="accordion-header" id="headingOne">
            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
              [필수] 이용약관
            </button>
          </h2>
          <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
            <div class="accordion-body">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="termsCheck1">
                <label class="form-check-label" for="termsCheck1">
                  동의합니다
                </label>
              </div>
              <p>
              <%
              BufferedReader reader = null;
              try {
                // 파일 경로를 절대 경로로 변환
                String filePath = application.getRealPath("/resources/clause1");
                out.println("파일 절대 경로: " + filePath + "<br>");
                // 파일이 존재하는지 확인
                File file = new File(filePath);
                if (!file.exists()) {
                  out.println("파일이 존재하지 않습니다.<br>");
                } else {
                  // 파일을 읽기 위한 BufferedReader 생성
                  reader = new BufferedReader(new FileReader(filePath));
                  String line;
                  // 파일의 모든 줄을 읽어 HTML로 출력
                  while ((line = reader.readLine()) != null) {
                    out.println(line + "<br>");
                  }
                }
              }catch (IOException e) {
                out.println("약관을 불러오는 중 오류가 발생했습니다.");
              }finally {
                if (reader != null) {
                  try {
                    reader.close();
                  } catch (IOException e) {
                    e.printStackTrace();
                  }
                }
              }
              
              %>             
              </p>
            </div>
          </div>
        </div>
        <div class="accordion-item">
          <h2 class="accordion-header" id="headingTwo">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
              [필수] 개인정보 수집 및 이용안내
            </button>
          </h2>
          <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
            <div class="accordion-body">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="termsCheck2">
                <label class="form-check-label" for="termsCheck2">
                  동의합니다
                </label>
              </div>
              <p>개인정보 수집 및 이용안내 내용...</p>
            </div>
          </div>
        </div>
        <div class="accordion-item">
          <h2 class="accordion-header" id="headingThree">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
              [필수] 개인정보 활용 동의
            </button>
          </h2>
          <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
            <div class="accordion-body">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="termsCheck3">
                <label class="form-check-label" for="termsCheck3">
                  동의합니다
                </label>
              </div>
              <p>개인정보 활용 동의 내용...</p>
            </div>
          </div>
        </div>
      </div>
      <button type="submit" class="btn btn-primary mt-3">제출</button>
    </form>
  </div>
  

</body>
</html>