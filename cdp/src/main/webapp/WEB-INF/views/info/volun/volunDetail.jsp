<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>봉사활동상세보기</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goVolunList").click(function(){
			$("#volunDetailAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<h1>봉사활동 상세보기</h1>
			<div>
				<table>
					<tr>
						<th>봉사활동코드</th>
						<th>대륙</th>
						<th>국가</th>
						<th>주제</th>
						<th>봉사활동명</th>
					</tr>
					<c:if test="${infoVolun != null}">
						<tr>
							<td>${infoVolun.infoVolunCode}</td>
							<td>${infoVolun.infoVolunContinent}</td>
							<td>${infoVolun.infoVolunCountry}</td>
							<td>${infoVolun.infoVolunTitle}</td>
							<td>${infoVolun.infoVolunName}</td>
						</tr>
					</c:if>
				</table>
			</div>
			<div>
				<form id="volunDetailAction" action="/infoVolunList">
					<input type="hidden" name="searchType" value="${searchType}"/>
					<input type="hidden" name="searchWord" value="${searchWord}"/>
					<input id="goVolunList" type="button" value="리스트로 가기"/>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>