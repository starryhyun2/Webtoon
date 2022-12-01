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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
<script>
	var check = false;
	 
	function send(f) {
		var id = f.id.value;
		var pwd = f.pwd.value;
		var name = f.name.value;
		var user_email = f.user_email.value;
		var email_address = f.email_address.value;
		const email = user_email + '@' + email_address;
		if (check == false) {
			alert("아이디 중복체크를 하세요");
			return;
		}
		if (id == '') {
			alert("아이디를 입력하세요");
			return;
		}
		if (pwd == '') {
			alert("비밀번호를 입력하세요");
			return;
		}
		if (name == '') {
			alert("이름은 필수입니다.");
			return;
		}
		if (user_email == '' || email_address == '') {
			alert("이메일은 필수입니다.");
			return;
		}
		showLoading();

		
		//Ajax로 ID와 PWD를 전달
		var url = "sign_check.do";
		var param = "id=" + id + "&pwd=" + pwd + "&name=" + name + "&email="
				+ email;
		sendRequest(url, param, resultFn, "POST");
	}
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			//"{'result':'clear'}"
			var data = xhr.responseText;
			//서버에서 넘어온 데이터를 실제 JSON형식으로 변환
			var json = (new Function('return'+data))();
			if (json.result == 'no_id') {
				hideLoading();
				return;
			} else if (json.result == 'no_pwd') {
				hideLoading();
				return;
			}
			hideLoading();
			location.href = "certifiacion_form";
		}
	}
	function dupli_check(f) {
		
		
		var id = f.id.value;
		if (id == '') {
			alert("아이디를 입력하세요");
			return;
		}
		//로딩 표시 
		showLoading();
		
		//Ajax로 ID와 PWD를 전달
		var url = "login_check.do";
		var param = "id=" + id;
		sendRequest(url, param, resultFn2, "POST");
	}
	function resultFn2() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			//"{'result':'clear'}"
			var data = xhr.responseText;
			//서버에서 넘어온 데이터를 실제 JSON형식으로 변환
			var json = (new Function('return' + data))();
			if (json.result == 'no_pwd') {
				alert("아이디가 존재합니다.");
				check = false;
				
				hideLoading();
				return;
			} else {
				alert("이용가능한 아이디입니다.");
				check = true;
				document.getElementById('idBox').readOnly = true;
				
				hideLoading();
				return;
			}
		}
	}
	
</script>


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

<script>
const loading = document.getElementById('roadingStatus');
 
function clickedBtn(){ 
	// 로딩 표시 
	showLoading(); 
	// 로딩 숨기기(2초 후) 
	setTimeout("hideLoading()", 2000); 
} 

function showLoading(){ 
	//화면의 높이와 너비를 구합니다. 
	var maskHeight = $(document).height(); 
	var maskWidth = window.document.body.clientWidth; 
	//화면에 출력할 마스크를 설정해줍니다. 
	var mask ="<div id='mask' style='position:absolute; z-index:1000; background-color:#000000; left:0; top:0;'></div>"; 
	//화면에 레이어 추가 
	$('body') .append(mask) 
	//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다. 
	$('#mask').css({ 'width' : maskWidth ,'height': maskHeight ,'opacity' :'0.3' }); 
	$("#roadingStatus").show(); 
} 

function hideLoading(){ 
	$("#mask").remove(); 
	$("#roadingStatus").hide(); 
}
</script>
</body>
</html>