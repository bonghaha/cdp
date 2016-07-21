<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>학과정보 입력</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancle").click(function(){
			$("#insertAction").attr("action", "/infoDeptList");
			$("#insertAction").attr("method", "get");
			$("#insertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#insertAction").attr("action", "/infoDeptInsert");
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
		<!-- 학과정보 입력 폼 -->
			<div>
				<form id="insertAction" action="">
					<div>
						<span>학과계열</span>
						<div>
							<span>대분류코드 : </span>
							<span><input type="text" name="infoDeptBigCode"/></span>
							<span>대분류명 : </span>
							<span><input type="text" name="infoDeptBigName"/></span>
						</div>
					</div>
					<div>
						<span>학부</span>
						<div>
							<span>중분류코드 : </span>
							<span><input type="text" name="infoDeptMiddleCode"/></span>
							<span>중분류명 : </span>
							<span><input type="text" name="infoDeptMiddleName"/></span>
						</div>
					</div>
					<div>
						<span>학과명</span>
						<div>
							<span>소분류코드 : </span>
							<span><input type="text" name="infoDeptSmallCode"/></span>
							<span>소분류명 : </span>
							<span><input type="text" name="infoDeptSmallName"/></span>
						</div>
					</div>
					<div>
						<span>학교 </span>
						<span><input type="text" name="infoSchoolCode"/></span>
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