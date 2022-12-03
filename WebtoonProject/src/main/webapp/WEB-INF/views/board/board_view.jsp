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

<!-- 웹툰 js -->
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
				<input type="button" value="메인 화면" onclick="location.href='list.do'">
				<c:if test="${vo.id eq id}">
				<input type="button" value="수 정" onclick="modify_board_form(this.form);">
				<input type="button" value="삭 제" onclick="del(this.form);">
				</c:if>
				<input name="board_idx" type="hidden" value=${ vo.board_idx } />
			</div>
		</form>

		<form id="cb">
			<table align="center" width="80%">
				<tr>

					<td colspan="4"><input type="text" name="id" placeholder="아이디"
					value="${sessionScope.id}" readOnly> <input type="text" name="content"
						placeholder="댓글 쓰기" style="width: 80%;"> <input
						type="button" value="입력" onclick="reply_send(this.form);">
						<input name="ref" type="hidden" value=${ vo.board_idx } /></td>

				</tr>
			</table>
		</form>
		<form id="c_comment_form">
		<table align="center" width="80%" id="reply_board">
		

			<c:forEach var="cb" items="${cb_list}">
				<tr>
					<td width="15%">${cb.id}</td>

					<!-- 댓글 들여쓰기 -->
					<td>
						${cb.content}
					</td>
					<td width="20%">${cb.regdate }</td>
					<td width="10%">
						<input name="comments_idx" type="hidden" value=${ cb.comments_idx } />
						<input name="ref" type="hidden" value=${ cb.ref } />
						<c:if test="${cb.id eq id}">
						<input type="button" value="삭제" onclick="comments_del(this.form)"/>
						</c:if>
					</td>
					
				</tr>
			</c:forEach>

		</table>
		</form>
	</div>
</body>
</html>