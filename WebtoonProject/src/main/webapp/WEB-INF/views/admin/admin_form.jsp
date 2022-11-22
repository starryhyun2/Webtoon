<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_page</title>

<script>

	function send(f){
		
		const name= f.name.value;
		const content = f.content.value;
		const pwd = f.pwd.value;
		
		//유효성 체크
		if(name == ''){
		alert("이름은 필수 입니다.");
		return;
		}
		
		f.action="mainToon_insert.do";
		f.method="post";
		f.submit();
		
	}

</script>


</head>
<body>
 	<h1>관리자 페이지</h1>
 	
 	<form method="post" enctype="multipart/form-data">
 	
 		<table border="1" align="center">
			<caption><h2> << 새 메인 웹툰 추가 >> 	</h2></caption>
			
			<tr>
				<th>작성자</th>
				<td><input name="name"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="10" cols="60" name="content"></textarea>
				</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd">
				</td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td><input type="file" name="photo"></td>
			</tr>
			<tr>
				<td>
					<input type="button" value="웹툰 업로드" onclick="send(this.form)">
					<input type="button" value="메인화면" onclick="location.href = 'mainToon.do'">
				</td>
			</tr>
			 		
 		</table>
 	
 	</form>
 	
</body>
</html>