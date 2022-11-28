<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">
<!-- 회원가입 디자인 설정 -->
<!-- 자바 스크립트 문법을 사용하기 위해 타입설정 -->
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
    function idCheck(id) { //idCheck(id) 함수는 id중복확인 버튼을 클릭하면 호출되는 함수
        frm = document.regFrm; //버튼을 클릭했을 때 회원가입 폼에 아이디 값이 없으면 경고 메시지가 뜨지만 정상적으로 입력하면
        //ID 중복체크(idCheck.jsp)로 아이디 값과 함께 넘어간다.
        if (id == "") {
            alert("아이디를 입력해 주세요.");
            frm.id.focus();
            return;
        }
        url = "IDCheck.jsp?ID=" + ID;
        window.open(url, "IDCheck", "width=300,height=150");
    }
 
   
</script>
</head>
<body bgcolor="FFFFCC" onLoad="regFrm.id.focus()">
    <!-- 페이지 로딩 및 새로고침이 발생되면 포커스가 ID입력란으로 위치합니다. -->
    <div align="center">
        <br /> <br />
        <form name="regfrm" method="post" action="memberProc.jsp">
            <!--memberProc.jsp파일에 regfrm이라는 폼으로 post방식으로 값을 전달한다. -->
            <table align="center" border="0" cellspacing="0" cellpadding="5">
                <!-- cellspacing는 테이블의 외곽과 셸의 경계면의 두께를 설정, cellpadding는 셸과 내용의 사이를 지정하는 태그 -->
 
 
                <tr>
                    <td align="center" valign="middle" bgcolor="#FFFFCC">
                        <table border="1" cellspacing="0" cellpadding="2" align="center"
                            width="600">
                            <tr align="center" bgcolor="#996600">
                                <td colspan="3"><font color="#FFFFFF"><b>회원 가입</b></font></td>
                            </tr>
 
 
                            <tr>
                                <td width="20%">아이디</td>
                                <td width="50%"><input name="id" size="15"> <input
                                    type="button" value="ID중복확인"
                                    onClick="IDCheck(this.form.ID.value)"></td>
                                <!-- onClick로 입력한 아이디가 중복된 값인지 확인 -->
                                <td width="30%">아이디를 적어 주세요.</td>
                            </tr>
 
                            <tr>
                                <td>패스워드</td>
                                <td><input type="PWD" name="PWD" size="20"></td>
                                <td>패스워드를 적어주세요.</td>
                            </tr>
 
                            <tr>
                                <td>패스워드 확인</td>
                                <td><input type="PWD" name="REPWD" size="20"></td>
                                <td>패스워드를 확인합니다.</td>
                            </tr>
 
                            <tr>
                                <td>이름</td>
                                <td><input name="NAME" size="15"></td>
                                <td>이름을 적어주세요.</td>
                            </tr>
 
                            <tr>
                                <td>Email</td>
                                <td><input name="EMAIL" size="30"></td>
                                <td>이메일을 적어 주세요.</td>
                            </tr>
 
                            <tr>
                                <td colspan="3" align="center"><input type="button"
                                    value="회원가입" onclick="inputCheck()"> &nbsp; &nbsp; <input
                                    type="reset" value="다시쓰기"> &nbsp; &nbsp; <input
                                    type="button" value="로그인"
                                    onClick="javascript:location.href='login.jsp'"></td>
                            </tr>
 
                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
