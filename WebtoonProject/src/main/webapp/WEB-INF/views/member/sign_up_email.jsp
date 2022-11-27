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
<script>	

//이메일주소 가져오기
$("#user_email").blur(function(){
	email();	
})

$("#email_address").change(function(){
	email();	
})

function email() {
	const email = $("#user_email").val();
	const middle = $("#middle").text();
	const address = $("#email_address").val();

	if(email != "" && address != "") {
		$("#totalemail").val(email+middle+address);
	}else{
		alert('이메일은 필수입니다');
		return;
	}
}

</script>

<script>
		function send(f){
			
			var id = f.id.value;
			var pwd = f.pwd.value;
			var name = f.name.value;
			var email = f.name.value;
			if( id == '' ){
				alert("아이디를 입력하세요");
				return;
			}
			
			if( pwd == '' ){
				alert("비밀번호를 입력하세요");
				return;
			}
			
			if( name ==''){
				alert("이름은 필수입니다.");
				return;
			}
			
			
			//Ajax로 ID와 PWD를 전달
			var url = "sign_check.do";
			var param = "id="+id+"&pwd="+pwd+"&name="+name+"&email="+email;
			sendRequest(url, param, resultFn, "POST");
			
		}
		
		function resultFn(){
			
			if( xhr.readyState == 4 && xhr.status == 200 ){
				//"{'result':'clear'}"
				var data = xhr.responseText;
				
				//서버에서 넘어온 데이터를 실제 JSON형식으로 변환
				var json = (new Function('return'+data))();
				
				if( json.result == 'no_id' ){
					alert("아이디가 존재하지 않습니다");
					return;
					
				}else if( json.result == 'no_pwd' ){
					alert("비밀번호 불일치");
					return;
				}
				
				alert("로그인 성공");
				location.href="mainToon.do";
			}
			
		}
	</script>
</head>
<body>
	<h1>이곳은 이메일 회원가입 페이지 입니다.</h1>
	<c:choose>
		<c:when test="${var eq 'admin' }">
			<input id="logout_btn" type="button" value="로그아웃"
				onclick="location.href='logout.do'">
			<input id="admin_btn" type="button" value="관리자 페이지"
				onclick="location.href='admin_form.do'">
		</c:when>

		<c:when test="${var eq 'false' }">
			<input id="login_btn" type="button" value="로그인"
				onclick="location.href='login_form'">
			<input id="sign_up_btn" type="button" value="회원가입"
				onclick="location.href='sign_up_form'">
		</c:when>

		<c:when test="${var eq null }">
			<input id="login_btn" type="button" value="로그인"
				onclick="location.href='login_form'">
			<input id="sign_up_btn" type="button" value="회원가입"
				onclick="location.href='sign_up_form'">
		</c:when>

		<c:otherwise>

			<input id="logout_btn" type="button" value="로그아웃"
				onclick="location.href='logout.do'">
			<input id="Mypage_btn" type="button" value="My 페이지"
				onclick="location.href='Mypage'">
		</c:otherwise>
	</c:choose>
	<form>
		<table border="1" align="center" style="width: 25%">
			<tr>
				<th>ID :</th>
				<td><input name="id"></td>
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
				<td><input type="text" id="user_email" required><span
					id="middle">@</span><input type="text" id="email_address"
					list="user_email_address"> <datalist
						id="user_email_address">
						<option value="naver.com"></option>
						<option value="daum.com"></option>
						<option value="google.com"></option>
						<option value="직접입력"></option>
					</datalist> <input type="hidden" id="totalemail" name="email" value="">
					</td>
			</tr>


			<tr>
				<td colspan="2" align="center"><input type="button"
					value="회원가입" onclick="send(this.form);"></td>
			</tr>
		</table>
	</form>

</body>
</html>

















