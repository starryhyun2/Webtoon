<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>게시판 보기</title>

<!-- Ajax 사용을 위한 js를 로드 -->
<script src="/webtoon/resources/js/httpRequest.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/webtoon/resources/css/common.css">
<link rel="stylesheet" href="/webtoon/resources/css/board.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Yeon+Sung&display=swap"
	rel="stylesheet">

<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"
	defer></script>
<!-- 웹툰 js -->
<script src="/webtoon/resources/js/webtoon.js" defer></script>
<script src="/webtoon/resources/js/board.js" defer></script>

</head>
<body>
	<div id="total_wrap">

		<div id="first">
			<!-- if 문을 위해 var에 check_login 값 설정 -->
			<!--<c:set var="var" value="${ check_login }" />-->
			<c:set var="id" value="${sessionScope.id}" />
			<h1 id="main_title">
				<a href='mainToon.do'> <img
					src="/webtoon/resources/thumbnail/korea_logo.jpg" /> <span>코리아
						웹툰</span>
				</a>
			</h1>

			<div id="header">
				<c:choose>
					<c:when test="${id eq 'admin' }">
						<input id="logout_btn" type="button" value="로그아웃"
							onclick="location.href='logout.do'">
						<input id="admin_btn" type="button" value="관리자 페이지"
							onclick="location.href='admin_form.do'">
						<input id="Mypage_btn" type="button" value="My 페이지"
							onclick="location.href='Mypage'">
					</c:when>

					<c:when test="${id ne null }">
						<input id="logout_btn" type="button" value="로그아웃"
							onclick="location.href='logout.do'">
						<input id="Mypage_btn" type="button" value="My 페이지"
							onclick="location.href='Mypage'">
					</c:when>

					<c:otherwise>
						<input id="login_btn" type="button" value="로그인"
							onclick="location.href='login_form'">
						<input id="sign_up_btn" type="button" value="회원가입"
							onclick="location.href='sign_up_form'">
					</c:otherwise>
				</c:choose>
			</div>

			<!-- 상단 네비게이션 -->
			<nav class="nav_bar">
				<span class="nav_list">홈</span> <span class="nav_list">오늘의 웹툰</span>
				<span class="nav_list">최신 웹툰</span>
			</nav>
		</div>
		<!-- first -->
		<hr>

		<form id="ff">
			<table align="center" id="main_board">

				<tr>
					<td>제목</td>
					<td>${vo.title}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${vo.id}</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${vo.regdate}</td>
				</tr>
				<tr id="content_row">
					<td>내용</td>
					<td><pre>${vo.content}</pre></td>
				</tr>

			</table>
			<div class="board_btn">
				<input type="button" value="목록 보기" onclick="location.href='list.do'">
				<input type="button" value="삭 제" onclick="del(this.form);">
				<input name="board_idx" type="hidden" value=${ vo.board_idx } />
			</div>
		</form>

		<form id="cb">
			<table align="center" width="80%">
				<tr>

					<td colspan="4"><input type="text" name="id" placeholder="아이디"
					value="${sessionScope.id}" readOnly> <input type="text" name="content"
						placeholder="댓글 쓰기" style="width: 80%;"> <input
						type="button" value="댓글" onclick="reply_send(this.form);">
						<input name="ref" type="hidden" value=${ vo.board_idx } /></td>

				</tr>
			</table>
		</form>
		<table align="center" width="80%" id="reply_board">
			<!-- 	<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>내용</th>
			</tr>
			 -->

			<c:forEach var="cb" items="${cb_list}">
				<tr>
					<td width="3%">${cb.comments_idx}</td>
					<td width="10%">${cb.id}</td>

					<!-- 댓글 들여쓰기 -->
					<td><c:if test="${cb.del_info eq 0}">
					${cb.content}
				</c:if> <c:if test="${cb.del_info ne 0}">

							<font>${cb.content}</font>

						</c:if></td>

					<td width="20%">${cb.regdate }</td>
				</tr>
			</c:forEach>

		</table>
	</div>
</body>
</html>