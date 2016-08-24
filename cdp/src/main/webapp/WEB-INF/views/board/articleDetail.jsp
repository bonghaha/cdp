<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>articleDetail</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#articleList").click(function(){
			$("#articleAction").attr("action", "/articleList");
			$("#articleAction").submit();
		});
		$("#articleModify").click(function(){
			$("#articleAction").attr("action", "/articleModify");
			$("#articleAction").submit();
		});
		$("#articleDelete").click(function(){
			$("#articleAction").attr("action", "/articleDelete");
			$("#articleAction").submit();
		})
		$("#replyInsert").click(function(){
			$("#replyAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<t:putAttribute name="body">
	<!-- articleDetail �����ֱ� -->
	<div class="w3-card-2" style="width:70%; margin-left: 15%;">
	<div class="w3-container w3-dark-grey">
		<br/>
		<h1>${article.articleTitle}</h1>
	  	<div>
			<span>�۹�ȣ : ${article.articleNo},</span>
			<span>�ۼ��� : ${article.articleWriter},</span>
			<span>�ۼ��� : ${article.articleDate} </span>
	  	</div>
	  	<br/>
	</div>
	<br/>
	<p>
		<label class="w3-label w3-text-dark-grey"><b><font style="font-size: 23px;">�� ���� : </font></b></label>
		<textarea class="w3-input w3-border" rows="10px">${article.articleContent}</textarea>	
	</p>
	
	<hr>
	
	<!-- replyList �����ֱ� -->
	<div>
		<c:forEach var="rList" items="${replyList}">
			<div>
				<span>�ۼ��� : </span><span>${rList.replyWriter}</span><br/><br/>
				<span>���� : </span><span>${rList.replyContent}</span>
				<button class="w3-btn w3-dark-grey">
					<a href="/replyDelete?articleNo=${rList.articleNo}&replyNo=${rList.replyNo}">����</a>
				</button>
			</div>
			<div>
				<hr>
			</div>
		</c:forEach>
	</div>
	
	<!-- reply���� -->
	<div>
		<form id="replyAction" action="/replyInsert" method="POST">
			<input type="hidden" name="articleNo" value="${article.articleNo}"/><br/><br/>
			<div>
				<span><font style="font-size: 23px;"><b>��� : </b></font></span><span><textarea class="w3-input w3-border" rows="4px" name="replyContent"></textarea></span>
			</div><br/>
			<div>
				<span>�ۼ��� : </span><span><input type="text" class="w3-border" name="replyWriter"/></span>
				<span>��й�ȣ : </span><span><input type="password" class="w3-border" name="replyPw"/></span>
				<span><input id="replyInsert" class="w3-btn w3-dark-grey" type="button" value="��۵��"/></span>
			</div>
		</form>
	</div>
	<hr>
	<div align="center">
		<form id="articleAction" class="w3-container" action="" method="GET">
			<input type="hidden" name="articleNo" value="${article.articleNo}"/>
			<input id="articleList" class="w3-btn w3-dark-grey" type="button" value="�۸��"/>
			<input id="articleModify" class="w3-btn w3-dark-grey" type="button" value="�ۼ���"/>
			<input id="articleDelete" class="w3-btn w3-dark-grey" type="button" value="�ۻ���"/>
		</form>
		<br/>
	</div>
	</div>
	</t:putAttribute>
	</t:insertDefinition>
</body>
</html>