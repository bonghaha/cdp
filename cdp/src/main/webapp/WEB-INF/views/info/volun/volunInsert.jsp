<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����Ȱ�����</title>
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
			<!-- ����Ȱ�� ��� �� -->
			<div>
				<form id="insertAction" action="">
					<div>
						<span>���</span>
						<span><input type="text" name="infoVolunContinent"/></span>
					</div>
					<div>
						<span>����</span>
						<span><input type="text" name="infoVolunCountry"/></span>
					</div>
					<div>
						<span>����</span>
						<span><input type="text" name="infoVolunTitle"/></span>
					</div>
					<div>
						<span>����Ȱ���� : </span>
						<span><input type="text" name="infoVolunName"/></span>
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