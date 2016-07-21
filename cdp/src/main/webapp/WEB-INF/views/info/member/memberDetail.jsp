<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원상세보기</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goMemberList").click(function(){
			$("#memberDetailAction").submit();
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
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>생일</th>
					<th>등급</th>
					<th>회원가입일</th>
				</tr>
				<c:if test="${infoMember != null}">
					<tr>
						<td>${infoMember.infoMemberId}</td>
						<td>${infoMember.infoMemberName}</td>
						<td>${infoMember.infoMemberPhone}</td>
						<td>${infoMember.infoMemberEmail}</td>
						<td>${infoMember.infoMemberBirth}</td>
						<td>${infoMember.infoMemberLevel}</td>
						<td>${infoMember.infoMemberJoinDate}</td>
					</tr>
				</c:if>
			</table>
		</div>
		<div>
			<form id="memberDetailAction" action="/infoMemberList">
				<input type="hidden" name="searchType" value="${searchType}"/>
				<input type="hidden" name="searchWord" value="${searchWord}"/>
				<input id="goMemberList" type="button" value="리스트로 가기"/>
			</form>
		</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>