<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ���󼼺���</title>
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
		<div>
			<table>
				<tr>
					<th>�б��ڵ�</th>
					<th>����</th>
					<th>�б�����</th>
					<th>�б���</th>
				</tr>
				<c:if test="${infoSchool != null}">
					<tr>
						<td>${infoSchool.infoSchoolCode}</td>
						<td>${infoSchool.infoSchoolBigName}</td>
						<td>${infoSchool.infoSchoolMiddleName}</td>
						<td>${infoSchool.infoSchoolName}</td>
					</tr>
				</c:if>
			</table>
		</div>
		<div>
			<form id="schoolDetailAction" action="/infoSchoolList">
				<input type="hidden" name="searchType" value="${searchType}"/>
				<input type="hidden" name="searchWord" value="${searchWord}"/>
				<input id="goSchoolList" type="button" value="����Ʈ�� ����"/>
			</form>
		</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>