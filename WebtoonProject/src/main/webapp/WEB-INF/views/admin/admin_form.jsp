<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_page</title>

<script>

	function send(f){
		
		const title= f.title.value;
		const author = f.author.value;
		const genre = f.genre.value;
		const info = f.info.value;
		const epipath = f.epipath.value;
		const author_idx = f.author_idx.value;
		
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
 	<h1>관리자 페이지</h1>
 		<!-- if 문을 위해 var에 check_login 값 설정 -->
	<h1 style="width: 300px; margin: 0 auto;"><a href='mainToon.do'>코리아 웹툰</a></h1>

 	<form method="post" enctype="multipart/form-data">
 	
 		<table border="1" align="center">
			<caption><h2> << 새 메인 웹툰 추가 >> 	</h2></caption>
			<tr>
				<th>작품제목</th>
				<td><input name="title"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input name="author">&nbsp<input type="number" name="author_idx"></td>
			</tr>
			<tr>
				<th>파일 이름</th>
				<td><input name="epipath"></td>
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