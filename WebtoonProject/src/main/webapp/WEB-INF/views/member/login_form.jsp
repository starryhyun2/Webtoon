<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webtoon/resources/css/loginForm.css">


<!-- Ajax사용을 위한 js를 추가 -->
<script src="/webtoon/resources/js/httpRequest.js"></script>

<!-- 기능 구현을 위한 스크립트 링크 -->
<script src="/webtoon/resources/js/login_form.js"></script>

</head>
<body>
로그인 페이지<br>

	<form>
		<table border="1" align="center">
			<tr>
				<th>ID : </th>
				<td><input name="id"></td>
			</tr>
			
			<tr>
				<th>PWD : </th>
				<td><input type="password" name="pwd"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="로그인" onclick="send(this.form);">
				</td>
			</tr>
		</table>
		<input id="prevPage" type="hidden" value="${sessionScope.prevPage }"/>
	</form>

</body>
</html>

















