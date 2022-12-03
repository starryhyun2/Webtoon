<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="/webtoon/resources/css/common.css">
<link rel="stylesheet" href="/webtoon/resources/css/myPage.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Yeon+Sung&display=swap"
	rel="stylesheet">


<script>
	function modify(f) {

		var pwd = f.pwd.value;
		var c_pwd = prompt("비밀번호를 입력해주세요.");

		if (pwd != c_pwd) {
			alert("비밀번호가 다릅니다.");
			return;
		}

		f.action = "modify_form.do";
		f.method = "post"
		f.submit();

	}
</script>
</head>
<body>

	<div id="total_wrap">

		<div id="first">
			<!-- if 문을 위해 var에 check_login 값 설정 -->

			<h1 id="main_title">
				<a href='mainToon.do'> <img
					src="/webtoon/resources/thumbnail/korea_logo.jpg" /> <span>코리아
						웹툰</span>
				</a>
			</h1>
			
		</div>
		
		<hr>

		<div id="page_name" style="text-align:center; margin:20px 0;">
			<h1>마이페이지</h1>
		</div>

		<div class="box">
			<form>
				<!-- <input type="hidden" name="sessionId" value="${session}">-->
				<table align="center" border="2">
				
					<tr>
						<td class="menu">이름</td>
						<td class="menu2"><a class="modify">${ vo.getName() }</a></td>
					</tr>

					<tr>
						<td class="menu">ID</td>
						<td class="menu2"><a class="modify">${ vo.getId() }</a></td>
					</tr>

					<tr>
						<td class="menu">Email</td>
						<td class="menu2"><a class="modify">${ vo.getEmail() }</a></td>
					</tr>

					<tr>
						<td class="menu">Phone</td>
						<td class="menu2"><a class="modify">${ vo.getPhonenum() }</a></td>
					</tr>

				</table>
					<div class="table_btn">
						<input
							type="hidden" value="${ vo.getId() }" name="id"> <input
							type="hidden" value="${ vo.getPwd() }" name="pwd"> <input
							type="hidden" value="${ vo.getUser_idx() }" name="idx"> <input
							type="button" value="정보 수정" onclick="modify(this.form)">
					</div>	
					
			</form>
		</div>
	</div>

</body>
</html>