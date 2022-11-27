<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<head>
<meta charset="UTF-8">
<title>코리아 웹툰</title>

<link rel="stylesheet" href="/webtoon/resources/css/webtoon.css">


</head>
<body>
	<!-- if 문을 위해 var에 check_login 값 설정 -->
	<c:set var="var" value="${ check_login }" />
	<h1 style="width: 300px; margin: 0 auto;"><a href='mainToon.do'>코리아 웹툰</a></h1>

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

			<input id="logout_btn" type="button" value="로그아웃"
				onclick="location.href='logout.do'">
			<input id="Mypage_btn" type="button" value="My 페이지"
				onclick="location.href='Mypage'">
		</c:otherwise>
	</c:choose>
	
	
	<!-- 상단 네비게이션 -->
	<nav class="navbar navbar-expand-lg">
		<div class="container-fluid">

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarScroll"
				aria-controls="navbarScroll" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarScroll">
				<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
					style="-bs-scroll-height: 100px; padding-left: 200px;">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">홈</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 웹툰 </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>

				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="검색"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>

	<!-- 스와이퍼 슬라이드 -->

	<div class="swiper mySwiper left-item">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="/webtoon/resources/thumbnail/slide-1.jpg" />
			</div>
			<div class="swiper-slide">
				<img src="/webtoon/resources/thumbnail/slide-2.jpg" />
			</div>
			<div class="swiper-slide">
				<img src="/webtoon/resources/thumbnail/slide-3.jpg" />
			</div>
			<div class="swiper-slide">
				<img src="/webtoon/resources/thumbnail/slide-4.jpg" />
			</div>
			<div class="swiper-slide">
				<img src="/webtoon/resources/thumbnail/slide-5.jpg" />
			</div>
			<div class="swiper-slide">
				<img src="/webtoon/resources/thumbnail/slide-6.jpg" />
			</div>
			<div class="swiper-slide">
				<img src="/webtoon/resources/thumbnail/slide-7.jpg" />
			</div>
			<div class="swiper-slide">
				<img src="/webtoon/resources/thumbnail/slide-8.jpg" />
			</div>
			<div class="swiper-slide">
				<img src="/webtoon/resources/thumbnail/slide-9.jpg" />
			</div>
		</div>
		<!--  <div class="swiper-pagination"></div> -->
	</div>


	<!-- 하단 탭 -->
	<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link active" id="pills-home-tab"
				data-bs-toggle="pill" data-bs-target="#pills-1" type="button"
				role="tab" aria-controls="pills-home" aria-selected="true">액션</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill"
				data-bs-target="#pills-2" type="button" role="tab"
				aria-controls="pills-profile" aria-selected="false">개그</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill"
				data-bs-target="#pills-3" type="button" role="tab"
				aria-controls="pills-contact" aria-selected="false">판타지</button>
		</li>
		<!-- <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-disabled-tab" data-bs-toggle="pill" data-bs-target="#pills-4" type="button" role="tab" aria-controls="pills-disabled" aria-selected="false" disabled>액션</button>
  </li>  -->
	</ul>
	<div class="tab-content" id="pills-tabContent">
		<div class="tab-pane fade show active" id="pills-1" role="tabpanel"
			aria-labelledby="pills-1-tab" tabindex="0">
			<div class="container text-center tab_1">
				<div class="row">

					<c:forEach var="mt" items="${mt_list}">

						<c:if test="${mt.genre eq 'genre_1'}">
							<div class="col-4 mt_box">
								<div class="wrap">

									<!-- 첨부된 이미지가 있는 경우에만 img태그를 보여주자! -->
									<c:if test="${mt.filename ne 'no_file'}">
										<a href="show?idx=${ mt.webtoon_idx }"> <img
											src="/webtoon/resources/upload/${mt.filename}" width="100%"
											class="box-con" />
										</a>
									</c:if>

									<div class="type_content box-con">
										<p>${ mt.info }</p>
									</div>
									<div class="type_name box-con">
										<p>
											작성자 : <span>${ mt.author }</span>
										</p>
									</div>
									<div class="type_title box-con">
										<p>
											제목 : <span>${ mt.title }</span>
										</p>
									</div>
									<div class="type_regdate box-con">
										<p>
											작성일 : <span>${fn:split(mt.regdate,' ')[0]}</span>
										</p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>

				</div>
			</div>
			<!-- tab_1 -->


		</div>
		<div class="tab-pane fade" id="pills-2" role="tabpanel"
			aria-labelledby="pills-2-tab" tabindex="0">
			<div class="container text-center tab_2">
				<div class="row">

					<c:forEach var="mt" items="${mt_list}">

						<c:if test="${mt.genre eq 'genre_2'}">
							<div class="col-4 mt_box">
								<div class="wrap">

									<!-- 첨부된 이미지가 있는 경우에만 img태그를 보여주자! -->
									<c:if test="${mt.filename ne 'no_file'}">
										<img src="/webtoon/resources/upload/${mt.filename}"
											width="100%" class="box-con" />
									</c:if>

									<div class="type_content box-con">
										<p>${ mt.info }</p>
									</div>
									<div class="type_name box-con">
										<p>
											작성자 : <span>${ mt.author }</span>
										</p>
									</div>
									<div class="type_name box-con">
										<p>
											제목 : <span>${ mt.title }</span>
										</p>
									</div>
									<div class="type_regdate box-con">
										<p>
											작성일 : <span>${fn:split(mt.regdate,' ')[0]}</span>
										</p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- tab_2 -->
		</div>
		<div class="tab-pane fade" id="pills-3" role="tabpanel"
			aria-labelledby="pills-3-tab" tabindex="0">
			<div class="container text-center tab_3">
				<div class="row">

					<c:forEach var="mt" items="${mt_list}">

						<c:if test="${mt.genre eq 'genre_3'}">
							<div class="col-4 mt_box">
								<div class="wrap">

									<!-- 첨부된 이미지가 있는 경우에만 img태그를 보여주자! -->

									<c:if test="${mt.filename ne 'no_file'}">
										<img src="/webtoon/resources/upload/${mt.filename}"
											width="100%" class="box-con" />
									</c:if>

									<div class="type_content box-con">
										<p>${ mt.info }</p>
									</div>
									<div class="type_name box-con">
										<p>
											작성자 : <span>${ mt.author }</span>
										</p>
									</div>
									<div class="type_name box-con">
										<p>
											제목 : <span>${ mt.title }</span>
										</p>
									</div>
									<div class="type_regdate box-con">
										<p>
											작성일 : <span>${fn:split(mt.regdate,' ')[0]}</span>
										</p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- tab_3 -->
		</div>
		<!--  <div class="tab-pane fade" id="pills-4" role="tabpanel" aria-labelledby="pills-4-tab" tabindex="0"><h1>4</h1></div>-->
	</div>

	<table border="1" align="center" width="80%">
		<!--<caption><h1>::: 게시판 :::</h1></caption>-->

		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>

		<c:forEach var="vo" items="${list}">

			<tr>
				<td class="board_idx">${vo.board_idx}</td>

				<td><a
					href="view.do?board_idx=${vo.board_idx }&page=${param.page}">${vo.title}
				</a></td>

				<td>${vo.id}</td>
				<td align="center">${fn:split(vo.regdate,' ')[0]}</td>
				<td align="center">${vo.readhit}</td>
			</tr>
		</c:forEach>

		<tr>
			<td colspan="5" align="center" style="border: 0px;">${ pageMenu }
			</td>
		</tr>

		<tr>
			<td colspan="5" align="right"><input type="button"
				value="새 글 쓰기" onclick="location.href='insert_form.do'" /></td>
		</tr>

	</table>
	<!-- 부트스트랩 JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<!-- 웹툰 js -->
	<script src="/webtoon/resources/js/webtoon.js"></script>


</body>
</html>