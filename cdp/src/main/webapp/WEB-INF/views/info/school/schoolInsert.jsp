<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>도서정보 입력</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancle").click(function(){
			$("#insertAction").attr("action", "/infoSchoolList");
			$("#insertAction").attr("method", "get");
			$("#insertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#insertAction").attr("action", "/infoSchoolInsert");
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
		<!-- 학교등록 폼 -->
			<div>
				<form id="insertAction" action="">
					<div>
						<span>지역</span>
					</div>
					<div>
						<span>대분류코드 : </span>
						<span><input type="text" name="infoSchoolBigCode"/></span>
						<span>대분류명 : </span>
						<span><input type="text" name="infoSchoolBigName"/></span>
					</div>
					<div>
						<span>학교유형</span>
					</div>
					<div>
						<span>중분류코드</span>
						<span><input type="text" name="infoSchoolMiddleCode"/></span>
						<span>중분류명</span>
						<span><input type="text" name="infoSchoolMiddleName"/></span>
					</div>
					<div>
						<span>학교명</span>
						<span><input type="text" name="infoSchoolName"/></span>
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