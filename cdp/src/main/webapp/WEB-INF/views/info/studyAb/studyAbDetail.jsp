<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���п��� �󼼺���</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#goStudyAbList").click(function(){
		$("#studyAbDetailAction").submit();
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
			<h1>���п��� �󼼺���</h1>
			<div>
				<table>
					<tr>
						<th>���п����з� ��ȣ</th>
						<th>����</th>
						<th>�����</th>
						<th>���</th>
					</tr>
					<c:if test="${infoStudyAb != null}">
						<tr>
							<td>${infoStudyAb.infoStudyAbCode}</td>
							<td>${infoStudyAb.infoStudyAbLocation}</td>
							<td>${infoStudyAb.infoStudyAbInstitute}</td>
							<td>${infoStudyAb.infoStudyAbLang}</td>
						</tr>
					</c:if>
				</table>
				<div>
					<form id="studyAbDetailAction" action="/infoStudyAbList">
						<input type="hidden" name="searchType" value="${searchType}"/>
						<input type="hidden" name="searchWord" value="${searchWord}"/>
						<input id="goStudyAbList" type="button" value="����Ʈ�� ����"/>
					</form>
				</div>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>