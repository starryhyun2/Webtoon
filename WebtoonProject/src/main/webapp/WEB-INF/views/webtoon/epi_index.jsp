<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ epi.episodename }</title>
</head>
<body>
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
	<h1 align="center">${ epi.episodename }</h1>
	<c:forEach var="i" begin="1" end="${ cnt }">
	<div align="center">
			<img src="resources/${ epi.path }/${ epi.episodename }/${ epi.episodename } (${ i }).jpg" />
	</div>
	</c:forEach>
</body>
</html>