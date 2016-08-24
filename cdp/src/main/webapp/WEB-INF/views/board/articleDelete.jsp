<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>articleDelete</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#deleteBack").click(function(){
			$("#deleteAction").attr("action", "/articleDetail1");
			$("#deleteAction").attr("method", "GET");
			$("#deleteAction").submit();
		});
		
		$("#deleteSubmit").click(function(){
			if($("#articlePw").val() == ""){
				$("#articlePwHelper").text("��й�ȣ�� �Է��ϼ���");
			}else if($("#articlePw").val() != $("#articlePwCheck").val()){
				$("#articlePwHelper").text("");
				$("#articlePwHelper").text("��й�ȣ�� Ʋ���ϴ�");
			}else{
				$("#deleteAction").attr("action", "/articleDelete");
				$("#deleteAction").attr("method", "POST");
				$("#deleteAction").submit();
			}
			
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<t:putAttribute name="body">
	<h1>��й�ȣ Ȯ��</h1>
	<div>
		<h4>��й�ȣ�� �Է��ϼ���</h4>
	</div>
	<div>
		<form id="deleteAction" action="">
			<div>
				<input type="hidden" name="articleNo" value="${article.articleNo}"/>
				<input type="hidden" name="replyNo" value="${reply.replyNo}"/>
				<input id="articlePwCheck" type="hidden" value="${article.articlePw}"/>
				<span><input id="articlePw" type="password" name="articlePw"/></span>
				<span id="articlePwHelper"></span>
			</div>
			<div>
				<input id="deleteBack" type="button" value="���"/>
				<input id="deleteSubmit" type="button" value="Ȯ��"/>
			</div>
		</form>
	</div>
	</t:putAttribute>
	</t:insertDefinition>
</body>
</html>