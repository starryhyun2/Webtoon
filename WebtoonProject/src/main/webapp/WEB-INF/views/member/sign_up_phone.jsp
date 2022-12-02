<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Ajax사용을 위한 js를 추가 -->
<script src="/webtoon/resources/js/httpRequest.js"></script>

<!-- 기능 구현을 위한 외부 스크립트 링크 -->
<script src="/webtoon/resources/js/sign_up_phone.js"></script>
</head>
<body>
	<h1>이곳은 휴대폰 회원가입 페이지 입니다.</h1>


	<form>
		<table border="1" align="center" style="width: 25%">
			<tr>
				<th>ID :</th>
				<td><input id="idBox" name="id"></td>
				<td><input type="button" value="중복체크"
					onclick="dupli_check(this.form)"></td>
			</tr>

			<tr>
				<th>PWD :</th>
				<td><input type="password" name="pwd"></td>
			</tr>

			<tr>
				<th>이름 :</th>
				<td><input name="name"></td>
			</tr>

			<tr>
				<th>PHONE_NUM:</th>
				<td><input type="text" name="phonenum" oninput="hypenTel(this)"
					maxlength="13"></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="button"
					value="회원가입" onclick="send(this.form);"></td>
			</tr>
		</table>
	</form>

</body>
</html>