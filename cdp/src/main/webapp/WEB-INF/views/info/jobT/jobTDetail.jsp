<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>직업훈련 상세보기</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#goJobTList").click(function(){
		$("#jobTDetailAction").submit();
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
			<h1>직업훈련 상세보기</h1>
			<div>
				<table>
					<tr>
						<th>직업분류 번호</th>
						<th>대상</th>
						<th>지역</th>
						<th>기관명</th>
						<th>과정명</th>
						<th>시작일</th>
						<th>종료일</th>
					</tr>
					<c:if test="${infoJobT != null}">
						<tr>
							<td>${infoJobT.infoJobTCode}</td>
							<td>${infoJobT.infoJobTTarget}</td>
							<td>${infoJobT.infoJobTLocation}</td>
							<td>${infoJobT.infoJobTInstitute}</td>
							<td>${infoJobT.infoJobTCourse}</td>
							<td>${infoJobT.infoJobTStartDate}</td>
							<td>${infoJobT.infoJobTEndDate}</td>
						</tr>
					</c:if>
				</table>
				<div>
					<form id="jobTDetailAction" action="/infoJobTList">
						<input type="hidden" name="searchType" value="${searchType}"/>
						<input type="hidden" name="searchWord" value="${searchWord}"/>
						<input id="goJobTList" type="button" value="리스트로 가기"/>
					</form>
				</div>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>