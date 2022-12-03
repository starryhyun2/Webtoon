<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>

<link rel="stylesheet" href="/webtoon/resources/css/webtoon.css">
<script src="/webtoon/resources/js/httpRequest.js"></script>

<script>
	var check = true;
	var pwd_check = true;
	
	function pwdLength() { // pwd의 길이 유효성검사

		if (document.getElementById("pwd").value.length < 8) { // pwd 길이가 8자리 미만이라면
			document.getElementById("passwdMessage").innerHTML = "<span style='color:red;'>비밀번호를 8자 이상으로 입력 하세요.</span>";
			pwd_check = false;
			return;
		} else {
			document.getElementById("passwdMessage").innerHTML = "";
			pwd_check = true;
			return;
		}
		
		return pwd_check;
	}

	function email_check(f) {
		var email = f.email.value;
		
		if (email == '') {
			alert("이메일를 입력하세요.");
			check=false;
			return;
		}
		var url = "modify_email_phone.do";
		var param = "&email=" + email;

		sendRequest(url, param, email_resultFn, "POST")

	}

	function phone_check(f) {
		var phonenum = f.phonenum.value;
		
		if (phonenum == '') {
			alert("휴대폰 번호를 입력하세요.");
			check=false;
			return;
		}
		var url = "modify_email_phone.do";
		var param = "&phonenum=" + phonenum;

		sendRequest(url, param, phone_resultFn, "POST")

	}

	function email_resultFn() {

		if (xhr.readyState == 4 && xhr.status == 200) {

			var res = xhr.responseText;

			if (res == 'no') {
				alert("메시지 발송 실패");
				return;
			}

			alert("메시지가 발송되었습니다.");
			document.getElementById("c_email").innerHTML = "<input type='text' id='r_email'>"+
															" <input type='button' value='인증하기' onclick='check_email();'>";
			check=false;
			
			return check;
		}
	}
	
	function phone_resultFn() {

		if (xhr.readyState == 4 && xhr.status == 200) {

			var res = xhr.responseText;

			if (res == 'no') {
				alert("메시지 발송 실패");
				return;
			}

			alert("메시지가 발송되었습니다.");
			document.getElementById("c_phone").innerHTML = "<input type='text' id='r_phone'>"+
															" <input type='button' value='인증하기' onclick='check_phone();'>";
			check=false;
			
			return check;
		}
	}

	function check_email(){

		var r_email = document.getElementById("r_email").value;

		if(r_email != "aaaa"){
			alert("인증번호가 다릅니다.");
			return;
		}
		
		alert("인증 성공!");
		document.getElementById("c_email").innerHTML = "";
		check = true;
		
		return check;
	}
	
	function check_phone(){

		var r_email = document.getElementById("r_phone").value;

		if(r_email != "bbbb"){
			alert("인증번호가 다릅니다.");
			return;
		}
		
		alert("인증 성공!");
		document.getElementById("c_phone").innerHTML = "";
		check = true;
		
		return check;
	}
	
	function send(f) {
		
		var user_idx = f.user_idx.value;
		var name = f.name.value;
		var id = f.id.value;
		var pwd = f.pwd.value;
		var email = f.email.value;
		var phonenum = f.phonenum.value;

		if (check == false){
			alert('인증이 완료되지 않았습니다');
			return;
		}
		
		if (name == '') {
			alert("이름은 필수입니다.");
			f.name.focus();
			return;
		}

		if (pwd == '' || pwd_check == false) {
			alert("비밀번호가 잘못되었습니다.");
			f.pwd.focus();
			return;
		}

		if (email == '' && phonenum == '') {
			alert("이메일 또는 휴대폰 번호를 입력하세요.");
			return;
		}
		
		var url = "modify.do";
		var param = "user_idx=" + user_idx + 
					"&name=" + name +
					"&id=" + id+ 
					"&pwd=" + encodeURIComponent(f.pwd.value) + 
					"&email="+ encodeURIComponent(f.email.value) + 
					"&phonenum="+ phonenum;

		sendRequest(url, param, resultFn, "POST")
	}

	function resultFn() {

		if (xhr.readyState == 4 && xhr.status == 200) {

			var res = xhr.responseText;

			if (res == 'no') {
				alert("수정실패");
				return;
			}

			alert("수정되었습니다.");
			location.href = "Mypage";
		}
	}
</script>


</head>
<body>

	<div id="page_name">
		<h1>::: 개인정보 수정 :::</h1>
	</div>

	<div class="box">
		<form>
			<input type="hidden" name="user_idx" value="${vo.getUser_idx() }">
			<!-- Controller로 전달하는 값을 idx로 할지 id로 할지 아직 못정해서 혹시몰라 넣어놨습니다. -->
			<table align="center">
				<tr>
					<td class="menu">이름</td>
					<td class="menu2"><input name="name" class="modify"
						value="${vo.getName() }"></td>
				</tr>

				<tr>
					<td class="menu">ID</td>
					<input type="hidden" name="id" value="${vo.getId()} ">
					<td class="menu2"><input class="modify"
						placeholder="${vo.getId()}" readonly></td>
					<!-- id는 수정불가 -->
				</tr>

				<tr>
					<td class="menu">비밀번호</td>
					<td class="menu2"><input type="password" name="pwd" id="pwd"
						class="modify" value="${vo.getPwd() }" onblur="pwdLength()">
						<div id="passwdMessage"></div>
					</td>
					<!-- pwd 수정시 포커스가 사라질때 pwdLength() 호출 후, 조건에 맞는 passWdMessage 출력 -->
				</tr>

				<tr>
					<td class="menu">Email</td>
					<td class="menu2"><input name="email" class="modify"
						value="${vo.getEmail() }">
						<input type="button" value="수정" onclick="email_check(this.form);">
						<div id="c_email"></div>
					</td>
				</tr>

				<tr>
					<td class="menu">Phone</td>
					<td class="menu2"><input name="phonenum" class="modify"
						value="${vo.getPhonenum() }">
						<input type="button" value="수정" onclick="phone_check(this.form);">
						<div id="c_phone"></div>

				</tr>

				<tr>
					<td colspan="2" align="center" class="button"><input
						type="button" value="수정하기" onclick="send(this.form);"> <input
						type="button" value="취소" onclick="location.href='mypage'">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>