<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>${ epi.episodename }</title>
<!-- https://velog.io/@hana78786/67.-%EB%8C%93%EA%B8%80-%EC%88%98%EC%A0%95%EC%B0%BD-%EB%A7%8C%EB%93%A4%EA%B8%B0 -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/webtoon/resources/css/common.css">
<link rel="stylesheet" href="/webtoon/resources/css/showPage.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Yeon+Sung&display=swap" rel="stylesheet">

	<!-- Ajax사용을 위한 js를 추가 -->
<script src="/webtoon/resources/js/httpRequest.js" defer ></script>
<script src="/webtoon/resources/js/epi_index.js" defer></script>
</head>
<body>
<div id="total_wrap">
	<h1 id="main_title">
				<a href='mainToon.do'> <img
					src="/webtoon/resources/thumbnail/korea_logo.jpg" /> <span>코리아
						웹툰</span>
				</a>
	</h1>
	<!-- if 문을 위해 var에 check_login 값 설정 -->
	<c:set var="id" value="${sessionScope.id}" />
<div id="header">
	<c:choose>
		<c:when test="${id eq 'admin' }">
						<input id="logout_btn" type="button" value="로그아웃"
							onclick="location.href='logout.do'">
						<input id="admin_btn" type="button" value="관리자 페이지"
							onclick="location.href='admin_form.do'">
						<input id="Mypage_btn" type="button" value="My 페이지"
							onclick="location.href='Mypage'">
					</c:when>

					<c:when test="${id ne null }">
						<input id="logout_btn" type="button" value="로그아웃"
							onclick="location.href='logout.do'">
						<input id="Mypage_btn" type="button" value="My 페이지"
							onclick="location.href='Mypage'">
					</c:when>

					<c:otherwise>
						<input id="login_btn" type="button" value="로그인"
							onclick="location.href='login_form'">
						<input id="sign_up_btn" type="button" value="회원가입"
							onclick="location.href='sign_up_form'">
		</c:otherwise>
	</c:choose>
	
	</div>
	
	<hr>
	
	<h1 align="center">${ epi.episodename }</h1>
	<c:forEach var="i" begin="1" end="${ cnt }">
		<div align="center">
			<img
				src="resources/${ epi.path }/${ epi.episodename }/${ epi.episodename } (${ i }).jpg" />
		</div>

	</c:forEach>

	<form>
		<input type="button" value="별점주기" onclick="giveScore(this.form);" /> 
		<select name="score" size="1">
			<option selected>5</option>
			<option>4</option>
			<option>3</option>
			<option>2</option>
			<option>1</option>
		</select>
		<input name="episode_idx" type="hidden" value="${ epi.episode_idx }" />
		<input name="id" type="hidden" value="${sessionScope.id}" />
		
	</form>

	<a href="#" onClick="javascript:window.scrollTo(0,0)">맨 위로</a>
	<!-- 댓글 창 시작부분  -->
	<table border="1" align="center" width="80%">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>내용</th>
		</tr>
		<form>
			<td colspan="4"><input type="text" name="id"
				value="${sessionScope.id}" style="width: 10%" readOnly> <input
				type="text" name="content" placeholder="댓글 쓰기" style="width: 70%">
				<input type="button" value="댓글" onclick="reply_send(this.form);">
				<input name="episode_idx" type="hidden" value="${ epi.episode_idx }" />
				</td>
		</form>
		<!-- 베스트 댓글 좋아요가 10개 이상인 댓글들-->
		<tr>
			<td>★베스트 댓글★</td>
		</tr>
		<c:forEach var="wc" items="${bese_wc_list}" varStatus="i">
			<tr>
			<form>
				<td>${wc.step}</td>
				<td>${wc.id}</td>

				<!-- 댓글 들여쓰기 -->
				<td><font>${wc.content}</font></td>
				
				<td>${ wc.love }</td>
				
				<c:set var="now_id" value="${sessionScope.id }" />
				<c:set var="comment_id" value="${wc.id }"/>
					<c:if test="${now_id eq comment_id}">
						<td>
							<input type="button"  id="modify${i.count }" value="수정하기" onclick="modifyView(this.id)">
							<input type="button"  value="삭제하기" onclick="del_send(this.form)">
							
							<!-- 삭제를 위한 plain 숫자가 안붙어 있는 일반 텍스트 -->
							<input name="episode_idx" type="hidden" value="${ epi.episode_idx }" />
							<input name="comments_idx" type="hidden" value="${ wc.comments_idx }" />
							<input name="id" type="hidden" value="${sessionScope.id}" />
							<input name="love" type="hidden" value="${ wc.love }"/>
						</td>
					</c:if>
				<td>
					<input type="button" value="좋아요 ${i.index }" onclick="best_love_send(${i.index})"/>
					
					<!-- 좋아요, 수정, 삭제 기능을 위한 히든값 -->
					<input name="episode_idx3" type="hidden" value="${ epi.episode_idx }" />
					<input name="comments_idx3" type="hidden" value="${ wc.comments_idx }" />
					<input name="id3" type="hidden" value="${sessionScope.id}" />
					<input name="love3" type="hidden" value="${ wc.love }"/>
				</td>
				</form>
			</tr>
			

			
			
			<!--여기부터 댓글 수정창-->
			<tr class="modifyViews">
				<form >
					<td colspan="3"><input type="hidden" name="comments_idx"
						value="${wc.comments_idx }"> <input type="hidden"
						name="episode_idx" value="${epi.episode_idx }"> <textarea
							rows="3" cols="55" placeholder="내용을 작성하세요" name="content"
							required="required">
							${wc.content }
					</textarea></td>
					<td>
						<input type="button" value="수정" onclick="modify_send(this.form)"/>
						<input type="button" value="취소" onclick="modifyCancle('modify${i.count }')" />
					</td>
				</form>
			</tr>
		</c:forEach>
		
		<tr>
			<td>★베스트 댓글★</td>
		</tr>
		
		<!-- 여기서부터 일반 댓글 -->
		<c:forEach var="wc" items="${wc_list}" varStatus="i">
			<tr>
			<form>
				<td>${wc.step}</td>
				<td>${wc.id}</td>

				<!-- 댓글 들여쓰기 -->
				<td><font>${wc.content}</font></td>
				
				<td>${ wc.love }</td>
				
				<c:set var="now_id" value="${sessionScope.id }" />
				<c:set var="comment_id" value="${wc.id }"/>
					<c:if test="${now_id eq comment_id}">
						<td>
							<input type="button"  id="modify${i.count }" value="수정하기" onclick="modifyView(this.id)">
							<input type="button"  value="삭제하기" onclick="del_send(this.form)">
							
							<!-- 삭제를 위한 plain 숫자가 안붙어 있는 일반 텍스트 -->
							<input name="episode_idx" type="hidden" value="${ epi.episode_idx }" />
							<input name="comments_idx" type="hidden" value="${ wc.comments_idx }" />
							<input name="id" type="hidden" value="${sessionScope.id}" />
							<input name="love" type="hidden" value="${ wc.love }"/>
						</td>
					</c:if>
				<td>
					<input type="button" value="좋아요 ${i.index }" onclick="love_send(${i.index})"/>
					
					<!-- 좋아요, 수정, 삭제 기능을 위한 히든값 -->
					<input name="episode_idx2" type="hidden" value="${ epi.episode_idx }" />
					<input name="comments_idx2" type="hidden" value="${ wc.comments_idx }" />
					<input name="id2" type="hidden" value="${sessionScope.id}" />
					<input name="love2" type="hidden" value="${ wc.love }"/>
				</td>
				</form>
			</tr>
			

			
			
			<!--여기부터 댓글 수정창-->
			<tr class="modifyViews">
				<form >
					<td colspan="3"><input type="hidden" name="comments_idx"
						value="${wc.comments_idx }"> <input type="hidden"
						name="episode_idx" value="${epi.episode_idx }"> <textarea
							rows="3" cols="55" placeholder="내용을 작성하세요" name="content"
							required="required">
							${wc.content }
					</textarea></td>
					<td>
						<input type="button" value="수정" onclick="modify_send(this.form)"/>
						<input type="button" value="취소" onclick="modifyCancle('modify${i.count }')" />
					</td>
				</form>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>