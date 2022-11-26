<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function login(f){
		var id = f.name.value;
		var pwd = f.pwd.value;
		
		f.action = "mypage.do";
		f.method = "post";
		f.submit();
	}
</script>
</head>
<body>

	<form>
		<table border="1" align="center">
			<tr>
				<th>id : </th>
				<td><input type="text" name="id"/></td>
			</tr>
			
			<tr>
				<th>pwd : </th>
				<td><input type="text" name="pwd"/></td>
			</tr>
			
			<tr>
				<td colspan ="2">
					<input type="button" value="로그인" onclick="login(this.form);">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>