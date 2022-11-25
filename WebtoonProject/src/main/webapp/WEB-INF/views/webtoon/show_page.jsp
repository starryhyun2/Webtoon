<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ vo.title }</title>
</head>
<body>
<h1 align="center">${ vo.title }</h1>
<img src="resources/upload/${ vo.filename }" alt="study_group"/>
<input align="left" type="button" value="회차추가" onclick="location.href='addEpi_form?episode_idx=${ vo.webtoon_idx }'">
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

<table cellpadding="0" cellspacing="0" class="viewList">
			<caption><span class="blind">회차별 목록</span></caption>
			<colgroup><col width="99"><col width="*"><col width="141"><col width="76">
			</colgroup><thead>
			<tr>
				<th scope="col">이미지</th>
				<th scope="col">제목</th>
				<th scope="col">별점</th>
				<th scope="col">등록일</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="epi" items="${ epi }">
			<tr>
				<td>
					<img src="resources/upload/${ vo.filename }"/>
				</td>
				<td>
				<a href="Epi?episode_idx=${ epi.episode_idx }">${ epi.episodeName }</a>
				</td>
				
				<td style="text-align:center;">
				${ epi.score }
				</td>
				
				<td>
				${epi.regdate }
				</td>
			</tr>
			</c:forEach>
			</tbody></table>
</body>
</html>