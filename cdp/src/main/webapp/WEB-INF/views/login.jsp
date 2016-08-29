<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var re_id = /^[a-z0-9_-]{3,16}$/; // 아이디 검사식
		var re_pw = /^[a-z0-9_-]{6,18}$/; // 비밀번호 검사식
		
		var infoMemberId = $('#infoMemberId'),
			infoMemberIdHelper = $('#infoMemberIdHelper'),
			infoMemberPw = $('#infoMemberPw'),
			infoMemberPwHelper = $('#infoMemberPwHelper'),
			login = $('#login');
		
		login.click(function(){
			if(re_id.test(infoMemberId.val()) != true){
				infoMemberIdHelper.text('아이디를 영문, 숫자, 언더스코어(_), 하이픈(-)이 포함 3~16 문자를 입력하여 주세요');
				infoMemberId.focus();
			}else if(re_pw.test(infoMemberPw.val()) != true){
				infoMemberIdHelper.text('');
				infoMemberPwHelper.text('비밀번호를 영문, 숫자, 언더스코어(_), 하이픈(-) 포함 6~18 문자를 입력하여 주세요');
				infoMemberPw.focus();
			}else{
				infoMemberPwHelper.text('');
				$("#loginAction").attr("action", "/loginProcess");
				$("#loginAction").attr("method", "post");
				$("#loginAction").submit();
			}
		});
	});
</script>
<style>
	#login_login { 
		text-align: center;
	}
	#infoMemberId, #infoMemberPw {
		
		width:230px; height:40px;
		border:1px solid #BDBDBD;
		padding:15px;
		font-size:16px;
		/* color:#aaa; */
      }
	
	/* #login, #reset {
		width:230px; height:40px;
		border:1px solid #BDBDBD;
		padding:15px;
		font-size:16px;
		color:#aaa;
	} */
</style>
</head>
<body>
	<t:insertDefinition name="layout">

	<!-- body -->
	<t:putAttribute name="body">
		
		<div id="login_login">
			<h2 style="font-weight: bold;">평생교육의 꿈</h2>
			<h2 style="font-weight: bold; color: #24468A;">CDP에 오신걸 환영합니다.</h2>
			<br/><br/><br/>
			<form id="loginAction">
				<!-- 아이디 -->
				<div>
					<span><label for="infoMemberId">ID</label></span>
					<span><input id="infoMemberId" type="text" name="infoMemberId" value="bongha825"></span>
					<span>3~16 문자 (영문, 숫자, 언더스코어(_), 하이픈(-)이 포함가능)</span>
				</div>
				<div>
					<span id="infoMemberIdHelper"> </span>
				</div>
				<br/>
				<!-- 비밀번호 -->
				<div>
					<span><label for="infoMemberPw">PW</label></span>
					<span><input id="infoMemberPw" type="password" name="infoMemberPw" value="admin1234"></span>
					<span>6~18 문자 (영문, 숫자, 언더스코어(_), 하이픈(-) 포함가능)</span>
				</div>
				<div>
					<span id="infoMemberPwHelper"> </span>
				</div>
				<br/><br/><br/>
				<div>
					<span><input class="w3-btn w3-dark-grey" id="login" type="button" value="로그인"></span>
					<span><input class="w3-btn w3-dark-grey" id="reset" type="reset" value="리셋"></span>
				</div>
			</form>
			<h3>${loginHelper}</h3>
		</div>	
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>