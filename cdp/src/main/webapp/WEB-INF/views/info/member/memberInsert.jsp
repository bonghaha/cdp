<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancle").click(function(){
			$("#insertAction").attr("action", "/infoMemberList");
			$("#insertAction").attr("method", "get");
			$("#insertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#insertAction").attr("action", "/infoMemberInsert");
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
					<span>아이디 : </span>
					<span><input type="text" name="infoMemberId"/></span>
				</div>
				<div>
					<span>비밀번호 : </span>
					<span><input type="password" name="infoMemberPw"/></span>
				</div>
				<div>
					<span>이름 : </span>
					<span><input type="text" name="infoMemberName"/></span>
				</div>
				<div>
					<span>전화번호 : </span>
					<span><input type="text" name="infoMemberPhone"/> ' - 제외한 번호만 입력하세요 '</span>
				</div>
				<div>
					<span>이메일 : </span>
					<span><input type="text" name="infoMemberEmail"/></span>
				</div>
				<div>
					<span>생년월일 : </span>
					<span><input type="text" name="infoMemberBirth"/> 'ex) 890825'</span>
				</div>
				<div>
					<span>권한 : </span>
					<span><input type="text" name="infoMemberLevel"/></span>
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