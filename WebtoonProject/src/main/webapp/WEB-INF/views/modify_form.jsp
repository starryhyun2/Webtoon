<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보수정</title>

<script src="/webtoon/resources/js/httpRequest.js"></script>

<script>

	function pwdLength() {
	
		if (document.getElementById("pwd").value.length < 8) {
			document.getElementById("passwdMessage").innerHTML = "<span style='color:red;'>비밀번호를 8자 이상으로 입력 하세요.</span>";
			return false;
		}
		else {
			document.getElementById("passwdMessage").innerHTML = "";
			return true;
		}
 
}

	function send(f){
		
		var user_idx = f.user_idx.value;
		var name = f.name.value;
		var id = f.id.value;
		var pwd = f.pwd.value;
		var email = f.email.value;
		
		
		
		if(name == ''){
			alert("이름은 필수입니다.");
			return;
		}
		
		if(id == ''){
			alert("아이디는 필수입니다.");
			return;
		}
		
		if(pwd == ''){
			alert("비밀번호는 필수입니다.");
			return;
		}
		
		if(email == ''){
			alert("이메일은 필수입니다.");
			return;
		}
		
		
		var url = "modify.do";
		var param = "user_idx="+f.user_idx.value+
					"&name="+f.name.value+
					"&id="+f.id.value+
					"&pwd="+encodeURIComponent(f.pwd.value)+
					"&email="+encodeURIComponent(f.email.value);
		
		sendRequest( url, param, resultFn, "POST")
	}
	
	function resultFn(){
		
		if( xhr.readyState == 4 && xhr.status == 200 ){
			
			var res = xhr.responseText;
			
			if( res == 'no'){
				alert("수정실패");
				return;
			}
			
			alert("수정되었습니다.");
			location.href="list.do";
		}
	}
</script>


</head>
<body>

	<form>
		<input type="hidden" name="user_idx" value="${vo.getUser_idx() }">
		<table border="1" align="center">
			<tr>
				<td>이름 :</td>
				<td><input name="name" value="${vo.getName() }" ></td>
			</tr>
			
			<tr>
				<td>id :</td>
				<td><input name="id" value="${vo.getId() }" readonly></td>
			</tr>
			
			<tr>
				<td>비밀번호 :</td>
				<td><input type = "password" name="pwd" id="pwd" onblur="pwdLength()"><div id="passwdMessage"></div></td>
				
			</tr>
			
			<tr>
				<td>email :</td>
				<td><input name="email" value="${vo.getEmail() }"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정하기" onclick="send(this.form);">
					<input type="button" value="취소" onclick="back(this.form);">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>