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
<img src="${ vo.thumbnailName }${ vo.webtoon_idx }.jpg" alt="study_group"/>
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
			<tr>
				<td>
					<a href="/webtoon/detail?titleId=721948&amp;no=181&amp;weekday=sat" onclick="nclk_v2(event,'lst.img','721948','181')">
						<img src="https://shared-comic.pstatic.net/thumb/webtoon/721948/181/thumbnail_202x120_28892508-4e0d-42a5-9b82-83ef2c5764c5.jpg" title="시즌2 62화" alt="시즌2 62화" width="71" height="41" onerror="this.src='https://ssl.pstatic.net/static/comic/images/migration/common/non71_41.gif'">
						<span class="mask"></span>
					</a>
				</td>
				<td class="title">
				<a href="/webtoon/detail?titleId=721948&amp;no=181&amp;weekday=sat" onclick="nclk_v2(event,'lst.title','721948','181')">시즌2 62화</a>
						</td>
				<td>
					<div class="rating_type">
						<span class="star"><em style="width:99.62%">평점</em></span>
						<strong>score</strong>
					</div>
				</td>
				<td class="num">regdate</td>
			</tr>
			
			</tbody></table>
</body>
</html>