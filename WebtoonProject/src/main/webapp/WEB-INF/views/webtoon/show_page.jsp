<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ vo.title }</title>
</head>
<body>
			<!-- if 문을 위해 var에 check_login 값 설정 -->
	<c:set var="id" value="${sessionScope.id}" />
	<h1 style="width: 300px; margin: 0 auto;">
		<a href='mainToon.do'>코리아 웹툰</a>
	</h1>

	<c:choose>
		<c:when test="${id eq 'admin' }">
			<input id="logout_btn" type="button" value="로그아웃"
				onclick="location.href='logout.do'">
			<input id="admin_btn" type="button" value="관리자 페이지"
				onclick="location.href='admin_form.do'">
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
	
<h1 align="center">${ vo.title }</h1>
<img src="resources/upload/${ vo.filename }" alt="${ vo.filename }"/>
<input align="left" type="button" value="회차추가" onclick="location.href='addEpi_form?episode_idx=${ vo.webtoon_idx }'">
<table>
    <tr>
        <th>작가</th>
        <th>장르</th>
        <th>정보</th>
    </tr>
    <tr>
        <td>${ vo.author }</td>
        <td>${ vo.genre }</td>
        <td>${ vo.info }</td>        
    </tr>
</table>

<table cellpadding="0" cellspacing="0" class="viewList">
			<caption><span class="blind">회차별 목록</span></caption>
			<colgroup><col width="99"><col width="*"><col width="141"><col width="76">
			</colgroup><thead>
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
				<td>
					<img src="resources/upload/${ vo.filename }"/>
				</td>
				<td>
				<a href="Epi?episode_idx=${ epi.episode_idx }">${ epi.episodename }</a>
				</td>
				
				<td style="text-align:center;">
				${ epi.score }
				</td>
				
				<td>
				${epi.regdate }
				</td>
			</tr>
			</c:forEach>
			</tbody></table>
</body>
</html>