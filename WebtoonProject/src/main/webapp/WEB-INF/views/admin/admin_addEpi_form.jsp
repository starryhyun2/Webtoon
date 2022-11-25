<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회차추가 페이지</title>

<script>

	function send(f){
		
		const title= f.title.value;
		const author = f.author.value;
		const genre = f.genre.value;
		const info = f.info.value;
		
		
		//유효성 체크
		if(title == ''){
		alert("제목은 필수 입니다.");
		return;
		}
		
		f.action="mainToon_insert.do";
		f.method="post";
		f.submit();
		
	}

</script>


</head>
<body>
 	<h1>회차추가 페이지</h1>
 	
 	<form method="post" enctype="multipart/form-data">
 	
 		<table border="1" align="center">
			<caption><h2> << 새 회차추가 >> 	</h2></caption>
			<tr>
				<th>제목</th>
				<td><input name="title"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input name="author"></td>
			</tr>
			<tr>
				<th>장르</th>
				<td>
					<select name="genre">
	
					    <option value="genre_1"  selected> 액션
					
					    <option value="genre_2"> 개그
					
					    <option value="genre_3"> 판타지
	
					</select>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="10" cols="60" name="info"></textarea>
				</td>
			</tr>
			
			<tr>
				<th>썸네일 첨부</th>
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