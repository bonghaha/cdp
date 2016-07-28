<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancel").click(function(){
			$("#bookDetailInsertAction").attr("action","/recBookInsert");
			$("#bookDetailInsertAction").attr("method","get");
			$("#bookDetailInsertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#bookDetailInsertAction").attr("action","/recBookInsert");
			$("#bookDetailInsertAction").attr("method","post");
			$("#bookDetailInsertAction").submit();
		});
		
	});
</script>
</head>
<body>
	<form id="bookDetailInsertAction" action="">
		<input type="hidden" name="infoJobCode" value="${infoJob.infoJobCode}"/>
		<input type="hidden" name="infoBookCode" value="${infoBook.infoBookCode}"/>
		
		<div>
			<span>추천이유</span>
		</div>
		<div>
			<textarea rows="10" cols="30" name="recBookReason"></textarea>
		</div>
		
		<div>
			<span>도서내용</span>
		</div>
		<div>
			<textarea rows="10" cols="30" name="recBookContent"></textarea>
		</div>
		
		<div>
			<span>추천상태</span>
		</div>
		<div>
			<select name="recBookCondition">
				<option value="">:::추천상태:::</option>
				<option value="적용">적용</option>
				<option value="비적용">비적용</option>
			</select>
		</div>
		
		<div>		
			<input type="button" id="insertCancel" value="취소"/>
			<input type="button" id="insertSubmit" value="등록하기"/>
		</div>
	</form>
</body>
</html>