<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>replyDelete</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#deleteBack").click(function(){
			$("#deleteAction").attr("action", "/articleDetail");
			$("#deleteAction").attr("method", "POST");
			$("#deleteAction").submit();
		});
		
		$("#deleteSubmit").click(function(){
			if($("#replyPw").val() == ""){
				$("#replyPwHelper").text("비밀번호를 입력하세요");
			}else if($("#replyPw").val() != $("#replyPwCheck").val()){
				$("#replyPwHelper").text("");
				$("#replyPwHelper").text("비밀번호가 틀립니다");
			}else{
				$("#deleteAction").attr("action", "/replyDelete");
				$("#deleteAction").attr("method", "POST");
				$("#deleteAction").submit();
			}
			
		});
	});
</script>
<style>
input[type="password"] {
	width: 200px;
}
</style>
</head>
<body>
<t:insertDefinition name="layout">
<!-- body -->
<t:putAttribute name="body">
	<div class="w3-card-2" align="center" style="width:40%; margin-left: 30%;">
		<div class="w3-container w3-dark-grey">
	  		<h2>비밀번호 확인</h2>
		</div><br/>
			<form id="deleteAction" class="w3-container" action="">
				<p align="center">
					<input type="hidden" name="articleNo" value="${reply.articleNo}"/>
					<input type="hidden" name="replyNo" value="${reply.replyNo}"/>
					<input id="replyPwCheck" type="hidden" value="${reply.replyPw}"/>
					<span><input id="replyPw" class="w3-input w3-border" type="password" name="replyPw"/></span>
					<span id="replyPwHelper"></span>
				</p>
				<p align="center">
					<input id="deleteBack" class="w3-btn w3-dark-grey" type="button" value="취소"/>
					<input id="deleteSubmit" class="w3-btn w3-dark-grey" type="button" value="확인"/>
				</p>
			</form>
		</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>