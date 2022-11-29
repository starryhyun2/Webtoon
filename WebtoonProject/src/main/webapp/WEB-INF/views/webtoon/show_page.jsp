<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ vo.title }</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="/webtoon/resources/css/showPage.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Yeon+Sung&display=swap"
	rel="stylesheet">

</head>
<body>

	<div id="total_wrap">

		<div id="first">
			<!-- if 문을 위해 var에 check_login 값 설정 -->
			<c:set var="var" value="${ check_login }" />
			<h1 id="main_title">
				<a href='mainToon.do'> <img
					src="/webtoon/resources/thumbnail/korea_logo.jpg" /> <span>코리아
						웹툰</span>
				</a>
			</h1>

			<div id="header">
				<c:choose>
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
	<br>	
		
			<h1 align="center">${ vo.title }</h1>
			<div id="main_img">
				<img src="resources/upload/${ vo.filename }" alt="${ vo.filename }" />
			</div>
			
			
			<ul class="webtoon_info">
			<li><a href='addEpi_form?episode_idx=${ vo.webtoon_idx }' style="font-weight:bold">회차 추가</a></li>
			
				<li>작가 : <span>${ vo.author }</span></li>
				<li>장르 : 
					<c:if test="${vo.genre eq 'genre_1'}">
						<span>액션</span>
					</c:if>
					<c:if test="${vo.genre eq 'genre_2'}">
						<span>개그</span>
					</c:if>
					<c:if test="${vo.genre eq 'genre_3'}">
						<span>판타지</span>
					</c:if>
				</li>
				<li>정보 : <span>${ vo.info }</span></li>
			</ul>
			

			<table cellpadding="10px" cellspacing="10px" class="viewList" id="epi_table">
				<colgroup>
					<col width="120">
					<col width="*">
					<col width="200">
					<col width="150">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">이미지</th>
						<th scope="col">제목</th>
						<th scope="col">별점</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="epi" items="${ epi }">
					
						<tr>
							<td><img src="resources/upload/${ vo.filename }" /></td>
							<td><a href="Epi?episode_idx=${ epi.episode_idx }">${ epi.episodename }</a>
							</td>

							<td style="text-align: center;">${ epi.score }</td>

							<td>${epi.regdate }</td>
						</tr>
					
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- total_wrap -->

	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<!-- 웹툰 js -->
	<script src="/webtoon/resources/js/webtoon.js"></script>

</body>
</html>