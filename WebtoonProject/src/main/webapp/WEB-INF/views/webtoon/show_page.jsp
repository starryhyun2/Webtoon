<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ vo.title }</title>

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

<script src="/webtoon/resources/js/httpRequest.js"></script>
<script>

// 병합시 웹툰 상세보기 페이지에 function send() 기능만 추가하고 필요없는 페이지

	function send(f){
		
		var ref = f.webtoon_idx.value;
		var user_id = f.user_id.value;
		var genre = f.genre.value;
		
		var url = "addBookmark.do";
		var param = "ref="+ref+
					"&user_id="+user_id+
					"&genre="+genre;

		sendRequest( url, param, resultFn, "GET");

	}
	
	function resultFn(){
			
			if( xhr.readyState == 4 && xhr.status == 200 ){
				
				var bookmark = xhr.responseText;

				if( bookmark == 'no'){
					alert("북마크 삭제되었습니다.");
					return;
				}
				
				alert("북마크 추가되었습니다.");
				
			}
	}
</script>

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
				<c:set var="id" value="${sessionScope.id}" />

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
						<h4 style="font-size: 1.2em; padding: 20px;">안녕하세요.
							${sessionScope.id } 님</h4>
						<input id="logout_btn" type="button" value="로그아웃"
							onclick="location.href='logout.do'">
						<input id="Mypage_btn" type="button" value="My 페이지"
							onclick="location.href='Mypage'">
						<input id="bm_up_btn" type="button" value="북마크"
							onclick="location.href='bookmark.do'">
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
		<br>
		
		<h1 align="center">${ vo.title }</h1>
		<div id="top_section">
			<div id="main_img">
				<img src="resources/upload/${ vo.filename }" alt="${ vo.filename }" />
			</div>

			<ul id="webtoon_info">
				
				<li>작가 : <span>${ vo.author }</span></li>
				<li>장르 : <c:if test="${vo.genre eq 'genre_1'}">
						<span>액션</span>
					</c:if> <c:if test="${vo.genre eq 'genre_2'}">
						<span>개그</span>
					</c:if> <c:if test="${vo.genre eq 'genre_3'}">
						<span>판타지</span>
					</c:if>
				</li>
				<li style="width:500px;">정보 : <span>${ vo.info }</span></li>
				<c:if test="${id eq 'admin'}"><li style=" margin-top:50px;"><a href='addEpi_form?episode_idx=${ vo.webtoon_idx }'
					style="background-color:#99d280; padding:2%;">회차 추가</a></li></c:if>
					
					<li style=" margin-top:50px;">
					<form>
						<c:if test="${user ne null}">
							<input type="hidden" name="user_id" value="${user}">	<!-- 임의의 id값을 받아왔지만 session 설정시 session값 받기 -->
							<input type="hidden" name="webtoon_idx" value="${vo.webtoon_idx}">
							<input type="hidden" name="genre" value="${vo.genre}">
							<input type="button" id="btn" value="북마크" onclick="send(this.form);">
						</c:if>
					</form>
					</li>
			</ul>
		</div>

			<table cellpadding="10px" cellspacing="10px" class="viewList"
				id="epi_table">
				<colgroup>
					<col width="120">
					<col width="*">
					<col width="200">
					<col width="150">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" style="background-color:#99d280;">이미지</th>
						<th scope="col" style="background-color:#99d280;">제목</th>
						<th scope="col" style="background-color:#99d280;">별점</th>
						<th scope="col" style="background-color:#99d280;">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="epi" items="${ epi }">

						<tr>
							<td><img src="resources/upload/${ vo.filename }" /></td>
							<td><a href="Epi?episode_idx=${ epi.episode_idx }">${ epi.episodename }</a>
							</td>

							<td style="text-align: center;" class="scoreBox">
								<span class="scoreStar">
									<c:if test="${ epi.score == 5}">★★★★★</c:if>
									<c:if test="${ epi.score >= 4 and epi.score < 5}">★★★★</c:if>
									<c:if test="${ epi.score >= 3 and epi.score < 4}">★★★</c:if>
									<c:if test="${ epi.score >= 2 and epi.score < 3}">★★</c:if>
									<c:if test="${ epi.score >= 1 and epi.score < 2}">★</c:if>
									<c:if test="${ epi.score < 1}">0점</c:if>
								</span>
								
								${ epi.score }
								
							</td>

							<td>${epi.regdate }</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		
<!-- 
		<h1 align="center">${ vo.title }</h1>
		<div id="main_img">
			<img src="resources/upload/${ vo.filename }" alt="${ vo.filename }" />
		</div>


		<ul class="webtoon_info">
			<li><a href='addEpi_form?episode_idx=${ vo.webtoon_idx }'
				style="font-weight: bold">회차 추가</a></li>

			<li>작가 : <span>${ vo.author }</span></li>
			<li>장르 : <c:if test="${vo.genre eq 'genre_1'}">
					<span>액션</span>
				</c:if> <c:if test="${vo.genre eq 'genre_2'}">
					<span>개그</span>
				</c:if> <c:if test="${vo.genre eq 'genre_3'}">
					<span>판타지</span>
				</c:if>
			</li>
			<li>정보 : <span>${ vo.info }</span></li>
		</ul>


		<table cellpadding="10px" cellspacing="10px" class="viewList"
			id="epi_table">
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
		</table>-->
	</div> 
	
	<!-- total_wrap -->



</body>
</html>