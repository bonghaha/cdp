<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ڰ������� �Է�</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancle").click(function(){
			$("#insertAction").attr("action", "/infoCertList");
			$("#insertAction").attr("method", "get");
			$("#insertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#insertAction").attr("action", "/infoCertInsert");
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
		<!-- �ڰ��� �Է� �� -->
			<div>
				<form id="insertAction" action="">
					<div>
						<span>�ڰ�Ÿ��</span>
						<span><input type="text" name="infoCertType"/></span>
					</div>
					<div>
						<span>����ó</span>
						<span><input type="text" name="infoCertInstitute"/></span>
					</div>
					<div>
						<span>�ڰ�����</span>
						<span><input type="text" name="infoCertName"/></span>
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