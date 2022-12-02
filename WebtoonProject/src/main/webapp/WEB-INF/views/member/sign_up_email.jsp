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

<!-- 이메일을 합치기 위해 끌어오는 jquery문 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 유효성 검사 및 기능들을 사용하기 위한 내부 스크립트 -->
<script src="/webtoon/resources/js/sign_up_email.js"></script>

<!-- 이메일 송신 로딩 시간이 너무 오래 걸려서 로딩바 추가 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style>
	.spinner-border{
	position: absolute; 
	top: 50%; 
	left: 50%; 
	z-index: 1; 
	width: 3rem; 
	height: 3rem;
}
</style>

</head>
<body>
	<h1>이곳은 이메일 회원가입 페이지 입니다.</h1>

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
				<th>EMAIL:</th>
				<td><input type="text" name="user_email" required><span>@</span>
					<input type="text" name="email_address" list="user_email_address">
					<datalist id="user_email_address">
						<option value="naver.com"></option>
						<option value="daum.com"></option>
						<option value="gmail.com"></option>
						<option value="직접입력"></option>
					</datalist> <input type="hidden" name="email" value=""></td>
			</tr>


			<tr>
				<td colspan="2" align="center"><input type="button"
					value="회원가입" onclick="send(this.form);" /></td>
			</tr>
		</table>
	</form>
	
	<div class="spinner-border roadingStatus" id="roadingStatus" role="status" style="display: none;"> 
		<span class="sr-only">Loading...</span>
	</div>

</body>
</html>