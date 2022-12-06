<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회차추가 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>

	function send(f){
		
		const episodename= f.episodename.value;
		const ref = f.ref.value;
		
		 

		var imgFile = $('#photo').val();
		var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
		var maxSize = 20 * 1024 * 1024;
		var fileSize;
		//유효성 체크
		if(episodename == ''){
		alert("제목은 필수 입니다.");
		return;
		}
		
		if($('#photo').val() == "") {
			alert("첨부파일은 필수!");
		    $("#photo").focus();
		    return;
		}

		if(imgFile != "" && imgFile != null) {
			fileSize = document.getElementById("photo").files[0].size;
		    
		    if(!imgFile.match(fileForm)) {
		    	alert("이미지 파일만 업로드 가능");
		        return;
		    } else if(fileSize > maxSize) {
		    	alert("파일 사이즈는 20MB까지 가능");
		        return;
		    }
		}
		f.action="addEpi.do";
		f.method="post";
		f.submit();
		
	}

</script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/webtoon/resources/css/common.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Yeon+Sung&display=swap"
	rel="stylesheet">


</head>
<body>

	<div id="total_wrap">
		<h1 id="main_title">
			<a href='mainToon.do'> <img
				src="/webtoon/resources/thumbnail/korea_logo.jpg" /> <span>코리아
					웹툰</span>
			</a>
		</h1>
		<!-- if 문을 위해 var에 check_login 값 설정 -->
		<c:set var="id" value="${sessionScope.id}" />
		<div id="header">
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
	</div>


	<h1 style="text-align:center; margin: 50px 0;">회차추가 페이지</h1>

	<form method="post" enctype="multipart/form-data">

		<table  align="center">

			<tr>
				<th>회차 이름</th>
				<td><input name="episodename"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input name="ref" value="${ ref }" readonly></td>
			</tr>
			<tr>
				<th>썸네일 첨부</th>
				<td><input type="file" name="thumbnail" id="thumbnail"
					accept="image/*"></td>
			</tr>
			<tr>
				<th>회차 첨부</th>
				<td><input type="file" name="photo" id="photo" accept="image/*"
					multiple></td>
			</tr>
			
		</table>
			<div style="text-align:center; margin:30px 0;">
				<input type="button" value="웹툰 업로드"
					onclick="send(this.form)"> <input type="button"
					value="메인화면" onclick="location.href = 'mainToon.do'">
			</div>		
	</form>
</body>
</html>