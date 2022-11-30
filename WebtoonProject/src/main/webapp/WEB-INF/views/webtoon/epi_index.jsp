<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ epi.episodename }</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="/webtoon/resources/css/common.css">
<link rel="stylesheet" href="/webtoon/resources/css/showPage.css">
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
				<!--<c:choose>
					<c:when test="${var eq 'admin' }">
						<input id="logout_btn" type="button" value="로그아웃"
							onclick="location.href='logout.do'">
						<input id="admin_btn" type="button" value="관리자 페이지"
							onclick="location.href='admin_form.do'">
					</c:when>

					<c:when test="${var eq 'false' }">
						<input id="login_btn" type="button" value="로그인"
							onclick="location.href='login_form'">
						<input id="sign_up_btn" type="button" value="회원가입"
							onclick="location.href='sign_up_form'">
					</c:when>

					<c:when test="${var eq null }">
						<input id="login_btn" type="button" value="로그인"
							onclick="location.href='login_form'">
						<input id="sign_up_btn" type="button" value="회원가입"
							onclick="location.href='sign_up_form'">
					</c:when>

					<c:otherwise>
						<h4 style="font-size: 1.2em; padding: 20px;">안녕하세요.
							${sessionScope.id } 님</h4>
						<input id="logout_btn" type="button" value="로그아웃"
							onclick="location.href='logout.do'">
						<input id="Mypage_btn" type="button" value="My 페이지"
							onclick="location.href='Mypage'">
					</c:otherwise>
				</c:choose>-->
			</div>

			<!-- 상단 네비게이션 -->
			<nav class="nav_bar">
				<span class="nav_list">홈</span> <span class="nav_list">오늘의 웹툰</span>
				<span class="nav_list">최신 웹툰</span>
			</nav>
		</div>
		<!-- first -->


		<hr>

		<h1 align="center" id="epi_title">${ epi.episodename }</h1>
		<c:forEach var="i" begin="1" end="${ cnt }">
			<div align="center">
				<img
					src="resources/${ epi.path }/${ epi.episodename }/${ epi.episodename } (${ i }).jpg" />
			</div>
		</c:forEach>

	</div>
</body>
</html>