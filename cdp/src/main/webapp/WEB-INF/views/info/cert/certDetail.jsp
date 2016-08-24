<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>certList</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goCertList").click(function(){
			$("#certDetailAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- 자격증 세부정보 -->
			<div id="infoCertDetail" align="center">
				<h1>자격증 상세보기</h1><br/>
				<table class="w3-table w3-striped w3-border ">
					<tr class="w3-dark-grey">
						<th>종목명</th>
						<th>중직무분야명</th>
						<th>대직무분야명</th>
						<th>자격구분명</th>
						<th>계열명</th>
					</tr>
						<tr>
							<td>${infoCert.jmFldNm}</td>
							<td>${infoCert.mdobligFldNm}</td>
							<td>${infoCert.obligFldNm}</td>
							<td>${infoCert.qualgbNm}</td>
							<td>${infoCert.seriesNm}</td>
						</tr>
				</table>
			</div>
			<br/>
			<div align="center">
				<form id="certDetailAction" action="/infoCertList">
					<input type="hidden" name="searchType" value="${searchType}"/>
					<input type="hidden" name="searchWord" value="${searchWord}"/>
					<input id="goCertList" class="w3-btn w3-dark-grey" type="button" value="리스트로 가기"/>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>