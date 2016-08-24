<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
jQuery( function($) { // HTML 문서를 모두 읽으면 포함한 코드를 실행
	// 아이디,비번 유효성 검사, 이름 공백안되게끔, 전화번호 - 제외한 번호만 입력하게끔, 이메일 형식에 갖추게끔, 아이디 중복검색
	
	// 정규식을 변수에 할당
	// 정규식을 직접 작성할 줄 알면 참 좋겠지만
	// 변수 우측에 할당된 정규식은 검색하면 쉽게 찾을 수 있다 
	// 이 변수들의 활약상을 기대한다
	// 변수 이름을 're_'로 정한것은 'Reguar Expression'의 머릿글자
	var re_pw = /^[a-z0-9_-]{6,18}$/; // 비밀번호 검사식
	var re_phone = /^[0-9]{8,12}$/; // 전화번호 검사식
	var re_email = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
	var re_birth = /^[0-9]{6}$/; // 생년월일 검사식
	
	// 선택할 요소를 변수에 할당
	// 변수에 할당하지 않으면 매번 HTML 요소를 선택해야 하기 때문에 귀찮고 성능에도 좋지 않다
	// 쉼표를 이용해서 여러 변수를 한 번에 선언할 수 있다
	// 보기 좋으라고 쉼표 단위로 줄을 바꿨다 
	var insertAction = $('#insertAction'),
		confirm = $('#confirm'),
		goBack = $('#goBack'),
		pwCheckForm = $('#pwCheckForm'),
		infoMemberPw = $('#infoMemberPw'),
		infoMemberPwHelper = $('#infoMemberPwHelper'),
		infoMemberName = $('#infoMemberName'),
		infoMemberNameHelper = $('#infoMemberNameHelper'),
		infoMemberPhone = $('#infoMemberPhone'),
		infoMemberPhoneHelper = $('#infoMemberPhoneHelper'),
		infoMemberEmail = $('#infoMemberEmail'),
		infoMemberEmailHelper = $('#infoMemberEmailHelper'),
		infoMemberBirth = $('#infoMemberBirth'),
		infoMemberBirthHelper = $('#infoMemberBirthHelper'),
		infoMemberPwCheck = $('#infoMemberPwCheck'),
		pwCheck = $('#pwCheck');
	
		
	goBack.click(function(){
		pwCheckForm.attr("action","/home");
		pwCheckForm.attr("method","post");
		pwCheckForm.submit();
	});	
		
	confirm.click(function(){
		if(re_pw.test(infoMemberPw.val()) != true){ // 비밀번호 검사
			alert('[PW 입력 오류] 유효한 PW를 입력해 주세요.');
			infoMemberPw.focus();
			return false;
		}else if(infoMemberName.val() == ""){ // 이름 검사
			alert('[이름 입력 오류] 이름을 입력해 주세요.')
			infoMemberName.focus();
			return false;
		}else if(re_phone.test(infoMemberPhone.val()) != true){ // 전화번호 검사
			alert('[전화번호 입력 오류] 유효한 전화번호를 입력해 주세요.');
			infoMemberPhone.focus();
			return false;
		}else if(re_email.test(infoMemberEmail.val()) != true){ // 이메일 검사
			alert('[Email 입력 오류] 유효한 이메일 주소를 입력해 주세요.');
			infoMemberEmail.focus();
			return false;
		}else if(re_birth.test(infoMemberBirth.val()) != true){ // 생년월일 검사
			alert('[Birth 입력 오류] 유효한 생년월일 입력해 주세요.');
			infoMemberBirth.focus();
			return false;
		}else if(infoMemberPwCheck.val()==pwCheck.val() !=true){ // 현재 비밀번호 확인
			alert('[PW 입력 오류] 올바른 현재 PW를 입력해 주세요.');
	  		pwCheck.focus();
			return false;
	  	}else if (infoMemberPwCheck.val()==pwCheck.val()){
	  		insertAction.attr("action", "/myInfoMemberUpdate");
			insertAction.submit();
	  	}
	});
	
	
	$(infoMemberPwHelper).after('<strong></strong>');
	// #infoMemberPw 인풋에서 onkeyup 이벤트가 발생하면
	infoMemberPw.keyup( function() {
		var s = $('#infoMemberPwHelper').next('strong'); // strong 요소를 변수에 할당
		if (infoMemberPw.val().length == 0) { // 입력 값이 없을 때
			s.text(''); // strong 요소에 포함된 문자 지움
		} else if (infoMemberPw.val().length < 6) { // 입력 값이 6보다 작을 때
			s.text('너무 짧아요'); // strong 요소에 문자 출력
		} else if (infoMemberPw.val().length > 18) { // 입력 값이 18보다 클 때
			s.text('너무 길어요'); // strong 요소에 문자 출력
		} else if(re_pw.test(infoMemberPw.val()) != true){
			s.text('형식에 맞게 입력해주세요');
		} else { // 입력 값이 6 이상 18 이하일 때
			s.text('적당해요'); // strong 요소에 문자 출력
		}
	});
	
	$(infoMemberNameHelper).after('<strong></strong>');
	// #infoMemberName 인풋에서 onkeyup 이벤트가 발생하면
	infoMemberName.keyup( function() {
		var s = $('#infoMemberNameHelper').next('strong'); // strong 요소를 변수에 할당
		if (infoMemberName.val().length == 0) { // 입력 값이 없을 때
			s.text(''); // strong 요소에 포함된 문자 지움
		} else if(infoMemberName.val() == "") { // 이름 입력 안했을 때
			s.text('이름을 입력하세요'); // strong 요소에 문자 출력
		} else { // 입력 값이 있을 때
			s.text('적당해요'); // strong 요소에 문자 출력
		}
	});
	
	$(infoMemberPhoneHelper).after('<strong></strong>');
	// #tel 인풋에 onkeydown 이벤트가 발생하면
	// 하이픈(-) 키가 눌렸는지 확인
	// 하이픈(-) 키가 눌렸다면 입력 중단
	infoMemberPhone.keydown(function(){
		var s = $('#infoMemberPhoneHelper').next('strong'); // strong 요소를 변수에 할당
		if(event.keyCode==109 || event.keyCode==189){
			return false;
		}else if(infoMemberPhone.val().length < 8){ // 길이 8~12
			s.text('너무 짧아요'); // strong 요소에 문자 출력
		}else if(infoMemberPhone.val().length > 12){ // 길이 8~12 ex(01011112222)
			s.text('너무 길어요'); // strong 요소에 문자 출력
		}else {
			s.text('적당해요'); // strong 요소에 문자 출력
		}
	});
	
	$(infoMemberEmailHelper).after('<strong></strong>');
	// #infoMemberEmail 인풋에서 onkeyup 이벤트가 발생하면
	infoMemberEmail.keyup( function() {
		var s = $('#infoMemberEmailHelper').next('strong'); // strong 요소를 변수에 할당
		if (infoMemberPw.val().length == 0) { // 입력 값이 없을 때
			s.text(''); // strong 요소에 포함된 문자 지움
		} else if(re_email.test(infoMemberEmail.val()) != true){
			s.text('형식에 맞게 입력해주세요');
		} else {
			s.text('적당해요'); // strong 요소에 문자 출력
		}
	});
	
	$(infoMemberBirthHelper).after('<strong></strong>');
	// #infoMemberBirth 인풋에서 onkeyup 이벤트가 발생하면
	infoMemberBirth.keyup( function() {
		var s = $('#infoMemberBirthHelper').next('strong'); // strong 요소를 변수에 할당
		if (infoMemberBirth.val().length == 0) { // 입력 값이 없을 때
			s.text(''); // strong 요소에 포함된 문자 지움
		} else if (infoMemberBirth.val().length < 6) { // 입력 값이 6보다 작을 때
			s.text('너무 짧아요'); // strong 요소에 문자 출력
		} else if (infoMemberBirth.val().length > 6) { // 입력 값이 6보다 클 때
			s.text('너무 길어요'); // strong 요소에 문자 출력
		} else if(re_birth.test(infoMemberBirth.val()) != true){
			s.text('형식에 맞게 입력해주세요');
		} else { // 입력 값이 6자리일때
			s.text('적당해요'); // strong 요소에 문자 출력
		}
	});	
});
</script>
</head>
<body>
<t:insertDefinition name="layout">
	<t:putAttribute name="body">
	<div class="w3-card-2" style="width:70%; margin-left: 15%;">	
		<div class="w3-container w3-dark-grey">
		  <h2>개인정보 수정</h2>
		</div>
		<form id="insertAction" class="w3-container" action="">
		<br/>
			<p>
				<label class="w3-label w3-text-dark-grey w3-xlarge" >ID : </label>
				<label class="w3-label w3-text-dark-grey w3-xlarge">${infoMember.infoMemberId}</label>
			</p>
			<br/>
			<p>
				<label class="w3-label w3-text-dark-grey">이름 : </label>
				<input id="infoMemberName" class="w3-input w3-border" type="text"  name="infoMemberName" value="${infoMember.infoMemberName}"/>
			</p>
			<span id="infoMemberNameHelper"></span>
			<br/>
			<p>
				<label class="w3-label w3-text-dark-grey">비밀번호 : </label>
				<input id="infoMemberPw" class="w3-input w3-border" type="password" name="infoMemberPw" value="${infoMember.infoMemberPw}"/> '6~18 문자 (영문, 숫자, 언더스코어(_), 하이픈(-) 포함가능)'
			</p>
			<span id="infoMemberPwHelper"></span>
			<br/>
			<p>
				<label class="w3-label w3-text-dark-grey">생년월일 : </label>
				<input id="infoMemberBirth" class="w3-input w3-border" type="text" name="infoMemberBirth" value="${infoMember.infoMemberBirth}"/> 'ex) 890825'
			</p>
			<span id="infoMemberBirthHelper"></span>
			<br/>
			<p>
				<label class="w3-label w3-text-dark-grey">전화번호 : </label>
				<input id="infoMemberPhone" class="w3-input w3-border" type="text" name="infoMemberPhone" value="${infoMember.infoMemberPhone}"/> '- 제외한 번호만 입력하세요'
			</p>
			<span id="infoMemberPhoneHelper"></span>
			<br/>
			<p>
				<label class="w3-label w3-text-dark-grey">이메일 : </label>
				<input id="infoMemberEmail" class="w3-input w3-border" type="text" name="infoMemberEmail" value="${infoMember.infoMemberEmail}"/>
			</p>
			<span id="infoMemberEmailHelper"></span>
			<br/>
			<p>
				<label class="w3-label w3-text-dark-grey">가입날짜 : </label>
				<label class="w3-label w3-text-dark-grey">${infoMember.infoMemberJoinDate}</label>
			</p>
			<br/>
		</form>
	</div>		
		<hr>
		<form id="pwCheckForm" class="w3-container" action="">
			<div align="center">
				<p>
					비밀번호 확인 : <input id="pwCheck" type="password" value=""/>
				</p>
				<input id="infoMemberPwCheck" type="hidden" name="infoMemberPwCheck" value="${infoMember.infoMemberPw}">
				<br/>
				<div>
					<span><input id="confirm" class="w3-btn w3-dark-grey" type="button" value="저장"/></span>
					<span><input id="goBack" class="w3-btn w3-dark-grey" type="button" value="취소"/></span>
				</div>
			</div>
		</form>
			<hr>
	</t:putAttribute>
</t:insertDefinition>
</body>
</html>