<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>언어 등록</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancel").click(function(){
			$("#insertAction").attr("action", "/infoLangList");
			$("#insertAction").attr("method", "get");
			$("#insertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#insertAction").attr("action", "/infoLangInsert");
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
			<h1>언어 등록</h1>
			<div>
				<form id="insertAction" action="">
					<div>
						<span>언어명</span>
						<span><input type="text" name="infoLangName"/></span>
					</div>
					<div>
						<span>시험명</span>
						<span><input type="text" name="infoLangTestName"/></span>
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