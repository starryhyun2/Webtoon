<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webtoon/resources/css/loginForm.css">


	<!-- Ajax사용을 위한 js를 추가 -->
	<script src="/webtoon/resources/js/httpRequest.js"></script>

	<script>
		function send(f){
			
			var id = f.id.value;
			var pwd = f.pwd.value;
			var prevPage = f.prevPage.value;
			
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
			
			
			location.href = prevPage;
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
			}
			
		}
		
	</script>
</head>
<body>
로그인 페이지<br>

	<form>
		<table border="1" align="center">
			<tr>
				<th>ID : </th>
				<td><input name="id"></td>
			</tr>
			
			<tr>
				<th>PWD : </th>
				<td><input type="password" name="pwd"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="로그인" onclick="send(this.form);">
				</td>
			</tr>
		</table>
		<input name="prevPage" type="hidden" value="${sessionScope.prevPage }"/>
	</form>

</body>
</html>

















