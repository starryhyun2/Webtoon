<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회차추가 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>

	function send(f){
		
		const episodename= f.episodename.value;
		const ref = f.ref.value;
		
		 

		var imgFile = $('#photo').val();
		var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
		var maxSize = 20 * 1024 * 1024;
		var fileSize;
		//유효성 체크
		if(episodename == ''){
		alert("제목은 필수 입니다.");
		return;
		}
		
		if($('#photo').val() == "") {
			alert("첨부파일은 필수!");
		    $("#photo").focus();
		    return;
		}

		if(imgFile != "" && imgFile != null) {
			fileSize = document.getElementById("photo").files[0].size;
		    
		    if(!imgFile.match(fileForm)) {
		    	alert("이미지 파일만 업로드 가능");
		        return;
		    } else if(fileSize > maxSize) {
		    	alert("파일 사이즈는 20MB까지 가능");
		        return;
		    }
		}
		f.action="addEpi.do";
		f.method="post";
		f.submit();
		
	}

</script>


</head>
<body>
	<h1 style="width: 300px; margin: 0 auto;"><a href='mainToon.do'>코리아 웹툰</a></h1>


 	<h1>회차추가 페이지</h1>
 
 	<form method="post" enctype="multipart/form-data">
 	
 		<table border="1" align="center">
			<caption><h2> << 새 회차추가 >> 	</h2></caption>
			<tr>
				<th>회차 이름</th>
				<td><input name="episodename"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input name="ref" value="${ ref }" readonly></td>
			</tr>
			<tr>
				<th>썸네일 첨부</th>
				<td><input type="file" name="thumbnail" id="thumbnail" accept="image/*"></td>
			</tr>
			<tr>
				<th>회차 첨부</th>
				<td><input type="file" name="photo" id="photo" accept="image/*" multiple></td>
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