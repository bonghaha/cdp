<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DeptList</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goDeptList").click(function(){
			$("#deptDetailAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- 학과 상세보기 -->
			<div id="infoDeptDetail" align="center">
				<h1>학과 상세보기</h1><br/>
				<table class="w3-table w3-striped w3-border ">
					<tr class="w3-dark-grey">
						<th>계열</th>
						<th>학과</th>
					</tr>
					<tr>
						<td>${infoDept.lClass}</td>
						<td>${infoDept.mClass}</td>
					</tr>
				</table>
			</div>
			<br/>
			<div align="center">
				<form id="deptDetailAction" action="/infoDeptList">
					<input type="hidden" name="searchType" value="${searchType}"/>
					<input type="hidden" name="searchWord" value="${searchWord}"/>
					<input id="goDeptList" class="w3-btn w3-dark-grey" type="button" value="리스트로 가기"/>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>