<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>articleInsert</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancle").click(function(){
			$("#insertAction").attr("action", "/articleList");
			$("#insertAction").attr("method", "GET");
			$("#insertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#insertAction").attr("action", "/articleInsert");
			$("#insertAction").attr("method", "POST");
			$("#insertAction").submit();
		});
	});
</script>
<style>
/* input[type="text"] {
    width: 300px;
} */
</style>
</head>
<body>
	<tiles:insertDefinition name="layout">
		<tiles:putAttribute name="body">
			<div class="w3-card-2" style="width:70%; margin-left: 15%;">
				<div class="w3-container w3-dark-grey">
				  <h2>글 쓰기</h2>
				</div>
				<br/>
				<form id="insertAction" class="w3-container" action="">
					<p>
						<label class="w3-label w3-text-dark-grey"><b>작성자 : </b></label>
						<input class="w3-input w3-border" name="articleWriter" type="text"/>
					</p>
					<br/>
					<p>
						<label class="w3-label w3-text-dark-grey"><b>제목 : </b></label>
						<input class="w3-input w3-border" name="articleTitle" type="text"/>
					</p>
					<br/>
					<p>
						<label class="w3-label w3-text-dark-grey"><b>내용 : </b></label>
						<textarea class="w3-input w3-border" rows="15px" name="articleContent"></textarea>
					</p>
					<br/>
					<p>
						<label class="w3-label w3-text-dark-grey" ><b>비밀번호 : </b></label>
						<input class="w3-input w3-border" name="last" type="password" name="articlePw"/>
					</p>
					<br/>
					<p align="center">
						<input id="insertCancle" class="w3-btn w3-dark-grey" type="button" value="취소"/>
						<input id="insertSubmit" class="w3-btn w3-dark-grey" type="button" value="작성"/>
					</p>
				</form>
				<br/>
			</div>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>