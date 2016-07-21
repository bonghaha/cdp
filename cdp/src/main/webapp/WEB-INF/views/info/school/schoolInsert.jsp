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
		<!-- �б���� �� -->
			<div>
				<form id="insertAction" action="">
					<div>
						<span>����</span>
					</div>
					<div>
						<span>��з��ڵ� : </span>
						<span><input type="text" name="infoSchoolBigCode"/></span>
						<span>��з��� : </span>
						<span><input type="text" name="infoSchoolBigName"/></span>
					</div>
					<div>
						<span>�б�����</span>
					</div>
					<div>
						<span>�ߺз��ڵ�</span>
						<span><input type="text" name="infoSchoolMiddleCode"/></span>
						<span>�ߺз���</span>
						<span><input type="text" name="infoSchoolMiddleName"/></span>
					</div>
					<div>
						<span>�б���</span>
						<span><input type="text" name="infoSchoolName"/></span>
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