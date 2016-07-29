<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직업 등록</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancel").click(function(){
			$("#insertAction").attr("action", "/home");
			$("#insertAction").attr("method", "get");
			$("#insertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#insertAction").attr("action", "/planUniteInsert");
			$("#insertAction").attr("method", "post");
			$("#insertAction").submit();
		});
	});
	
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<h1>계획 통합 등록</h1>
			<div>
				<form id="insertAction" action="">
					<div>
						<span><input type="hidden" name="infoMemberId" value="${session.getId()}"/></span>
					</div>
					<div>
							<span>계획제목 : </span>
							<span><input type="text" name="planUniteTitle"/></span>
					</div>
					<div>
						<div>
							<span>내용요약 : </span>
							<span><input type="text" name="planUniteContent"/></span>
						</div>
					</div>
						<div>
							<span><input type="hidden" name="infoJobCode" value="${infoJob.infoJobCode}"/></span>
						</div>
					<div>
						<div>
							<span>멘토ID : </span>
							<span><input type="text" name="planMentoid"/></span>
						</div>
					</div>
					<div>
						<span><input id="insertCancel" type="button" value="취소"/></span>
						<span><input id="insertSubmit" type="button" value="확인"/></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>