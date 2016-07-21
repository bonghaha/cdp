<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancel").click(function(){
			$("#insertAction").attr("action", "/infoJobList");
			$("#insertAction").attr("method", "get");
			$("#insertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#insertAction").attr("action", "/infoJobInsert");
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
			<h1>���� ���</h1>
			<div>
				<form id="insertAction" action="">
					<div>
						<span>��з���</span>
						<div>
							<span>��з��ڵ� : </span>
							<span><input type="text" name="infoJobBigCode"/></span>
							<span>��з��� : </span>
							<span><input type="text" name="infoJobBigName"/></span>
						</div>
					</div>
					<div>
						<span>�ߺз���</span>
						<div>
							<span>�ߺз��ڵ� : </span>
							<span><input type="text" name="infoJobMiddleCode"/></span>
							<span>�ߺз��� : </span>
							<span><input type="text" name="infoJobMiddleName"/></span>
						</div>
					</div>
					<div>
						<span>�Һз���</span>
						<div>
							<span>�Һз��ڵ� : </span>
							<span><input type="text" name="infoJobSmallCode"/></span>
							<span>�Һз��� : </span>
							<span><input type="text" name="infoJobSmallName"/></span>
						</div>
					</div>
					<div>
						<span>���з���</span>
						<div>
							<span>���з��ڵ� : </span>
							<span><input type="text" name="infoJobDetailCode"/></span>
							<span>���з��� : </span>
							<span><input type="text" name="infoJobDetailName"/></span>
						</div>
					</div>
					<div>
						<span>�ɷ´�����</span>
						<span><input type="text" name="infoJobUnitName"/></span>
					</div>
					<div>
						<span>�з�����</span>
						<span><input type="text" name="infoJobDetailInfo"/></span>
					</div>
					<div>
						<span>��������</span>
						<span><input type="text" name="infoJobInfo"/></span>
					</div>
					<div>
						<span>����</span>
						<span><input type="text" name="infoJobCondition"/></span>
					</div>
					<div>
						<span>����⵵</span>
						<span><input type="date" name="infoJobApplyYear"/></span>
					</div>
					<div>
						<span>����Ƚ��</span>
						<span><input type="text" name="infoJobChangeCount"/></span>
					</div>
					<div>
						<span>�����</span>
						<span><input type="text" name="infoJobRegisterName"/></span>
					</div>
					<div>
						<span><input id="insertCancel" type="button" value="���"/></span>
						<span><input id="insertSubmit" type="button" value="Ȯ��"/></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>