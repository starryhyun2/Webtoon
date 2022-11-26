<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function modify(f){
		var name = f.name.value;
		var id = f.id.value;
		var pwd = f.pwd.value;
		var email = f.email.value;
		var phone = f.phone.value;
		
		f.action = "member.do";
		f.method = "post";
		f.submit();
	}
</script>
</head>
<body>

	<form>
		<table border="1" align="center">
			<tr>
				<td>이름 :</td>
				<td><input name="name"></td>	
			</tr>
			
			<tr>
				<td>ID :</td>
				<td><input name="id"></td>	
			</tr>
			
			<tr>
				<td>pwd :</td>
				<td><input name="pwd"></td>	
			</tr>
			
			<tr>
				<td>email :</td>
				<td><input name="email"></td>	
			</tr>
			
			<tr>
				<td>Phone :</td>
				<td><input name="phone"></td>	
			</tr>
				
			<tr>
				<td colspan="2">
					<input type="button" value="회원가입" onclick="modify(this.form);">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>