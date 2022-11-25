<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Ajax 사용을 위한 js를 로드 -->
	<script src="/webtoon/resources/js/httpRequest.js"></script>

	<script>
	
		function reply_send(cb){
			
			const name = cb.name.value;
			const content = cb.content.value.trim();
			
			//유효성 체크
			
			if(name == ''){
				alert("이름은 필수입니다.");
				return;
			}
			if( content == ''){
				alert("내용은 한글자 이상 넣어주세요.");
				return;
			}
		
			
			cb.action = "reply_insert.do";
			//cb.method = "post";
			cb.submit();
			
		}
			
		
		function del(){
			
			//form태그 검색
			var f = document.getElementById("ff");
	
		
			if( !confirm("삭제하시겠습니까?") ){
				return;
			}
			
			// 삭제를 위한 게시글을 idx를 DB로 전달
			
			var url = "del.do";
			var param = "idx=${vo.idx}";
			sendRequest(url, param, resultFn, "post");
			
		}
		
		function resultFn(){
			
			if(xhr.readyState == 4 && xhr.status == 200){
				
				//"no" or "yes"
				var data = xhr.responseText;
				
				if( data == 'no'){
					
					alert("삭제 실패");
					return;
				}
				
				alert("삭제 성공");
				location.href="list.do";
				
			}
			
		}
	
	</script>

</head>
<body>
	<form id="ff">
		<table border="1" align="center" width="80%">
			<caption><h2> ::: 상세보기 :::</h2></caption>
			
			<tr>
				<td>제목</td>
				<td>${vo.title}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${vo.name}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${vo.regdate}</td>
			</tr>
			<tr style="height:400px;">
				<td>내용</td>
				<td><pre>${vo.content}</pre></td>
			</tr>
			
			<tr>
				<td colspan="2">
						<input type="button" value="목록 보기" onclick="location.href='list.do'">			
						<input type="button" value="삭제" onclick="del();">
				</td>
			</tr>
			
		</table>
	
	</form>
	
	<form  id = "cb">
	<table border="1" align="center" width="80%">
			<tr>
				<td colspan="4">
					<input type="text" name="name" placeholder="아이디" style="width:10%">
					<input type="text" name="content" placeholder="댓글 쓰기" style="width:70%">
					<input type="button" value="댓글" onclick="reply_send(this.form);">
				</td>
			</tr>
		
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>내용</th>
		</tr>
		
		<c:forEach var="cb" items="${cb_list}">
			<tr>
				<td>${cb.idx}</td>
				<td>${cb.name}</td>
				<td align="center">${cb.regdate }</td>
				
				<!-- 댓글 들여쓰기 -->
				<td>
				
				<c:if test="${cb.del_info eq 0}">
					${cb.content}
				</c:if>
				
				<c:if test="${cb.del_info ne 0}">
				
					<font>${cb.content}</font>
					
				</c:if>
				
									
				</td>
				
			</tr>
		</c:forEach>
	
	</table>
	</form>
	
</body>
</html>