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

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/webtoon/resources/css/common.css">
<link rel="stylesheet" href="/webtoon/resources/css/showPage.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Yeon+Sung&display=swap"
	rel="stylesheet">

<!-- Ajax사용을 위한 js를 추가 -->
<script src="/webtoon/resources/js/httpRequest.js" defer></script>
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
		
	<div id="up_btn">
		<a href="#" onClick="javascript:window.scrollTo(0,0)">🡅처음으로</a>
	</div>

<div style="background-color:#b0f1c1; padding:2px 0; margin-bottom:15px; width:100%;">
		<h1 align="center" id="epi_title">${ epi.episodename }</h1>

		<form style="margin-left: 10%; margin-bottom: 5%;">

			<select name="score" size="1" id="score">
				<option class="score_btn" selected value="5">★★★★★</option>
				<option class="score_btn" value="4">★★★★</option>
				<option class="score_btn" value="3">★★★</option>
				<option class="score_btn" value="2">★★</option>
				<option class="score_btn" value="1">★</option>
			</select> <input type="button" value="별점주기" onclick="giveScore(this.form);" />
			<input name="episode_idx" type="hidden" value="${ epi.episode_idx }" />
			<input name="id" type="hidden" value="${sessionScope.id}" />

		</form>
</div>
		<c:forEach var="i" begin="1" end="${ cnt }">
			<div align="center">
				<img
					src="resources/${ epi.path }/${ epi.episodename }/${ epi.episodename } (${ i }).jpg" />
			</div>

		</c:forEach>
		<!-- 댓글 창 시작부분  -->


		<div id="webtoon_reply_write">
			<form>
				<input type="text" name="id" value="${sessionScope.id}" placeholder="로그인 후 작성 가능"
					style="width: 10%" readOnly> <input type="text"
					name="content" placeholder="댓글 쓰기" style="width: 70%"> <input
					type="button" value="댓글" onclick="reply_send(this.form);">
				<input name="episode_idx" type="hidden" value="${ epi.episode_idx }" />
			</form>
		</div>

		<table align="center" id="webtoon_reply">
			<tr style="text-align: center;">
				<th colspan="1">번호</th>
				<th colspan="1">작성자</th>
				<th colspan="3">내용</th>
				<th colspan="1">좋아요</th>
			</tr>
			<!-- 베스트 댓글 좋아요가 10개 이상인 댓글들-->
			<tr>
				<td colspan="6" style="text-align: center; color:red; font-size:1.2em; font-weight:bold; ">★베스트 댓글★</td>
			</tr>

			<c:forEach var="wc" items="${best_wc_list}" varStatus="i">
				<tr class="normal_reply">
					<form>
						<td>${wc.step}</td>
						<td>${wc.id}</td>

						<!-- 댓글 들여쓰기 -->
						<td  style="width: 60%; text-align:left;"><font>${wc.content}</font></td>

						<td><img src="/webtoon/resources/thumbnail/goodIcon.png" style="width:30px;"/>${ wc.love }</td>

						<c:set var="now_id" value="${sessionScope.id }" />
						<c:set var="comment_id" value="${wc.id }" />
						<td  style="width: 10%;"><c:if test="${now_id eq comment_id}">
								<input type="button" id="modify${i.count }" value="수정"   class="reply_btn"
									onclick="modifyView(this.id)">
								<input type="button" value="삭제" onclick="del_send(this.form)"   class="reply_btn"> 
								<!-- 삭제를 위한 plain 숫자가 안붙어 있는 일반 텍스트 -->
								<input name="episode_idx" type="hidden"
									value="${ epi.episode_idx }" />
								<input name="comments_idx" type="hidden"
									value="${ wc.comments_idx }" />
								<input name="id" type="hidden" value="${sessionScope.id}" />
								<input name="love" type="hidden" value="${ wc.love }" />
							</c:if></td>
					<td><input type="button" value="좋아요 ${i.index }"   class="reply_btn"
						onclick="best_love_send(${i.index})" /> <!-- 좋아요, 수정, 삭제 기능을 위한 히든값 -->
						<input name="episode_idx3" type="hidden"
						value="${ epi.episode_idx }" /> <input name="comments_idx3"
						type="hidden" value="${ wc.comments_idx }" /> <input name="id3"
						type="hidden" value="${sessionScope.id}" /> <input name="love3"
						type="hidden" value="${ wc.love }" /></td>
					</form>
				</tr>




				<!--여기부터 댓글 수정창-->
				<tr class="modifyViews">
					<form>
						<td colspan="3"><input type="hidden" name="comments_idx"
							value="${wc.comments_idx }"> <input type="hidden"
							name="episode_idx" value="${epi.episode_idx }"> <textarea
								rows="3" cols="55" placeholder="내용을 작성하세요" name="content"
								required="required">
							${wc.content }
					</textarea></td>
						<td><input type="button" value="수정"   class="reply_btn"
							onclick="modify_send(this.form)" /> <input type="button"
							value="취소" onclick="modifyCancle('modify${i.count }')" /></td>
					</form>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="6" style="text-align: center; color:red; font-size:1.2em; font-weight:bold;">★베스트 댓글★</td>
			</tr>

			<!-- 여기서부터 일반 댓글 -->
			<c:forEach var="wc" items="${wc_list}" varStatus="i">
				<tr class="normal_reply">
					<form>
						<td>${wc.step}</td>
						<td>${wc.id}</td>

						<!-- 댓글 들여쓰기 -->
						<td style="width: 60%; text-align:left;"><font>${wc.content}</font></td>

						<td><img src="/webtoon/resources/thumbnail/goodIcon.png" style="width:30px;"/>${ wc.love }</td>

						<c:set var="now_id" value="${sessionScope.id }" />
						<c:set var="comment_id" value="${wc.id }" />
						<td style="width: 10%;"><c:if test="${now_id eq comment_id}">
								<input type="button" id="modify${i.count }" value="수정" class="reply_btn"
									onclick="modifyView(this.id)">
								<input type="button" value="삭제"  class="reply_btn" onclick="del_send(this.form)">
								<!-- 삭제를 위한 plain 숫자가 안붙어 있는 일반 텍스트 -->
								<input name="episode_idx" type="hidden"
									value="${ epi.episode_idx }" />
								<input name="comments_idx" type="hidden"
									value="${ wc.comments_idx }" />
								<input name="id" type="hidden" value="${sessionScope.id}" />
								
								<input name="love" type="hidden" value="${ wc.love }" />
							</c:if></td>
					<td><input type="button" value="좋아요 ${i.index }"  class="reply_btn"
						onclick="love_send(${i.index})" /> <!-- 좋아요, 수정, 삭제 기능을 위한 히든값 -->
						<input name="episode_idx2" type="hidden"
						value="${ epi.episode_idx }" /> <input name="comments_idx2"
						type="hidden" value="${ wc.comments_idx }" /> <input name="id2"
						type="hidden" value="${sessionScope.id}" /> <input name="love2"
						type="hidden" value="${ wc.love }" /></td>
					</form>
				</tr>




				<!--여기부터 댓글 수정창-->
				<tr class="modifyViews">
					<form>
						<td colspan="3"><input type="hidden" name="comments_idx"
							value="${wc.comments_idx }"> <input type="hidden"
							name="episode_idx" value="${epi.episode_idx }"> <textarea
								rows="3" cols="90" placeholder="내용을 작성하세요" name="content"
								required="required">
							${wc.content }
					</textarea></td>
						<td><input type="button" value="수정"
							onclick="modify_send(this.form)" /> <input type="button"
							value="취소" onclick="modifyCancle('modify${i.count }')" /></td>
					</form>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>