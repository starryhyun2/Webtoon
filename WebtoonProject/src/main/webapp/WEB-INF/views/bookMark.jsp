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
		var param = "ref="+f.webtoon_idx.value+
					"&user_id="+f.user_id.value;

		sendRequest( url, param, resultFn, "POST");

	}
	
	function resultFn(){
			
			if( xhr.readyState == 4 && xhr.status == 200 ){
				
				var bookmark = xhr.responseText;
				alert("bookmark");
				if( bookmark == 'no'){
					alert("삭제되었습니다");
					return;
				}
				
				alert("북마크 추가되었습니다.");
				location.href="bookmark.do";
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
			
			<div>
				<p>
					user_idx : <span>${user}</span>
				</p>
			</div>
			
			<div>
				<p>
					webtoon_idx: <span>${bm.webtoon_idx}</span>
				</p>
			</div>
		
			<input type="hidden" name="user_idx" value="${user}">
			<input type="hidden" name="webtoon_idx" value="${bm.webtoon_idx}">
			<input type="button" value="북마크" onclick="send(this.form);">
	</form>
	</c:forEach>
</body>
</html>