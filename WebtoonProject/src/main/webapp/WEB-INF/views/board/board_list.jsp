<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
<!DOCTYPE html>
<html>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"
    />
<head>
<meta charset="UTF-8">
<title>코리아 웹툰</title>

<link rel="stylesheet" href="/webtoon/resources/css/webtoon.css">


</head>
<body>

	<h1 style="width:300px; margin:0 auto;">코리아 웹툰</h1>
	 <!-- 상단 네비게이션 -->
	<nav class="navbar navbar-expand-lg" >
  <div class="container-fluid">
    	
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarScroll">
      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px; padding-left:200px;">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">홈</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            웹툰
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            베스트 도전
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            도전 만화
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">마이페이지</a>
        </li>
        
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

<!-- 스와이퍼 슬라이드 -->

<div class="swiper mySwiper left-item">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-1.jpg" />
        </div>
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-2.jpg" />
        </div>
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-3.jpg" />
        </div>
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-4.jpg" />
        </div>
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-5.jpg" />
        </div>
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-6.jpg" />
        </div>
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-7.jpg" />
        </div>
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-8.jpg" />
        </div>
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-9.jpg" />
        </div>
      </div>
      <div class="swiper-pagination"></div>
    </div>


<!-- 하단 탭 -->
<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist" style="width:300px; margin:0 auto;">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-1" type="button" role="tab" aria-controls="pills-home" aria-selected="true">일상</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-2" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">개그</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-3" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">판타지</button>
  </li>
  <!-- <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-disabled-tab" data-bs-toggle="pill" data-bs-target="#pills-4" type="button" role="tab" aria-controls="pills-disabled" aria-selected="false" disabled>액션</button>
  </li>  -->
</ul>
<div class="tab-content" id="pills-tabContent">
  <div class="tab-pane fade show active" id="pills-1" role="tabpanel" aria-labelledby="pills-1-tab" tabindex="0">
  <div class="container text-center tab_1">
  <div class="row">
    <div class="col">
    <a href="show?idx=23">
      Column1
     </a>    
    </div>
    <div class="col">
      Column2
    </div>
    <div class="col">
      Column3
    </div>
  </div>
  <div class="row">
    <div class="col">
      Column4
    </div>
    <div class="col">
      Column5
    </div>
    <div class="col">
      Column6
    </div>
  </div>
</div> <!-- tab_1 -->
  </div>
  <div class="tab-pane fade" id="pills-2" role="tabpanel" aria-labelledby="pills-2-tab" tabindex="0">
  <div class="container text-center tab_2">
  <div class="row">
    <div class="col">
      Column1
    </div>
    <div class="col">
      Column2
    </div>
    <div class="col">
      Column3
    </div>
  </div>
  <div class="row">
    <div class="col">
      Column4
    </div>
    <div class="col">
      Column5
    </div>
    <div class="col">
      Column6
    </div>
  </div>
</div> <!-- tab_2 -->
  </div>
  <div class="tab-pane fade" id="pills-3" role="tabpanel" aria-labelledby="pills-3-tab" tabindex="0">
  <div class="container text-center tab_3">
  <div class="row">
    <div class="col">
      Column1
    </div>
    <div class="col">
      Column2
    </div>
    <div class="col">
      Column3
    </div>
  </div>
  <div class="row">
    <div class="col">
      Column4
    </div>
    <div class="col">
      Column5
    </div>
    <div class="col">
      Column6
    </div>
  </div>
</div> <!-- tab_3 -->
  </div>
  <!--  <div class="tab-pane fade" id="pills-4" role="tabpanel" aria-labelledby="pills-4-tab" tabindex="0"><h1>4</h1></div>-->
</div>


	<table border="1" align="center" width="700">
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
				<td class="idx">${vo.idx}</td>
				
				<!-- 댓글 들여쓰기 -->
				<td>
				<c:forEach begin="1" end="${ vo.depth }">&nbsp;</c:forEach>
				
				<!-- 댓글 기호  -->
				<c:if test="${vo.depth ne 0}">
					ㄴ
				</c:if>
				
				<c:if test="${vo.del_info eq 0}">
					<a href="view.do?idx=${vo.idx}">${vo.subject}
					</a>
				</c:if>
				
				<c:if test="${vo.del_info ne 0}">
				
					<font>${vo.subject}</font>
					
				</c:if>
				
									
				</td>
				
				<td>${vo.name}</td>
				<td align="center">${fn:split(vo.regdate,' ')[0]}</td>
				<td align="center">${vo.readhit}</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="5" align="center" style="border:0px;">
				&lt; 1 2 3 &gt;
			</td>
		</tr>
		
		<tr>
			<td colspan="5" align="right">
				<input type="button" value="새글 쓰기" onclick="location.href='insert_form.do'" />
			</td>
		</tr>
		
	</table>
	<!-- 부트스트랩 JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	
	 <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
     <!-- 웹툰 js -->
    <script src="/webtoon/resources/js/webtoon.js"></script>

   
</body>
</html>