<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<script>
	function send(id){
		if(id==null){
			alert('로그인 한 후에 글을 쓸 수 있습니다.');
			return;
		}else if(id==''){
			alert('로그인 한 후에 글을 쓸 수 있습니다.');
			return;
		}
		location.href='insert_form.do';
		
	}
</script>
<head>
<meta charset="UTF-8">
<title>코리아 웹툰</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="/webtoon/resources/css/common.css">
<link rel="stylesheet" href="/webtoon/resources/css/webtoon.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Yeon+Sung&display=swap"
	rel="stylesheet">
	
		<!-- 부트스트랩 JS -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
			crossorigin="anonymous"  defer></script>

		<!-- Swiper JS -->
		<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"  defer></script>
		<!-- 웹툰 js -->
		<script src="/webtoon/resources/js/webtoon.js"  defer></script>

</head>
<body>
	<div id="total_wrap">

		<div id="first">
			<h1 id="main_title">
				<a href='mainToon.do'> <img
					src="/webtoon/resources/thumbnail/korea_logo.jpg" /> <span>코리아
						웹툰</span>
				</a>
			</h1>

			<div id="header">
				<!-- if 문을 위해 var에 check_login 값 설정 -->
				<c:set var="id" value="${sessionScope.id}" />

				<c:choose>
					<c:when test="${id eq 'admin' }">
						<input id="bookmark_btn" type="button" value="북마크"
							onclick="location.href='bookmark.do'">
						<input id="logout_btn" type="button" value="로그아웃"
							onclick="location.href='logout.do'">
						<input id="admin_btn" type="button" value="관리자 페이지"
							onclick="location.href='admin_form.do'">
						<input id="Mypage_btn" type="button" value="My 페이지"
							onclick="location.href='Mypage'">
					</c:when>

					<c:when test="${id ne null }">
						<input id="bookmark_btn" type="button" value="북마크"
							onclick="location.href='bookmark.do'">
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
			<!-- <nav class="nav_bar">
				<span class="nav_list">홈</span> <span class="nav_list">오늘의 웹툰</span>
				<span class="nav_list">최신 웹툰</span>
			</nav> -->

		</div>
		<!-- first -->
		<!-- 스와이퍼 슬라이드 -->
		<div class="slide-background">
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

		</div>

		<!-- 섹션 2 -->
		<div id="second" style="display: flex; justify-content: center;">

			<div id="second_left" style="width: 65%;">
				<!-- 하단 탭 -->
				<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="pills-home-tab"
							data-bs-toggle="pill" data-bs-target="#pills-1" type="button"
							role="tab" aria-controls="pills-home" aria-selected="true">액션</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="pills-profile-tab"
							data-bs-toggle="pill" data-bs-target="#pills-2" type="button"
							role="tab" aria-controls="pills-profile" aria-selected="false">개그</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="pills-contact-tab"
							data-bs-toggle="pill" data-bs-target="#pills-3" type="button"
							role="tab" aria-controls="pills-contact" aria-selected="false">판타지</button>
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
												<a href="show?idx=${ mt.webtoon_idx }"> <!-- 첨부된 이미지가 있는 경우에만 img태그를 보여주자! -->
													<c:if test="${mt.filename ne 'no_file'}">

														<img src="/webtoon/resources/upload/${mt.filename}"
															width="100%" class="box-con" />
													</c:if>

													<div class="type_content box-con">
														<p>${ mt.info }</p>
													</div>
													<div class="type_title box-con">
														<p>
															<span class="author">${ mt.author }</span>&nbsp;/&nbsp; <span
																class="title">${ mt.title }</span>
														</p>
													</div>

													<div class="type_regdate box-con">
														<p>
															<span>${fn:split(mt.regdate,' ')[0]}</span>
														</p>
													</div>
												</a>
											</div>
											<!-- wrap -->
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
												<a href="show?idx=${ mt.webtoon_idx }"> <!-- 첨부된 이미지가 있는 경우에만 img태그를 보여주자! -->
													<c:if test="${mt.filename ne 'no_file'}">
														<img src="/webtoon/resources/upload/${mt.filename}"
															width="100%" class="box-con" />
													</c:if>

													<div class="type_content box-con">
														<p>${ mt.info }</p>
													</div>
													<div class="type_title box-con">
														<p>
															<span class="author">${ mt.author }</span>&nbsp;/&nbsp; <span
																class="title">${ mt.title }</span>
														</p>
													</div>

													<div class="type_regdate box-con">
														<p>
															<span>${fn:split(mt.regdate,' ')[0]}</span>
														</p>
													</div>
												</a>
											</div>
											<!-- wrap -->
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
												<a href="show?idx=${ mt.webtoon_idx }"> <!-- 첨부된 이미지가 있는 경우에만 img태그를 보여주자! -->

													<c:if test="${mt.filename ne 'no_file'}">
														<img src="/webtoon/resources/upload/${mt.filename}"
															width="100%" class="box-con" />
													</c:if>

													<div class="type_content box-con">
														<p>${ mt.info }</p>
													</div>
													<div class="type_title box-con">
														<p>
															<span class="author">${ mt.author }</span>&nbsp;/&nbsp; <span
																class="title">${ mt.title }</span>
														</p>
													</div>
													<div class="type_regdate box-con">
														<p>
															<span>${fn:split(mt.regdate,' ')[0]}</span>
														</p>
													</div>
												</a>
											</div>
											<!-- wrap -->
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<!-- tab_3 -->
					</div>
					<!--  <div class="tab-pane fade" id="pills-4" role="tabpanel" aria-labelledby="pills-4-tab" tabindex="0"><h1>4</h1></div>-->
				</div>

				<div style="width: 100%;" align="middle">
					<div style="width: 100%; max-height: 500px; overflow: hidden;">
						<div style="width: 100%; height: 500px; position: absolute;"></div>
						<iframe id="youtube_link"
							src="https://www.youtube.com/embed/YwxIPPJjYSQ?start=6&autoplay=1&mute=1&playlist=YwxIPPJjYSQ&loop=1&controls=0"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen style="margin-top: -10%; margin-bottom: -5%;"></iframe>
					</div>
				</div>

			</div>
			<!--  section2 left-->


			<div id="second_right">
				<div class="img_box">
					<img src="/webtoon/resources/thumbnail/webtoon_cookie.jpg" /> <img
						src="/webtoon/resources/thumbnail/webtoon_banner.jpg" />
				</div>
			</div>


		</div>
		<!-- second -->
		<table align="center">


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

					<td class="board_title"><a
						href="view.do?board_idx=${vo.board_idx }&page=${param.page}">
							${vo.title} </a></td>

					<td class="board_author">${vo.id}</td>
					<td align="center">${fn:split(vo.regdate,' ')[0]}</td>
					<td align="center">${vo.readhit}</td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="4" align="center" style="border: 0px;">${ pageMenu }
				</td>
				<td colspan="1" align="right"><input type="button"
					style="background-color: #99d280; border: 0px; padding: 10px; border-radius: 8px; font-weight: bold;"
					value="새 글 쓰기" onclick="send('${sessionScope.id}')" /></td>
					
			</tr>

		</table>

	</div>
	<!-- total_wrap -->
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