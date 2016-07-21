<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>도서정보 입력</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancle").click(function(){
			$("#insertAction").attr("action", "/infoBookList");
			$("#insertAction").attr("method", "get");
			$("#insertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#insertAction").attr("action", "/infoBookInsert");
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
		<!-- 회원가입 폼 -->
			<div>
				<form id="insertAction" action="">
					<div>
						<span>장르</span>
						<span><input type="text" name="infoBookGenre"/></span>
					</div>
					<div>
						<span>출판사</span>
						<span><input type="text" name="infoBookInstitute"/></span>
					</div>
					<div>
						<span>저자</span>
						<span><input type="text" name="infoBookWriter"/></span>
					</div>
					<div>
						<span>도서명</span>
						<span><input type="text" name="infoBookName"/></span>
					</div>
				
					<div>
						<span><input id="insertCancle" type="button" value="취소"/></span>
						<span><input id="insertSubmit" type="button" value="확인"/></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>