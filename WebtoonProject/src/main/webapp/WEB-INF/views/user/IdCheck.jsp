<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="service" class="" />
 
<%
    request.setCharacterEncoding("EUC-KR"); //한글이 깨지지 않도록 문자셋 지정
    String id = request.getParameter("ID"); //id를 파라미터로 얻어와서 id변수에 넣는다.
    boolean result = IdCheck(id); //아이디가 중복되었는지 체크하는 변수
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ID 중복체크</title>
<link href="style.css" rel="stylesheet" type="text/css">
<!-- 디자인을 설정하기위해 css파일을 불러온다. -->
</head>
<body bgcolor="#FFFFCC">
    <div align="center">
        <br /> <b><%=id%></b>
        <%
            if (result) //result가 참이면 중복된 아이디, 거짓이면 사용할 수 있는 아이디
            {
                out.println("는 이미 존재하는 ID입니다.<p/>");
            } else {
                out.println("는 사용 가능 합니다.<p/>");
            }
        %>
        <a href='#' onClick="self.close()">닫기</a>
        <!-- 현재의 창을 닫는다 -->
 
    </div>
</body>
</html>
