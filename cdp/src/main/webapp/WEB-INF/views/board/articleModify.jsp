<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>articleModify</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#modifyBack").click(function(){
			$("#modifyAction").attr("action", "/articleDetail1");
			$("#modifyAction").attr("method", "GET");
			$("#modifyAction").submit();
		});
		
		$("#modifySubmit").click(function(){
			$("#modifyAction").attr("action", "/articleModifyPost");
			$("#modifyAction").attr("method", "POST");
			$("#modifyAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<t:putAttribute name="body">
<h1>�ۼ���</h1>
	<div>
		<form id="modifyAction" action="">
		<input type="hidden" name="articleDate" value="${article.articleDate}"/>
			<table>
				<tr>
					<td>�۹�ȣ : </td>
					<td><input type="text" name="articleNo" value="${article.articleNo}" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>�ۼ��� : </td>
					<td><input type="text" name="articleWriter" value="${article.articleWriter}" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>���� : </td>
					<td><input type="text" name="articleTitle" value="${article.articleTitle}"/></td>
				</tr>
				<tr>
					<td>���� : </td>
					<td><input type="text" name="articleContent" value="${article.articleContent}"/></td>
				</tr>
				<tr>
					<td>��й�ȣ : </td>
					<td><input type="password" name="articlePw"/></td>
				</tr>
			</table>
			<div>
				<input id="modifyBack" type="button" value="���ư���"/>
				<input id="modifySubmit" type="button" value="����"/>
			</div>
		</form>
	</div>
	</t:putAttribute>
	</t:insertDefinition>
</body>
</html>