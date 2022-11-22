<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form>
		<h1>어서오세요</h1><br>
		<h1>${ vo.getName() }님의 블로그입니다.</h1><br><br>
		
		<div id="main_box">
			<h1>:::방명록 리스트:::</h1>
		
			<div align="center">
				<input type="button" value="글쓰기"
			       onclick="location.href='insert_form.do'">
			</div>
		</div>
	
		<c:forEach var="vo" items="${ list }">
			<div class="visit_box">
				<div class="type_content"><pre>${ vo.content }</pre><br>
					<!-- 첨부된 이미지가 있는 경우에만 img태그를 보여주자!
					<c:if test="${ vo.filename ne 'no_file' }">
						<img src="/vs/resources/upload/${ vo.filename }" width="200"/>
					</c:if> -->
				</div>
			
			<div class="type_name">${ vo.name }(${vo.idx})</div>
			<div class="type_regdate">작성일 : ${ vo.regdate }</div>
			
			<form>
				<input type="hidden" name="idx" value="${ vo.idx }">
				<input type="hidden" name="pwd" value="${ vo.pwd }">
				비밀번호 : <input type="password" name="c_pwd">
				<input type="button" value="수정" onclick="modify(this.form);">
				<input type="button" value="삭제" onclick="del(this.form);">
			</form>
			</div>
		</c:forEach>
		
	</form>
</body>
</html>