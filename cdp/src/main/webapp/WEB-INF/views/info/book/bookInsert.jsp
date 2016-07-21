<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������� �Է�</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancle").click(function(){
			$("#insertAction").attr("action", "/infoBookList");
			$("#insertAction").attr("method", "get");
			$("#insertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#insertAction").attr("action", "/infoBookInsert");
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
		<!-- ȸ������ �� -->
			<div>
				<form id="insertAction" action="">
					<div>
						<span>�帣</span>
						<span><input type="text" name="infoBookGenre"/></span>
					</div>
					<div>
						<span>���ǻ�</span>
						<span><input type="text" name="infoBookInstitute"/></span>
					</div>
					<div>
						<span>����</span>
						<span><input type="text" name="infoBookWriter"/></span>
					</div>
					<div>
						<span>������</span>
						<span><input type="text" name="infoBookName"/></span>
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