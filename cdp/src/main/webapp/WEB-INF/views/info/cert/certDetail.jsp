<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>certList</title>
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
			<!-- �ڰ��� �������� -->
			<h1>�ڰ��� ��������</h1>
			<div>
				<table>
					<tr>
						<th>��ȣ</th>
						<th>�ڰ�Ÿ��</th>
						<th>����ó</th>
						<th>�ڰ�����</th>
					</tr>
					<c:if test="${infoCert != null}">
						<tr>
							<td>${infoCert.infoCertCode}</td>
							<td>${infoCert.infoCertType}</td>
							<td>${infoCert.infoCertInstitute}</td>
							<td>${infoCert.infoCertName}</td>
						</tr>
					</c:if>
				</table>
			</div>
			<div>
				<form id="certDetailAction" action="/infoCertList">
					<input type="hidden" name="searchType" value="${searchType}"/>
					<input type="hidden" name="searchWord" value="${searchWord}"/>
					<input id="goCertList" type="button" value="����Ʈ�� ����"/>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>