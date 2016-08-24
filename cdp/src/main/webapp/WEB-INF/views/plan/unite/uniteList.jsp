<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goInfoJobList").click(function(){
			$("#uniteListAction").attr("action", "/infoJobList");
			$('#uniteListAction').attr("method", "get");
			$("#uniteListAction").submit();
		});
	});
</script>
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
		<div align="center">
		<img src="/resources/image/ing44.PNG">
		</div>
			<h1>계획 통합</h1>
			<div>
				<form id="uniteListAction" action="">
					<input type="hidden" name="jobdicSeq" value="${infoJob.jobdicSeq}"/>
					<h3>${sessionScope.memberLoginId}님의 계획리스트</h3>
					<table>
						<tr>
							<th>직업명</th>
							<th>제목</th>
							<th>등록일</th>
						</tr>
						<c:choose>
							<c:when test="${empty planUniteList}">
								<tr>
									<td colspan="3">등록하신 계획이 없습니다</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="pul" items="${planUniteList}">
									<tr>
										<td>${pul.job}</td>
										<td><a href="/planUniteDetail?planUniteCode=${pul.planUniteCode}&jobdicSeq=${pul.jobdicSeq}">${pul.planUniteTitle}</a></td>
										<td>${pul.planUniteRegisterDate}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<div>
						<span><input id="goInfoJobList" type="button" value="계획등록하기"/></span>
					</div>	
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>