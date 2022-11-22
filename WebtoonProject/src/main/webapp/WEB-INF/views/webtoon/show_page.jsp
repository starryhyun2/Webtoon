<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ vo.title }</title>
</head>
<body>
<h1 align="center">${ vo.title }</h1>
<table>
    <tr>
        <th>작가</th>
        <th>장르</th>
        <th>정보</th>
    </tr>
    <tr>
        <td>${ vo.author }</td>
        <td>${ vo.genre }</td>
        <td>${ vo.info }</td>        
    </tr>
</table>
</body>
</html>