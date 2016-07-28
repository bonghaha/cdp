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
			$("#jobTDetailInsertAction").attr("action","/recJobTInsert");
			$("#jobTDetailInsertAction").attr("method","get");
			$("#jobTDetailInsertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#jobTDetailInsertAction").attr("action","/recJobTInsert");
			$("#jobTDetailInsertAction").attr("method","post");
			$("#jobTDetailInsertAction").submit();
		});
		
	});
</script>
</head>
<body>
	<form id="jobTDetailInsertAction" action="">
		<input type="hidden" name="infoJobCode" value="${infoJob.infoJobCode}"/>
		<input type="hidden" name="infoJobTCode" value="${infoJobT.infoJobTCode}"/>
		
		<div>
			<span>추천이유</span>
		</div>
		<div>
			<textarea rows="10" cols="30" name="recJobTReason"></textarea>
		</div>
		
		<div>
			<span>직업훈련내용</span>
		</div>
		<div>
			<textarea rows="10" cols="30" name="recJobTContent"></textarea>
		</div>
		
		<div>
			<span>추천상태</span>
		</div>
		<div>
			<select name="recJobTCondition">
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