<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Ajax 사용을 위한 js를 로드 -->
<script src="/webtoon/resources/js/httpRequest.js"></script>

<script>
	function reply_send(cb) {

		const id = cb.id.value;
		const content = cb.content.value.trim();
		const ref = cb.ref.value;
		//유효성 체크

		if (id == '') {
			alert("아이디는 필수입니다.");
			return;
		}
		if (content == '') {
			alert("내용은 한글자 이상 넣어주세요.");
			return;
		}

		cb.action = "reply_insert.do";
		//cb.method = "post";
		cb.submit();

	}

	function del(ff) {

		var board_idx = ff.board_idx.value;

		if (!confirm("삭제하시겠습니까?")) {
			return;
		}

		// 삭제를 위한 게시글을 idx를 DB로 전달

		var url = "del";
		var param = "board_idx="+board_idx;
		sendRequest(url, param, resultFn, "post");

	}

	function resultFn() {

		if (xhr.readyState == 4 && xhr.status == 200) {

			//"no" or "yes"
			var data = xhr.responseText;

			if (data == 'no') {

				alert("삭제 실패");
				return;
			}

			alert("삭제 성공");
			location.href = "list.do";

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
	
	
	<form id="ff">
		<table border="1" align="center" width="80%">
			<caption>
				<h2>::: 상세보기 :::</h2>
			</caption>

			<tr>
				<td>제목</td>
				<td>${vo.title}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${vo.id}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${vo.regdate}</td>
			</tr>
			<tr style="height: 400px;">
				<td>내용</td>
				<td><pre>${vo.content}</pre></td>
			</tr>

			<tr>
				<td colspan="2"><input type="button" value="목록 보기"
					onclick="location.href='list.do'"> <input type="button"
					value="삭제" onclick="del(this.form);"></td>
			</tr>

		</table>
		<input name="board_idx" type="hidden" value=${ vo.board_idx } />
	</form>

	<form id="cb">
		<table border="1" align="center" width="80%">
			<tr>
			
				<td colspan="4">
					<input type="text" name="id" placeholder="아이디"
					style="width: 10%"> <input type="text" name="content"
					placeholder="댓글 쓰기" style="width: 70%"> <input
					type="button" value="댓글" onclick="reply_send(this.form);">
					<input name="ref" type="hidden" value=${ vo.board_idx } />
				</td>

			</tr>
		</table>
	</form>
	<table border="1" align="center" width="80%">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>내용</th>
		</tr>

		<c:forEach var="cb" items="${cb_list}">
			<tr>
				<td>${cb.comments_idx}</td>
				<td>${cb.id}</td>
				<td align="center">${cb.regdate }</td>

				<!-- 댓글 들여쓰기 -->
				<td><c:if test="${cb.del_info eq 0}">
					${cb.content}
				</c:if> <c:if test="${cb.del_info ne 0}">

						<font>${cb.content}</font>

					</c:if></td>

			</tr>
		</c:forEach>

	</table>

</body>
</html>