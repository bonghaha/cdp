<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����Ȱ���󼼺���</title>
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
			<h1>����Ȱ�� �󼼺���</h1>
			<div>
				<table>
					<tr>
						<th>����Ȱ���ڵ�</th>
						<th>���</th>
						<th>����</th>
						<th>����</th>
						<th>����Ȱ����</th>
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
					<input id="goVolunList" type="button" value="����Ʈ�� ����"/>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>