<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/webtoon/resources/css/sign_up_form.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
<title>회원가입</title>
</head>
<body>
<div class="wrapper">
<h2 id="sign_up_title" font-size:60px; color:#2B2B2B;">인증 방식</h2>
<form id="sign_up_form">
<table align="center" class="wrap">
<input type="button" value="휴대폰으로 회원가입" class=sign_up_p_e onclick="location.href='sign_up_phone'"/>&nbsp &nbsp &nbsp
<input type="button" value="이메일로 회원가입" class=sign_up_p_e onclick="location.href='sign_up_email'"/>
</table>
</form>

</body>
</html>