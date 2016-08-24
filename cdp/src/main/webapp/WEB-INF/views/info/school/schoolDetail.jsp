<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학교상세보기</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goSchoolList").click(function(){
			$("#schoolDetailAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
		<div id="infoSchoolDetail" align="center">
			<h1>학교 상세보기</h1><br/>
			<table class="w3-table w3-striped w3-border ">
				<tr class="w3-dark-grey">
					<th>지역</th>
					<th>학교유형</th>
					<th>학교명</th>
				</tr>
				<c:if test="${infoSchool != null}">
					<tr>
						<td>${infoSchool.region}</td>
						<td>${infoSchool.schoolType}</td>
						<td>${infoSchool.schoolName}</td>
					</tr>
				</c:if>
			</table>
		</div>
		<br/>
		<div align="center">
			<form id="schoolDetailAction" action="/infoSchoolList">
				<input type="hidden" name="searchType" value="${searchType}"/>
				<input type="hidden" name="searchWord" value="${searchWord}"/>
				<input id="goSchoolList" class="w3-btn w3-dark-grey" type="button" value="리스트로 가기"/>
			</form>
		</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>