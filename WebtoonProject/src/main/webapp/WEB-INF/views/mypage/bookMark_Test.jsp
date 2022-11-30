<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/webtoon/resources/js/httpRequest.js"></script>

<script>


	function send(f){
		
		var ref = f.webtoon_idx.value;
		var user_id = f.user_id.value;
		
		var url = "addBookmark.do";
		var param = "ref="+ref+
					"&user_id="+user_id;

		sendRequest( url, param, resultFn, "GET");

	}
	
	function resultFn(){
			
			if( xhr.readyState == 4 && xhr.status == 200 ){
				
				var bookmark = xhr.responseText;

				if( bookmark == 'no'){
					alert("북마크 삭제되었습니다.");
					return;
				}
				
				alert("북마크 추가되었습니다.");
				
			}
	}
</script>

</head>
<body>

	<!-- 테스트용 화면(홈화면) -->
	<c:forEach var="bm" items="${bm}">
		<form>
			<p>${ bm.info }</p>
			<div>
				<p>
					작성자 : <span>${ bm.author }</span>
				</p>
			</div>
			
			<div>
				<p>
					제목 : <span>${ bm.title }</span>
				</p>
			</div>
			
			<div>
				<p>
					작성일 : <span>${fn:split(bm.regdate,' ')[0]}</span>
				</p>
			</div>
		
			<input type="hidden" name="user_id" value="${user}">	<!-- 임의의 id값을 받아왔지만 session 설정시 session값 받기 -->
			<input type="hidden" name="webtoon_idx" value="${bm.webtoon_idx}">
			<input type="button" id="btn" value="북마크" onclick="send(this.form);">
	</form>
	</c:forEach>

	<input type="button" value="북마크 이동" onclick="location.href='bookmark.do'">
	
</body>
</html>