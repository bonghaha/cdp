<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancle").click(function(){
			$("#insertAction").attr("action", "/infoMemberList");
			$("#insertAction").attr("method", "get");
			$("#insertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#insertAction").attr("action", "/infoMemberInsert");
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
					<span>���̵� : </span>
					<span><input type="text" name="infoMemberId"/></span>
				</div>
				<div>
					<span>��й�ȣ : </span>
					<span><input type="password" name="infoMemberPw"/></span>
				</div>
				<div>
					<span>�̸� : </span>
					<span><input type="text" name="infoMemberName"/></span>
				</div>
				<div>
					<span>��ȭ��ȣ : </span>
					<span><input type="text" name="infoMemberPhone"/> ' - ������ ��ȣ�� �Է��ϼ��� '</span>
				</div>
				<div>
					<span>�̸��� : </span>
					<span><input type="text" name="infoMemberEmail"/></span>
				</div>
				<div>
					<span>������� : </span>
					<span><input type="text" name="infoMemberBirth"/> 'ex) 890825'</span>
				</div>
				<div>
					<span>���� : </span>
					<span><input type="text" name="infoMemberLevel"/></span>
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