<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ContestList</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goContestList").click(function(){
			$("#contestDetailAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- 공모전 상세보기 -->
			<h1>공모전 상세보기</h1>
			<div>
				<table>
					<tr>
						<th>번호</th>
						<th>개최기관</th>
						<th>수상내역</th>
						<th>내용요약</th>
						<th>공모전명</th>
						
					</tr>
					<c:if test="${infoContest != null}">
						<tr>
							<td>${infoContest.infoContestCode}</td>
							<td>${infoContest.infoContestInstitute}</td>
							<td>${infoContest.infoContestPrize}</td>
							<td>${infoContest.infoContestContent}</td>
							<td>${infoContest.infoContestName}</td>
							
						</tr>
					</c:if>
				</table>
			</div>
			<div>
				<form id="contestDetailAction" action="/infoContestList">
					<input type="hidden" name="searchType" value="${searchType}"/>
					<input type="hidden" name="searchWord" value="${searchWord}"/>
					<input id="goContestList" type="button" value="리스트로 가기"/>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>