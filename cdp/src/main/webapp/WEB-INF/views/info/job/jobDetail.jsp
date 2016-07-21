<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#goJobList").click(function(){
		$("#jobDetailAction").submit();
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
			<h1>���� �󼼺���</h1>
			<div>
				<table>
					<tr>
						<th>�����з���ȣ</th>
						<th>��з���</th>
						<th>�ߺз���</th>
						<th>�Һз���</th>
						<th>���з���</th>
						<th>�ɷ´�����</th>
						<th>�з�����</th>
						<th>��������</th>
						<th>����</th>
						<th>����⵵</th>
						<th>����Ƚ��</th>
						<th>�����</th>
						<th>�����</th>
					</tr>
					<c:if test="${infoJob != null}">
						<tr>
							<td>${infoJob.infoJobCode}</td>
							<td>${infoJob.infoJobBigName}</td>
							<td>${infoJob.infoJobMiddleName}</td>
							<td>${infoJob.infoJobSmallName}</td>
							<td>${infoJob.infoJobDetailName}</td>
							<td>${infoJob.infoJobUnitName}</td>
							<td>${infoJob.infoJobDetailInfo}</td>
							<td>${infoJob.infoJobInfo}</td>
							<td>${infoJob.infoJobCondition}</td>
							<td>${infoJob.infoJobApplyYear}</td>
							<td>${infoJob.infoJobChangeCount}</td>
							<td>${infoJob.infoJobRegisterDate}</td>
							<td>${infoJob.infoJobRegisterName}</td>
						</tr>
					</c:if>
				</table>
				<div>
					<form id="jobDetailAction" action="/infoJobList">
						<input type="hidden" name="searchType" value="${searchType}"/>
						<input type="hidden" name="searchWord" value="${searchWord}"/>
						<input id="goJobList" type="button" value="����Ʈ�� ����"/>
					</form>
				</div>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>