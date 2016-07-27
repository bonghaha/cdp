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
			$("#contestDetailInsertAction").attr("action","/recContestInsert");
			$("#contestDetailInsertAction").attr("method","get");
			$("#contestDetailInsertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#contestDetailInsertAction").attr("action","/recBookInsert");
			$("#contestDetailInsertAction").attr("method","post");
			$("#contestDetailInsertAction").submit();
		});
		
	});
</script>
</head>
<body>
	<form id="contestDetailInsertAction" action="">
		<input type="hidden" name="infoJobCode" value="${infoJob.infoJobCode}"/>
		<input type="hidden" name="infoContestCode" value="${infoContest.infoContestCode}"/>
		
		<div>
			<span>��õ����</span>
		</div>
		<div>
			<textarea rows="10" cols="30" name="recContestReason"></textarea>
		</div>
		
		<div>
			<span>��õ����</span>
		</div>
		<div>
			<textarea rows="10" cols="30" name="recContestContent"></textarea>
		</div>
		
		<div>
			<span>��õ����</span>
		</div>
		<div>
			<select name="recContestCondition">
				<option value="">:::��õ����:::</option>
				<option value="����">����</option>
				<option value="������">������</option>
			</select>
		</div>
		
		<div>		
			<input type="button" id="insertCancel" value="���"/>
			<input type="button" id="insertSubmit" value="����ϱ�"/>
		</div>
	</form>
</body>
</html>