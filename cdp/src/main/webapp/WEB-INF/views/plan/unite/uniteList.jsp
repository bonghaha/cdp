<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<style>
		table,th,tr,td{
			border : 1px black solid;
		}
	</style>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<h1>계획 통합</h1>
			<div>
				<form id="uniteListAction" action="">
					<input type="hidden" name="planUniteCode" value="${planUniteList.planUniteCode}">
					<table>
						<tr>
							<th>번호</th>
							<th>제목</th>
						</tr>
						<c:forEach var="pul" items="${planUniteList}">
							<tr>
								<td>${pul.planUniteCode}</td>
								<td><a href="/planUniteList?planUniteCode=${pul.planUniteCode}"></a>${pul.planUniteTitle}</td>
							</tr>
						</c:forEach>
					</table>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>