<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
				<input type="button" value="내 블로그" onclick="blog(this.form)">
				<input type="button" value="정보 수정" onclick="modify(this.form)">
			</td>
		</tr>
	</table>
</body>
</html>