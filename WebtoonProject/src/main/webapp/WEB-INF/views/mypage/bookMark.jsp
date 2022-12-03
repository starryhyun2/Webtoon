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


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
	
	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Yeon+Sung&display=swap"
	rel="stylesheet">
	

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
		
	<h1>:::북마크:::</h1>
	<div class="container text-center tab_2">
		<div class="row">
			<c:forEach var="bm" items="${bm}">
				<div class="col-4 mt_box">
					<div class="wrap">
						<a href="show?idx=${ bm.webtoon_idx }"> <!-- 첨부된 이미지가 있는 경우에만 img태그를 보여주자! -->
							<c:if test="${mt.filename ne 'no_file'}">
								<img src="/webtoon/resources/upload/${mt.filename}"
									width="100%" class="box-con" />
							</c:if>
													
							<p>
								<span class="author">${ bm.author }</span>&nbsp;/&nbsp; <span
									class="title">${ bm.title }</span>
							</p>
						</a>
						<form>
							<input type="hidden" name="user_id" value="${user}">
							<input type="hidden" name="webtoon_idx" value="${bm.webtoon_idx}">
							<input type="button" value="북마크" onclick="send(this.form);">
						</form>	
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	
	<h1>:::웹툰 추천:::</h1>
	<div class="container text-center tab_2">
		<div class="row">
			<c:forEach var="rc" items="${rc}">
				<div class="col-4 mt_box">
					<div class="wrap">
							<a href="show?idx=${ rc.webtoon_idx }"> <!-- 첨부된 이미지가 있는 경우에만 img태그를 보여주자! -->
								<c:if test="${rc.filename ne 'no_file'}">
									<img src="/webtoon/resources/upload/${rc.filename}"
										width="100%" class="box-con" />
								</c:if>
														
								<p>
									<span class="author">${ rc.author }</span>&nbsp;/&nbsp; <span
										class="title">${ rc.title }</span>
								</p>
							</a>
					</div>
				</div>
				</c:forEach>
		</div>
	</div>
						
						
						
						<!-- 부트스트랩 JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

	
						
</body>
</html>