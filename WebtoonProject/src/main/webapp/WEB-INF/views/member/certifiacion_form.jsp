<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<!-- Ajax사용을 위한 js를 추가 -->
<script src="/webtoon/resources/js/httpRequest.js"></script>

<script>

	function send(f) {

		var Key = document.getElementById('Key').value;

		//Ajax로 ID와 PWD를 전달
		var url = "sKey_check.do";
		var param = "Key=" + Key;
		
		sendRequest(url, param, resultFn, "POST");

	}

	function resultFn() {

		if (xhr.readyState == 4 && xhr.status == 200) {
			//"{'result':'clear'}"
			var data = xhr.responseText;

			//서버에서 넘어온 데이터를 실제 JSON형식으로 변환
			var json = (new Function('return'+data))();
			if (json.result == 'false') {
				alert("일치하지 않습니다.");
				return;

			}

			location.href = "mainToon.do";
		}

	}
</script>
</head>
<body>
	<div>
		<h1>이메일, 혹은 휴대폰을 확인하시고 메시지를 입력하세요.</h1>
		<input id="Key" type="text">
		<input type="button" value="인증 확인" onclick="send()"/>
	</div>
</body>
</html>