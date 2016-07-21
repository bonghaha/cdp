<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�а����� �Է�</title>
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
		<!-- �а����� �Է� �� -->
			<div>
				<form id="insertAction" action="">
					<div>
						<span>�а��迭</span>
						<div>
							<span>��з��ڵ� : </span>
							<span><input type="text" name="infoDeptBigCode"/></span>
							<span>��з��� : </span>
							<span><input type="text" name="infoDeptBigName"/></span>
						</div>
					</div>
					<div>
						<span>�к�</span>
						<div>
							<span>�ߺз��ڵ� : </span>
							<span><input type="text" name="infoDeptMiddleCode"/></span>
							<span>�ߺз��� : </span>
							<span><input type="text" name="infoDeptMiddleName"/></span>
						</div>
					</div>
					<div>
						<span>�а���</span>
						<div>
							<span>�Һз��ڵ� : </span>
							<span><input type="text" name="infoDeptSmallCode"/></span>
							<span>�Һз��� : </span>
							<span><input type="text" name="infoDeptSmallName"/></span>
						</div>
					</div>
					<div>
						<span>�б� </span>
						<span><input type="text" name="infoSchoolCode"/></span>
					</div>
					<div>
						<span><input id="insertCancle" type="button" value="���"/></span>
						<span><input id="insertSubmit" type="button" value="Ȯ��"/></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>