<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공모전정보 입력</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancle").click(function(){
			$("#insertAction").attr("action", "/infoContestList");
			$("#insertAction").attr("method", "get");
			$("#insertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#insertAction").attr("action", "/infoContestInsert");
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
		<!-- 회원가입 폼 -->
			<div>
				<form id="insertAction" action="">
					<div>
						<span>개최기관</span>
						<span><input type="text" name="infoContestInstitute"/></span>
					</div>
					<div>
						<span>수상내역</span>
						<span><input type="text" name="infoContestPrize"/></span>
					</div>
					<div>
						<span>내용요약</span>
						<span><input type="text" name="infoContestContent"/></span>
					</div>
					<div>
						<span>공모전명</span>
						<span><input type="text" name="infoContestName"/></span>
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