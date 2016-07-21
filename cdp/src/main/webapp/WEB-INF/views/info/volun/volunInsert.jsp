<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>봉사활동등록</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancle").click(function(){
			$("#insertAction").attr("action", "/infoVolunList");
			$("#insertAction").attr("method", "get");
			$("#insertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#insertAction").attr("action", "/infoVolunInsert");
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
			<!-- 봉사활동 등록 폼 -->
			<div>
				<form id="insertAction" action="">
					<div>
						<span>대륙</span>
						<span><input type="text" name="infoVolunContinent"/></span>
					</div>
					<div>
						<span>국가</span>
						<span><input type="text" name="infoVolunCountry"/></span>
					</div>
					<div>
						<span>주제</span>
						<span><input type="text" name="infoVolunTitle"/></span>
					</div>
					<div>
						<span>봉사활동명 : </span>
						<span><input type="text" name="infoVolunName"/></span>
					</div>
					<div>
						<span><input id="insertCancle" type="button" value="취소"/></span>
						<span><input id="insertSubmit" type="button" value="확인"/></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>