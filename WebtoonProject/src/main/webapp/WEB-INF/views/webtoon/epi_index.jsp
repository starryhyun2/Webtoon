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
<!-- Ajax사용을 위한 js를 추가 -->
<script src="/webtoon/resources/js/httpRequest.js"></script>

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
				<input name="episode_idx" type="hidden" value="${ epi.episode_idx }" /></td>
		</form>

		<c:forEach var="wc" items="${wc_list}" varStatus="i">
			<tr>
			<form>
				<td>${wc.comments_idx}</td>
				<td>${wc.id}</td>

				<!-- 댓글 들여쓰기 -->
				<td><font>${wc.content}</font></td>
				
				<c:set var="now_id" value="${sessionScope.id }" />
				<c:set var="comment_id" value="${wc.id }"/>
					<c:if test="${now_id eq comment_id}">
						<td>
							<input type="button"  id="modify${i.count }" value="수정하기" onclick="modifyView(this.id)">
							<input type="button"  value="삭제하기" onclick="del_send(this.form)">
							<input name="episode_idx" type="hidden" value="${ epi.episode_idx }" />
							<input name="comments_idx" type="hidden" value="${ wc.comments_idx }" />
						</td>
					</c:if>
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
						<intpue type="button" onclick="modifyCancle('modify${i.count }')" value="취소"/>
					</td>
				</form>
			</tr>
		</c:forEach>

	</table>
	
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
		var score = f.score.value;
		var episode_idx = f.episode_idx.value;
		var id = f.id.value;
		
		if (id == null) {
			alert('로그인 한 후에 별점을 줄 수 있습니다.');
			return;
		} else if (id == '') {
			alert('로그인 한 후에 별점을 줄 수 있습니다.');
			return;
		}
		
		//Ajax로 ID와 PWD를 전달
		var url = "giveScore.do";
		var param = "score=" + score +"&episode_idx=" +episode_idx + "&id="+id;
		sendRequest(url, param, resultFn, "POST");
		
	}
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			//"{'result':'clear'}"
			var data = xhr.responseText;
			//서버에서 넘어온 데이터를 실제 JSON형식으로 변환
			var json = (new Function('return'+data))();
			if (json.result == 'already_id') {
				alert("별점을 수정했습니다.");
				return;
			} 
			alert("별점을 주었습니다!");
			return;
		}
	}
	
	function modify_send(f){
		//확인을 선택한 경우 자바스크립트를 호출할 때 같이 넘어온 url이라는 변수에 들어있는 주소로 페이지 이동
		if(window.confirm("이대로 변경하시겠습니까?") == true){
			f.action = "modify_wc.do";
			f.submit();
		}
	}
	function del_send(f){
		if(window.confirm("댓글을 삭제하시겠습니까?")){
			f.action="del_wc.do";
			f.submit();
		}
	}
</script>
	<script>
		var modifyViews = document.getElementsByClassName('modifyViews')

		for (var i = 0; i < modifyViews.length; i++) {
			modifyViews[i].style.display = 'none'
		}

		function modifyCancle(idI) {
			var modifiId = document.getElementById(idI);
			modifiId.parentElement.parentElement.style.display = '';
			modifiId.parentElement.parentElement.nextElementSibling.style.display = 'none';

		}
		function modifyView(idI) {
			var modifiId = document.getElementById(idI);
			modifiId.parentElement.parentElement.style.display = 'none';
			modifiId.parentElement.parentElement.nextElementSibling.style.display = '';

		}

	</script>
</body>
</html>