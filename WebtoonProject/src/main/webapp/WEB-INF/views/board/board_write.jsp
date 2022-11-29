<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script>
		function send_check(f){
			
			var title = f.title.value;
			var id = f.id.value;
			var content = f.content.value.trim();
			var pwd = f.pwd.value.trim();
			
			
			//유효성 체크
			if( title == ''){
				alert("제목은 필수입니다.");
				return;
			}
			if(id == ''){
				alert("이름은 필수입니다.");
				return;
			}
			if( content == ''){
				alert("내용은 한글자 이상 넣어주세요.")
				return;
			}
			if( pwd == ''){
				alert("비밀번호는 필수입니다.")
				return;
			}
			
			f.action = "insert.do";
			f.method = "post";
			f.submit();
			
		}
	
	</script>
</head>
<body>

	<h1 style="width: 300px; margin: 0 auto;">
		<a href='mainToon.do'>코리아 웹툰</a>
	</h1>

<!-- if 문을 위해 var에 check_login 값 설정 -->
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

	<form>
		<table border="1" align="center">
			<tr>
				<th>제목</th>
				<td><input name="title"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input name="id"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" rows="10" cols="60">
					</textarea>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="등록하기" onclick="send_check(this.form)">
				<input type="button" value="취소" onclick="location.href="list.do">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>