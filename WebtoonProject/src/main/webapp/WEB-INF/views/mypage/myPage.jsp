<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>

<link rel="stylesheet" href="/webtoon/resources/css/webtoon.css">

<script>

	function modify(f){
		
		var pwd = f.pwd.value;
		var c_pwd = prompt("비밀번호를 입력해주세요.");
		
		if(pwd != c_pwd){
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
	<h1 style="width: 300px; margin: 0 auto;"><a href='mainToon.do'>코리아 웹툰</a></h1>
	<div id="page_name">
		<h1>::: 마이페이지 :::</h1>
	</div>

	<div class="box">
		<form>
			<!-- <input type="hidden" name="sessionId" value="${session}">-->
			<table align="center">
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
				
				<tr>
					<td colspan="2" align="center" class="button">
						<input type="hidden" value="${ vo.getId() }" name="id">
						<input type="hidden" value="${ vo.getPwd() }" name="pwd">
						<input type="hidden" value="${ vo.getUser_idx() }" name ="idx">
						<input type="button" value="정보 수정" onclick="modify(this.form)">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>