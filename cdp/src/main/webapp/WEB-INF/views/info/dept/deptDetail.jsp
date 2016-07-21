<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>DeptList</title>
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
			<!-- �а� �󼼺��� -->
			<h1>�а� �󼼺���</h1>
			<div>
				<table>
					<tr>
						<th>��ȣ</th>
						<th>�а��迭</th>
						<th>�к�</th>
						<th>�а���</th>
					</tr>
					<c:if test="${infoDept != null}">
						<tr>
							<td>${infoDept.infoDeptCode}</td>
							<td>${infoDept.infoDeptBigName}</td>
							<td>${infoDept.infoDeptMiddleName}</td>
							<td>${infoDept.infoDeptSmallName}</td>
						</tr>
					</c:if>
				</table>
			</div>
			<div>
				<form id="deptDetailAction" action="/infoDeptList">
					<input type="hidden" name="searchType" value="${searchType}"/>
					<input type="hidden" name="searchWord" value="${searchWord}"/>
					<input id="goDeptList" type="button" value="����Ʈ�� ����"/>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>