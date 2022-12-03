<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>


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
		<h3 style="text-align:center; margin:20px 0;">게시판 수정</h3>
		<form>
			<table align="center" id="board_write">
				<tr>
					<th>제목</th>
					<td><input name="title" value="${vo.title}" style="width:100%;"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input name="id"  value="${vo.id}" readOnly style="width:30%;"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" rows="10" cols="100" style="width:100%;">
					${vo.content} 
					</textarea></td>
				</tr>
				
				</table><div class="board_btn">
					<input type="button" value="수정하기"
						onclick="send_modify(this.form)"> 
						<input type="button"
						value="취 소" onclick="location.href='view.do?board_idx=${ vo.board_idx }'">
						<input name="board_idx" type="hidden" value=${ vo.board_idx } />
						</div>
				
			
		</form>

	</div>
</body>
</html>