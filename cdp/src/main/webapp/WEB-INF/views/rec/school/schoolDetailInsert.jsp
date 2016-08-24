<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancel").click(function(){
			$("#schoolDetailInsertAction").attr("action","/recSchoolInsert");
			$("#schoolDetailInsertAction").attr("method","get");
			$("#schoolDetailInsertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#schoolDetailInsertAction").attr("action","/recSchoolInsert");
			$("#schoolDetailInsertAction").attr("method","post");
			$("#schoolDetailInsertAction").submit();
		});
		
	});
</script>
</head>
<body>
	<form id="schoolDetailInsertAction" action="">
		<input type="hidden" name="jobdicSeq" value="${infoJob.jobdicSeq}"/>
		<input type="hidden" name="job" value="${infoJob.job}"/>
		<input type="hidden" name="seq" value="${infoSchool.seq}"/>
		<input type="hidden" name="schoolName" value="${infoSchool.schoolName}"/>
		<div>
			<span>추천이유</span>
		</div>
		<div>
			<textarea rows="10" cols="30" name="recSchoolReason"></textarea>
		</div>
		
		<div>
			<span>학교내용</span>
		</div>
		<div>
			<textarea rows="10" cols="30" name="recSchoolContent"></textarea>
		</div>
		
		<div>
			<span>추천상태</span>
		</div>
		<div>
			<select name="recSchoolCondition">
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