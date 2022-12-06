<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="/webtoon/resources/css/common.css">
<link rel="stylesheet" href="/webtoon/resources/css/myPage.css">
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

	function modify_email(f) {
		var email = f.email.value;

		if (email == '') {
			alert("이메일를 입력하세요.");
			check = false;
			return;
		}
		var url = "modify_email_phone.do";
		var param = "&email=" + email;

		sendRequest(url, param, email_resultFn, "POST")

	}

	function modify_phone(f) {
		var phonenum = f.phonenum.value;

		if (phonenum == '') {
			alert("휴대폰 번호를 입력하세요.");
			check = false;
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
			document.getElementById("c_email").innerHTML = "<input type='text' id='r_email'>"
					+ " <input type='button' value='인증하기' onclick='check_email_key();'>";
			check = false;

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
			document.getElementById("c_phone").innerHTML = "<input type='text' id='r_phone'>"
					+ " <input type='button' value='인증하기' onclick='check_phone_key();'>";
			check = false;

			return check;
		}
	}

	function check_email_key() {

		var Key = document.getElementById("r_email").value;

		//Ajax로 ID와 PWD를 전달
		var url = "myKey_check.do";
		var param = "Key=" + Key;
		sendRequest(url, param, result_check, "POST");

	}

	function result_check() {

		if (xhr.readyState == 4 && xhr.status == 200) {
			//"{'result':'clear'}"
			var data = xhr.responseText;

			//서버에서 넘어온 데이터를 실제 JSON형식으로 변환
			var json = (new Function('return' + data))();
			if (json.result == 'false') {
				alert("일치하지 않습니다.");
				return;

			}
			alert("인증 성공!");
			document.getElementById("c_email").innerHTML = "";
			check = true;

			return check;
		}
	}

	function check_phone_key() {

		var r_email = document.getElementById("r_phone").value;

		if (r_email != "bbbb") {
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

		if (check == false) {
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
		var param = "user_idx=" + f.user_idx.value + "&name=" + f.name.value
				+ "&id=" + f.id.value + "&pwd="
				+ encodeURIComponent(f.pwd.value) + "&email="
				+ encodeURIComponent(f.email.value) + "&phonenum="
				+ f.phonenum.value;

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
			location.href = "list.do";
		}
	}
</script>


</head>
<body>
	<div id="total_wrap">
		<div id="first">
			<!-- if 문을 위해 var에 check_login 값 설정 -->

			<h1 id="main_title">
				<a href='mainToon.do'> <img
					src="/webtoon/resources/thumbnail/korea_logo.jpg" /> <span>코리아
						웹툰</span>
				</a>
			</h1>

		</div>

		<div id="page_name" style="text-align: center; margin: 20px 0;">
			<h1>개인정보 수정</h1>
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
						<td class="menu2"><input name="id" class="modify"
							placeholder="${vo.getId() }" readonly></td>
						<!-- id는 수정불가 -->
					</tr>

					<tr>
						<td class="menu">비밀번호</td>
						<td class="menu2"><input type="password" name="pwd" id="pwd"
							class="modify" value="${vo.getPwd() }" onblur="pwdLength()">
							<div id="passwdMessage"></div></td>
						<!-- pwd 수정시 포커스가 사라질때 pwdLength() 호출 후, 조건에 맞는 passWdMessage 출력 -->
					</tr>

					<tr>
						<td class="menu">Email</td>
						<td class="menu2"><input name="email" class="modify"
							value="${vo.getEmail() }"> <input type="button"
							value="수정" onclick="modify_email(this.form);">
							<div id="c_email"></div></td>
					</tr>

					<tr>
						<td class="menu">Phone</td>
						<td class="menu2"><input name="phonenum" class="modify"
							value="${vo.getPhonenum() }"> <input type="button"
							value="수정" onclick="modify_phone(this.form);">
							<div id="c_phone"></div>
					</tr>

				</table>

				<div class="table_btn">
					<input type="button" value="수정하기" onclick="send(this.form);">
					<input type="button" value="취소" onclick="location.href='list.do'">
				</div>
			</form>
		</div>
	</div>
	
						<!-- 부트스트랩 JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>