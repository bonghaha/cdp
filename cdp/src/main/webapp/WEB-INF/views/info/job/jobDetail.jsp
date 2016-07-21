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
			<h1>직업 상세보기</h1>
			<div>
				<table>
					<tr>
						<th>직업분류번호</th>
						<th>대분류명</th>
						<th>중분류명</th>
						<th>소분류명</th>
						<th>세분류명</th>
						<th>능력단위명</th>
						<th>분류정보</th>
						<th>직업정보</th>
						<th>구분</th>
						<th>적용년도</th>
						<th>변경횟차</th>
						<th>등록일</th>
						<th>등록자</th>
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
						<input id="goJobList" type="button" value="리스트로 가기"/>
					</form>
				</div>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>