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
			<!-- ������ �󼼺��� -->
			<h1>������ �󼼺���</h1>
			<div>
				<table>
					<tr>
						<th>��ȣ</th>
						<th>���ֱ��</th>
						<th>���󳻿�</th>
						<th>������</th>
						<th>��������</th>
						
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
					<input id="goContestList" type="button" value="����Ʈ�� ����"/>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>