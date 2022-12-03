<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>

<script src="/webtoon/resources/js/httpRequest.js" defer></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="/webtoon/resources/css/common.css">
<link rel="stylesheet" href="/webtoon/resources/css/myPage.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Yeon+Sung&display=swap"
	rel="stylesheet">

<script>
	var check = true;
	
	function check(){
		
		check = false;
	}
	
	function pwdLength() { // pwd의 길이 유효성검사

		if (document.getElementById("pwd").value.length < 8) { // pwd 길이가 8자리 미만이라면
			document.getElementById("passwdMessage").innerHTML = "<span style='color:red;'>비밀번호를 8자 이상으로 입력 하세요.</span>";
			return false;
		} else {
			document.getElementById("passwdMessage").innerHTML = "";
			return true;
		}

	}

	function email_check(f) {
		var email = f.email1.value +"@" + f.email2.value;

		if (email == '') {
			alert("이메일를 입력하세요.");
			return;
		}
		var url = "modify_email_phone.do";
		var param = "&email=" + email;

		sendRequest(url, param, modi_resultFn, "POST")

	}

	function phone_check(f) {
		var phonenum = f.phonenum1.value + "-" + f.phonenum2.value + "-" + f.phonenum3.value;
		console.log(phonenum);

		if (phonenum == '') {
			alert("휴대폰 번호를 입력하세요.");
			return;
		}
		var url = "modify_email_phone.do";
		var param = "&phonenum=" + phonenum;

		sendRequest(url, param, modi_resultFn, "POST")

	}

	function modi_resultFn() {

		if (xhr.readyState == 4 && xhr.status == 200) {

			var res = xhr.responseText;

			if (res == 'no') {
				alert("메시지 발송 실패");
				return;
			}

			alert("메시지가 발송되었습니다.");
			check = true;

		}
	}

	function send(f) {

		var user_idx = f.user_idx.value;
		var name = f.name.value;
		var id = f.id.value;
		var pwd = f.pwd.value;
		var email = f.email1.value +"@" + f.email2.value;
		var phonenum = f.phonenum1.value + "-" + f.phonenum2.value + "-" + f.phonenum3.value;

		if (check == false){
			alert('이메일 인증 후 바꾸세요');
			return;
		}
		
		if (name == '') {
			alert("이름은 필수입니다.");
			return;
		}

		if (pwd == '') {
			alert("비밀번호는 필수입니다.");
			return;
		}

		if (email == '' && phonenum == '') {
			alert("이메일 또은 휴대폰 번호를 입력하세요.");
			return;
		}

		var url = "modify.do";
		var param = "user_idx=" + f.user_idx.value + "&name=" + f.name.value
				+ "&id=" + f.id.value + "&pwd="
				+ encodeURIComponent(f.pwd.value) + "&email="
				+ encodeURIComponent(f.email1.value +"@" + f.email2.value) + "&phonenum="
				+ f.phonenum1.value + "-" + f.phonenum2.value + "-" + f.phonenum3.value;

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

	<div id="page_name" style="text-align:center; margin:20px 0;">
			<h1>마이페이지</h1>
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
					<td class="menu2">
					<input name="email1" class="modify" id="email_1"
						  onblur="check()">&nbsp;@&nbsp;<input name="email2" type="text"  id="email_2">
					</td>

					<td  style="border:0;"><input type="button" value="수정하기"
						onclick="email_check(this.form);"><br>
						<input type="button" value="인증하기"></td>
				</tr>

				<tr>
					<td class="menu">Phone</td>
					<td class="menu2" class="modify">
					<input name="phonenum1" id="phoneNum_1" style="width:20%">-
					<input name="phonenum2" type="text" id="phoneNum_2" style="width:20%">-
					<input name="phonenum3" type="text" id="phoneNum_3" style="width:20%"></td>
						
						
					<td style="border:0;"><input type="button" value="수정하기"
						onclick="phone_check(this.form);"><br>
						<input type="button" value="인증하기"></td>
				</tr>					
			</table>
			<div class="table_btn">
				<input type="button" value="수정하기" onclick="send(this.form);"> 
				<input type="button" value="취소" onclick="location.href='list.do'">
			</div>
		</form>
	</div>
<script type="text/javascript">

//spliceEmail

document.getElementById("email_1").value = String("${vo.getEmail()}").split("@")[0];
document.getElementById("email_2").value = String("${vo.getEmail()}").split("@")[1];

//splicePhonenum

document.getElementById("phoneNum_1").value = String("${vo.getPhonenum() }").split("-")[0];
document.getElementById("phoneNum_2").value = String("${vo.getPhonenum() }").split("-")[1];
document.getElementById("phoneNum_3").value = String("${vo.getPhonenum() }").split("-")[2];

</script>

</body>
</html>