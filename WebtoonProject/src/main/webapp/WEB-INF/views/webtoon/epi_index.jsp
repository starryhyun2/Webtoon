<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>${ epi.episodename }</title>

<!-- Ajax사용을 위한 js를 추가 -->
<script src="/webtoon/resources/js/httpRequest.js"></script>
<script>
	function reply_send(wc) {
		const id = wc.id.value;
		const content = wc.content.value.trim();
		const episode_idx = wc.episode_idx.value;
		//유효성 체크

		if (id == null) {
			alert('로그인 한 후에 글을 쓸 수 있습니다.');
			return;
		} else if (id == '') {
			alert('로그인 한 후에 글을 쓸 수 있습니다.');
			return;
		}

		if (content == '') {
			alert("내용은 한글자 이상 넣어주세요.");
			return;
		}

		wc.action = "webtoon_reply_insert.do";
		//cb.method = "post";
		wc.submit();

	}

	function giveScore(f) {
		var scoreNum = f.scoreNum.value;
		var episode_idx = f.episode_idx.value;
		
		//Ajax로 ID와 PWD를 전달
		var url = "giveScore.do";
		var param = "scoreNum=" + scoreNum +"&episode_idx=" +episode_idx;
		sendRequest(url, param, resultFn, "POST");
		
	}
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			//"{'result':'clear'}"
			var data = xhr.responseText;
			//서버에서 넘어온 데이터를 실제 JSON형식으로 변환
			var json = (new Function('return'+data))();
			if (json.result == 'no_id') {
				alert("아이디가 존재하지 않습니다");
				return;
			} else if (json.result == 'no_pwd') {
				alert("비밀번호 불일치");
				return;
			}
			return;
		}
	}
</script>
</head>
<body>
	<h1 style="width: 300px; margin: 0 auto;">
		<a href='mainToon.do'>코리아 웹툰</a>
	</h1>
	<!-- if 문을 위해 var에 check_login 값 설정 -->
	<c:set var="id" value="${sessionScope.id}" />

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
	<h1 align="center">${ epi.episodename }</h1>
	<c:forEach var="i" begin="1" end="${ cnt }">
		<div align="center">
			<img
				src="resources/${ epi.path }/${ epi.episodename }/${ epi.episodename } (${ i }).jpg" />
		</div>

	</c:forEach>

	<form>
		<input type="button" value="별점주기" onclick="giveScore(this.form);" /> 
		<select name="scoreNum" size="1">
			<option selected>5</option>
			<option>4</option>
			<option>3</option>
			<option>2</option>
			<option>1</option>
		</select>
		<input name="episode_idx" type="hidden" value=${ epi.episode_idx } />
	</form>

	<a href="#" onClick="javascript:window.scrollTo(0,0)">맨 위로</a>
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
				<input name="episode_idx" type="hidden" value=${ epi.episode_idx } /></td>
		</form>

		<c:forEach var="wc" items="${wc_list}">
			<tr>
				<td>${wc.comments_idx}</td>
				<td>${wc.id}</td>

				<!-- 댓글 들여쓰기 -->
				<td><font>${wc.content}</font></td>

			</tr>
		</c:forEach>

	</table>
</body>
</html>