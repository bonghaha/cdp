<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancel").click(function(){
			$("#deptDetailInsertAction").attr("action","/recDeptInsert");
			$("#deptDetailInsertAction").attr("method","get");
			$("#deptDetailInsertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#deptDetailInsertAction").attr("action","/recDeptInsert");
			$("#deptDetailInsertAction").attr("method","post");
			$("#deptDetailInsertAction").submit();
		});
		
	});
</script>
</head>
<body>
	<form id="deptDetailInsertAction" action="">
		<input type="hidden" name="jobdicSeq" value="${infoJob.jobdicSeq}"/>
		<input type="hidden" name="job" value="${infoJob.job}"/>
		<input type="hidden" name="majorSeq" value="${infoDept.majorSeq}"/>
		<input type="hidden" name="mClass" value="${infoDept.mClass}"/>
		
		<div>
			<span>추천이유</span>
		</div>
		<div>
			<textarea rows="10" cols="30" name="recDeptReason"></textarea>
		</div>
		
		<div>
			<span>내용</span>
		</div>
		<div>
			<textarea rows="10" cols="30" name="recDeptContent"></textarea>
		</div>
		
		<div>
			<span>추천상태</span>
		</div>
		<div>
			<select name="recDeptCondition">
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