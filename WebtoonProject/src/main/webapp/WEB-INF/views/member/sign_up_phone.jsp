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

	<script>
		function send(f){
			
			var id = f.id.value;
			var pwd = f.pwd.value;
			var name = f.name.value;
			var email = f.email.value;
			var phonenum f.phonenum.value;
			if( id == '' ){
				alert("아이디를 입력하세요");
				return;
			}
			
			if( pwd == '' ){
				alert("비밀번호를 입력하세요");
				return;
			}
			
			//Ajax로 ID와 PWD를 전달
			var url = "login_check.do";
			var param = "id="+id+"&pwd="+pwd;
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
	<script type="text/javascript">
	  const hypenTel = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}

	</script>
</head>
<body>
<h1>이곳은 휴대폰 회원가입 페이지 입니다.</h1>


	<form>
		<table border="1" align="center" style="width:25%">
			<tr>
				<th>ID : </th>
				<td><input name="id"></td>
			</tr>
			
			<tr>
				<th>PWD : </th>
				<td><input type="password" name="pwd"></td>
			</tr>
			
			<tr>
				<th>이름 : </th>
				<td><input name="name"></td>
			</tr>
			
			<tr>
				<th>PHONE_NUM: </th>
				<td><input type="text" name="phonenum" oninput="hypenTel(this)" maxlength="13"></td>
			</tr>		

			<tr>
				<td colspan="2" align="center">
					<input type="button" value="회원가입" onclick="send(this.form);">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>

















