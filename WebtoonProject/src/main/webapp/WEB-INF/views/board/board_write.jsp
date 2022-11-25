<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script>
		function send_check(f){
			
			var title = f.title.value;
			var name = f.name.value;
			var content = f.content.value.trim();
			var pwd = f.pwd.value.trim();
			
			
			//유효성 체크
			if( title == ''){
				alert("제목은 필수입니다.");
				return;
			}
			if(name == ''){
				alert("이름은 필수입니다.");
				return;
			}
			if( content == ''){
				alert("내용은 한글자 이상 넣어주세요.")
				return;
			}
			if( pwd == ''){
				alert("비밀번호는 필수입니다.")
				return;
			}
			
			f.action = "insert.do";
			f.method = "post";
			f.submit();
			
		}
	
	</script>

</head>
<body>
	<form>
		<table border="1" align="center">
			<tr>
				<th>제목</th>
				<td><input name="title"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input name="name"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" rows="10" cols="60">
					</textarea>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="등록하기" onclick="send_check(this.form)">
				<input type="button" value="취소" onclick="location.href="list.do">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>