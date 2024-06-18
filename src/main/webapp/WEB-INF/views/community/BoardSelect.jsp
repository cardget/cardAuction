<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BoardSelect</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../resources/css/BoardSelect.css?after" rel="stylesheet">
</head>
<body>
    <div class="search-bar">
        <select>
            <option value="전체선택">전체선택</option>
        </select> <input type="text" placeholder="검색어를 입력해주세요">
        <button class="searchBtn">검색</button>
    </div>
    <div class="container">
        <div class="nav-links">
            <a href="#">카드경매</a> <a href="#">티어덱 리스트</a> <a href="#"
                class="active">커뮤니티</a> <a href="#">문의</a>
        </div>
        <hr>
        <div class="breadcrumbs">
            <a href="#">홈</a> &gt; <a href="#">포켓몬</a> &gt; <span>커뮤니티</span>
        </div>
        <div class="form-inline">
            <input type="submit" class="btn-primary" value="글 작성">
            <div class="search-elements">
                <select>
                    <option value="옵션1">검색 옵션</option>
                    <option value="옵션2">옵션2</option>
                </select> <select>
                    <option value="옵션1">태그 선택</option>
                    <option value="옵션2">옵션2</option>
                </select> <input type="text" placeholder="검색어를 입력해주세요">
                <button>검색</button>
            </div>
        </div>
        <table>
            <thead>
                <tr>
                    <th></th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>추천수</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>공지</td>
                    <td>커뮤니티 게시 규정 공지</td>
                    <td>관리자</td>
                    <td>2024-05-29</td>
                    <td>6</td>
                    <td>3240</td>
                </tr>
                <tr>
                    <td>공지</td>
                    <td>커뮤니티 게시물 제목 규정 알림!</td>
                    <td>관리자</td>
                    <td>2024-05-14</td>
                    <td>13</td>
                    <td>4283</td>
                </tr>
                <tr>
                    <td>공지</td>
                    <td>어뷰저/부적절 게시사항 내용</td>
                    <td>관리자</td>
                    <td>2024-04-27</td>
                    <td>27</td>
                    <td>6393</td>
                </tr>
                <tr>
                    <td>7</td>
                    <td>[자유] 로보존 카드 돌려</td>
                    <td>은정띠</td>
                    <td>2024-05-28</td>
                    <td>0</td>
                    <td>6</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>[자유] 여리가 만들어놔</td>
                    <td>준성쓰</td>
                    <td>2024-05-28</td>
                    <td>0</td>
                    <td>6</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>[배틀] 로보존 배틀 핵심분</td>
                    <td>디자인짱성진</td>
                    <td>2024-05-28</td>
                    <td>0</td>
                    <td>6</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>[경매] 레어카드 경매 올릴건가요~</td>
                    <td>나는양승건</td>
                    <td>2024-05-28</td>
                    <td>0</td>
                    <td>6</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>[Q&A] 이 덱 구성할 때 어떤 카드 필요할까요</td>
                    <td>서연잇</td>
                    <td>2024-05-28</td>
                    <td>0</td>
                    <td>6</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>[자유] 사용경기하우~</td>
                    <td>시믄정</td>
                    <td>2024-05-28</td>
                    <td>0</td>
                    <td>6</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>[경매] 이 카드 이동은 경매에 넣을려는데 괜찮나요?</td>
                    <td>대장은심은정</td>
                    <td>2024-05-28</td>
                    <td>0</td>
                    <td>6</td>
                </tr>
            </tbody>
        </table>
        <div class="pagination">
            <a href="#">&laquo;</a> <a href="#">1</a> <a href="#">2</a> <a
                href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
            <a href="#">7</a> <a href="#">8</a> <a href="#">9</a> <a href="#">10</a>
            <a href="#">&raquo;</a>
        </div>
    </div>
</body>
</html>
