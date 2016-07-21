<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>bookList</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goBookList").click(function(){
			$("#bookDetailAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- 도서 상세보기 -->
			<h1>도서 상세보기</h1>
			<div>
				<table>
					<tr>
						<th>번호</th>
						<th>장르</th>
						<th>출판사</th>
						<th>저자</th>
						<th>도서명</th>
						
					</tr>
					<c:if test="${infoBook != null}">
						<tr>
							<td>${infoBook.infoBookCode}</td>
							<td>${infoBook.infoBookGenre}</td>
							<td>${infoBook.infoBookInstitute}</td>
							<td>${infoBook.infoBookWriter}</td>
							<td>${infoBook.infoBookName}</td>
							
						</tr>
					</c:if>
				</table>
			</div>
			<div>
				<form id="bookDetailAction" action="/infoBookList">
					<input type="hidden" name="searchType" value="${searchType}"/>
					<input type="hidden" name="searchWord" value="${searchWord}"/>
					<input id="goBookList" type="button" value="리스트로 가기"/>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>