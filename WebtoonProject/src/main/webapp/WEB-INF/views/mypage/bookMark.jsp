<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북마크</title>

<script src="/webtoon/resources/js/httpRequest.js"></script>

<script>
	function send(f){
		
		
		var ref = f.webtoon_idx.value;
		var user_id = f.user_id.value;
		
		var url = "addBookmark.do";
		var param = "ref="+ref+
					"&user_id="+user_id;

		sendRequest( url, param, resultFn, "POST");
	
		alert("삭제되었습니다.");
		window.location.reload();
	}
	
	function resultFn(){
			
			if( xhr.readyState == 4 && xhr.status == 200 ){
				
				var bookmark = xhr.responseText;
				
				if( bookmark == 'no'){
					return;
				}
				
			}
			
			
	}
</script>
</head>
<body>

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
		
			<input type="hidden" name="user_id" value="${user}">
			<input type="hidden" name="webtoon_idx" value="${bm.webtoon_idx}">
			<input type="button" value="북마크" onclick="send(this.form);">
	</form>
	</c:forEach>
</body>
</html>