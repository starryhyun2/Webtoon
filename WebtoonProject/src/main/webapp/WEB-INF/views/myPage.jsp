<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>



<script>

	function blog(f){
		
		var id = f.id.value;
		
		f.action="blog.do";
		f.method="post";
		f.submit();
	}


	function modify(f){
		
		var pwd = f.pwd.value;
		var c_pwd = prompt("비밀번호를 입력해주세요.");
		
		if(pwd != c_pwd){
			alert("비밀번호가 다릅니다.");
			return;
		}
		
		f.action = "modify_form.do";
		f.method = "post"
		f.submit();
		
	}
</script>
</head>
<body>

	<form>
		<!-- <input type="hidden" name="sessionId" value="${session}">-->
		<table border="1" align="center">
			<tr>
				<td>이름 : </td>
				<td>${ vo.getName() }</td>	
			</tr>
			
			<tr>
				<td>id : </td>
				<td>${ vo.getId() }</td>	
			</tr>
			
			<tr>
				<td>비밀번호 : </td>
				<td>${ vo.getPwd() }</td>	
			</tr>
			
			<tr>
				<td>email : </td>
				<td>${ vo.getEmail() }</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="hidden" value="${ vo.getId() }" name="id">
					<input type="hidden" value="${ vo.getPwd() }" name="pwd">
					<input type="hidden" value="${ vo.getUser_idx() }" name ="idx">
					<input type="button" value="내 블로그" onclick="blog(this.form)">
					<input type="button" value="정보 수정" onclick="modify(this.form)">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>