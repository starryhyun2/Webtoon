<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ epi.episodeName }</title>
</head>
<body>
	<h1 align="center">${ epi.episodeName }</h1>
	<c:forEach var="i" begin="1" end="${ cnt }">
	<div align="center">
			<img src="resources/study_group/${ epi.episodeName }/${ epi.episodeName } (${ i }).jpg" />
	</div>
	</c:forEach>
</body>
</html>