<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		// 입력한 학교정보 저장하기
		$('#schoolInsert').click(function(){
			var svcCode = "SCHOOL";
			var gubun = this.form.gubun.value;
			var schoolName = this.form.schoolName.value;
			var resumeSchoolCondition = this.form.resumeSchoolCondition.value;
			var startDate = this.form.startDate.value;
			var endDate = this.form.endDate.value;
// 			console.log("svcCode : " + svcCode);
// 			console.log("gubun : " + gubun);
// 			console.log("schoolName : " + schoolName);
// 			console.log("resumeSchoolCondition : " + resumeSchoolCondition);
// 			console.log("startDate : " + startDate);
// 			console.log("endDate : " + endDate);
			$.ajax({
				url:'/resumeSchoolInsert',
				type:'POST',
				data:{
					svcCode:svcCode,
					gubun:gubun,
					schoolName:schoolName,
					resumeSchoolCondition:resumeSchoolCondition,
					startDate:startDate,
					endDate:endDate
				},
				success:function(data){
					alert("학교정보 입력 성공!");
				},
				error:function(error){
					alert("학교정보 입력 실패!");
				}
			});
		});
		
		// 입력한 학교정보로 수정하기
		$('#schoolUpdate').click(function(){
			var gubun = this.form.gubun.value;
			var schoolName = this.form.schoolName.value;
			var resumeSchoolCondition = this.form.resumeSchoolCondition.value;
			var startDate = this.form.startDate.value;
			var endDate = this.form.endDate.value;
// 			console.log("gubun : " + gubun);
// 			console.log("schoolName : " + schoolName);
// 			console.log("resumeSchoolCondition : " + resumeSchoolCondition);
// 			console.log("startDate : " + startDate);
// 			console.log("endDate : " + endDate);
			$.ajax({
				url:'/resumeSchoolUpdate',
				type:'POST',
				data:{
					gubun:gubun,
					schoolName:schoolName,
					resumeSchoolCondition:resumeSchoolCondition,
					startDate:startDate,
					endDate:endDate
				},
				success:function(data){
					alert("학교정보 수정 성공!");
				},
				error:function(error){
					alert("학교정보 수정 실패!");
				}
			});
		});
		
		// 입력한 학과정보 저장하기
		$('#deptInsert').click(function(){
			var svcCode = "MAJOR";
			var mClass = this.form.mClass.value;
// 			console.log("svcCode : " + svcCode);
// 			console.log("mClass : " + mClass);
			$.ajax({
				url:'/resumeDeptInsert',
				type:'POST',
				data:{
					svcCode:svcCode,
					mClass:mClass,
				},
				success:function(data){
					alert("학과정보 입력 성공!");
				},
				error:function(error){
					alert("학과정보 입력 실패!");
				}
			});
		});
		
		// 입력한 학과정보 수정하기
		$('#deptUpdate').click(function(){
			var svcCode = "MAJOR";
			var mClass = this.form.mClass.value;
// 			console.log("svcCode : " + svcCode);
// 			console.log("mClass : " + mClass);
			$.ajax({
				url:'/resumeDeptUpdate',
				type:'POST',
				data:{
					svcCode:svcCode,
					mClass:mClass,
				},
				success:function(data){
					alert("학과정보 수정 성공!");
				},
				error:function(error){
					alert("학과정보 수정 실패!");
				}
			});
		});
		
		// 입력한 자격증정보 저장하기
		$('#certInsert').click(function(){
			var jmFldNm = this.form.jmFldNm.value;
			var acquireDate = this.form.acquireDate.value;
// 			console.log("jmFldNm : " + jmFldNm);
// 			console.log("acquireDate : " + acquireDate);
			$.ajax({
				url:'/resumeCertInsert',
				type:'POST',
				data:{
					jmFldNm:jmFldNm,
					acquireDate:acquireDate,
				},
				success:function(data){
					alert("자격증정보 입력 성공!");
				},
				error:function(error){
					alert("자격증정보 입력 실패!");
				}
			});
		});
		
		// 입력한 자격증정보 수정하기
		$('#certUpdate').click(function(){
			var jmFldNm = this.form.jmFldNm.value;
			var acquireDate = this.form.acquireDate.value;
// 			console.log("jmFldNm : " + jmFldNm);
// 			console.log("acquireDate : " + acquireDate);
			$.ajax({
				url:'/resumeCertUpdate',
				type:'POST',
				data:{
					jmFldNm:jmFldNm,
					acquireDate:acquireDate,
				},
				success:function(data){
					alert("자격증정보 수정 성공!");
				},
				error:function(error){
					alert("자격증정보 수정 실패!");
				}
			});
		});
		
		$('#resumeSubmit').click(function(){
			$('#resumeAction').attr("action", "/home");
			$('#resumeAction').attr("method", "post");
			$('#resumeAction').submit();
		});
		
	});
</script>
<style>
	
</style>
</head>
<body>
<!-- 
	1. 이력서 입력
	2. 이력서 수정
	3. 이력서 초기화 (pw확인은 천천히)
 -->
<t:insertDefinition name="layout">
	<t:putAttribute name="body">
		<div class="w3-card-2" style="width:70%; margin-left: 15%;">
			<div class="w3-container w3-dark-grey">
			  <h2>내 이력서 관리</h2>
			</div>
			<br/>
			<div>
				<div><h3>개인정보</h3></div>
				<table class="w3-table w3-striped w3-border ">
					<tr>
						<td>이름 :</td>
						<td>${infoMember.infoMemberName}</td>
					</tr>
					<tr>
						<td>생년월일 :</td>
						<td>${infoMember.infoMemberBirth}</td>
					</tr>
					<tr>
						<td>전화번호 :</td>
						<td>${infoMember.infoMemberPhone}</td>
					</tr>
					<tr>
						<td>이메일 :</td>
						<td>${infoMember.infoMemberEmail}</td>
					</tr>
				</table>
			</div>
			
			<!-- ****학교**** -->
			<form id="schoolAction" class="form-inline" role="form">
				<input type="hidden" name="svcCode" value="SCHOOL"/>
				<br/><br/>
				<div>
					<div><h3>최종학력</h3></div>
					<br/>
					<div>
						<span>
							<select id="gubun" class="form-control" name="gubun">
								<c:choose>
									<c:when test="${resumeSchool.gubun eq 'elem_list'}">
										<option value="${resumeSchool.gubun}">초등학교</option>
									</c:when>
									<c:when test="${resumeSchool.gubun eq 'midd_list'}">
										<option value="${resumeSchool.gubun}">중학교</option>
									</c:when>
									<c:when test="${resumeSchool.gubun eq 'high_list'}">
										<option value="${resumeSchool.gubun}">고등학교</option>
									</c:when>
									<c:when test="${resumeSchool.gubun eq 'univ_list'}">
										<option value="${resumeSchool.gubun}">대학교</option>
									</c:when>
									<c:when test="${resumeSchool.gubun eq 'seet_list'}">
										<option value="${resumeSchool.gubun}">특수/기타학교</option>
									</c:when>
									<c:when test="${resumeSchool.gubun eq 'alte_list'}">
										<option value="${resumeSchool.gubun}">대안학교</option>
									</c:when>
									<c:otherwise>
										<option value="">::선택::</option>
									</c:otherwise>
								</c:choose>
								<option value="elem_list">초등학교</option>
								<option value="midd_list">중학교</option>
								<option value="high_list">고등학교</option>
								<option value="univ_list">대학교</option>
								<option value="seet_list">특수/기타학교</option>
								<option value="alte_list">대안학교</option>
							</select>
						</span>
					
						<span>학교명 : <input class="form-control" type="text" name="schoolName" value="${resumeSchool.schoolName}" placeholder="학교명"/></span>
						<!-- !!!!!!!!!!!검색기능 추가하기!!!!!!!!!!!! -->
<!-- 						<span><input id="schoolSearch" type="button" value="검색"></span> -->
						<span>
							<select class="form-control" name="resumeSchoolCondition">
								<c:choose>
									<c:when test="${empty resumeSchool.resumeSchoolCondition}">
										<option value="">::선택::</option>
									</c:when>
									<c:otherwise>
										<option value="${resumeSchool.resumeSchoolCondition}">${resumeSchool.resumeSchoolCondition}</option>
									</c:otherwise>
								</c:choose>
								<option value="졸업(예정)">졸업(예정)</option>
								<option value="재학중">재학중</option>
								<option value="휴학중">휴학중</option>
								<option value="중퇴">중퇴</option>
							</select>
						</span>
					</div>
					<div>
						<span>입학일 : <input class="form-control" type="date" name="startDate" value="${resumeSchool.startDate}"/></span>
						<span>졸업(예정)일 : <input class="form-control" type="date" name="endDate" value="${resumeSchool.endDate}"/></span>
					</div>
					<br/>
					<div>
						<c:choose>
							<c:when test="${empty resumeSchool}">
								<span><input id="schoolInsert" class="w3-btn w3-dark-grey" type="button" value="저장"></span>
							</c:when>
							<c:otherwise>
								<span><input id="schoolUpdate" class="w3-btn w3-dark-grey" type="button" value="수정"></span>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</form>
			<hr>
			<!-- ****학교 끝**** -->

			<!-- ****학과**** -->
			<form id="deptAction" class="form-inline" role="form">
				<input type="hidden" name="svcCode" value="MAJOR"/>
				<br/>
				<div>
					<div><h3>학과</h3></div>
					<br/>
					<div>
						<span>학과명 : <input type="text" class="form-control" name="mClass" value="${resumeDept.mClass}" placeholder="학과명"/></span>
						<!-- !!!!!!!!!!!검색기능 추가하기!!!!!!!!!!!! -->
<!-- 						<span><input class="deptSearch" type="button" value="검색"></span> -->
					</div>
					<br/>
					<div>
						<c:choose>
							<c:when test="${empty resumeDept}">
								<span><input id="deptInsert" class="w3-btn w3-dark-grey" type="button" value="저장"></span>
							</c:when>
							<c:otherwise>
								<span><input id="deptUpdate" class="w3-btn w3-dark-grey" type="button" value="수정"></span>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</form>
			<br>
			<div>
				<!-- ajax로 추가 하기 (차후)-->
<!-- 				<span><input id="schoolAndDeptAdd" type="button" value="학력추가"></span> -->
			</div>
			<hr>
			<!-- ****학과 끝**** -->
			
			<!-- ****자격증**** -->
			<form id="certAction" class="form-inline" role="form">
			<br/>
				<div>
					<div><h3>자격증</h3></div>
					<br/>
					<div>
						<!-- 검색버튼 누르면 새창에서 자격증 계열명 리스트 출력 해보자!-->
<!-- 						<span><input type="button" name="" value="검색" onclick="window.open('http://naver.com')"/></span> -->
						<span>자격증명 : <input type="text" class="form-control" name="jmFldNm" value="${resumeCert.jmFldNm}" placeholder="자격증명"/></span>
						<!-- !!!!!!!!!!!검색기능 추가하기!!!!!!!!!!!! -->
<!-- 						<span><input class="certSearch" type="button" value="검색"></span> -->
						<span>취득일 : <input type="date" class="form-control" name="acquireDate" value="${resumeCert.acquireDate}"/></span>						
					</div>
					<br/>
					<div id="certUpdateBtn">
						<c:choose>
							<c:when test="${empty resumeCert}">
								<span><input id="certInsert" class="w3-btn w3-dark-grey" type="button" value="저장"></span>
							</c:when>
							<c:otherwise>
								<span><input id="certUpdate" class="w3-btn w3-dark-grey" type="button" value="수정"></span>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</form>
			<br><br>
			<div>
				<!-- ajax로 추가 하기 -->
<!-- 				<span><input id="certAdd" type="button" value="자격증추가"></span> -->
			</div>
			<!-- ****자격증 끝**** -->
			
			
<%-- 		언어, 경력, 자기소개서는 일단 보류...
			<!-- ****언어**** -->
			<form id="langAction" class="form-inline" role="form">
				<div>
					<div><h2>외국어 능력</h2></div>
					<div>
						<select class="form-control" name="langName">
							<c:choose>
								<c:when test="${resumeLang.langName}">
									<option value="${resumeLang.langName}">${resumeLang.langName}</option>
								</c:when>
								<c:otherwise>
									<option value="">::선택::</option>
								</c:otherwise>
							</c:choose>
							<option value="한국어">한국어</option>
							<option value="영어">영어</option>
							<option value="중국어">중국어</option>
							<option value="일본어">일본어</option>
							<option value="스페인어">스페인어</option>
							<option value="프랑스어">프랑스어</option>
							<option value="독일어">독일어</option>
							<option value="러시아어">러시아어</option>
							<option value="기타">기타</option>
						</select>
						<label>
						어학연수
						<select class="form-control">
							<option>연수기간</option>
							<option>1년미만</option>
							<option>1년</option>
							<option>2년</option>
							<option>3년이상</option>
						</select>
						</label>
					</div>
					<div class="checkbox">
						<label><input type="checkbox" class="form-control" name="highLevel" value=""/>일상 대화가능</label>
						<label><input type="checkbox" class="form-control" name="middleLevel" value=""/>간단한 대화가능</label>
						<label><input type="checkbox" class="form-control" name="lowLevel" value=""/>기본인사만 가능</label>
					</div>
					<div>
						<input type="text" class="form-control" name="officialTest" placeholder="공인시험"/>
						<input type="text" class="form-control" name="grade" placeholder="점수/등급"/>
						<input type="text" class="form-control" name="langAcquirementDate" placeholder="취득년도"/>
					</div>
					<div>
						<span><input id="langSubmit" type="button" value="저장"></span>
					</div>
				</div>
			</form>
			<br>
			<div>
				<!-- ajax로 추가 하기 -->
				<span><input id="langAdd" type="button" value="자격증추가"></span>
			</div>
			<!-- ****언어 끝**** -->
			<hr>
			<!-- ****경력**** -->
			<form id="careerAction" class="form-inline" role="form">
				<div>
					<div><h2>경력</h2></div>
					<div>
						<input type="text" class="form-control" name="companyName" placeholder="회사명"/>
						<select class="form-control">
							<option>근무형태</option>
							<option>아르바이트</option>
							<option>계약직</option>
							<option>정규직</option>
							<option>인턴쉽</option>
							<option>기타</option>
						</select>
					</div>
					<div>
						<input type="text" class="form-control" name="position" placeholder="담당업무"/>
					</div>
					<div>
						<input type="text" class="form-control" name="careerStartDate" placeholder="시작일"/>
						~
						<input type="text" class="form-control" name="careerEndDate" placeholder="종료일"/>
					</div>
					<div>
						<span><input id="careerSubmit" type="button" value="저장"></span>
					</div>
				</div>
			</form>
			<!-- ****경력 끝**** -->
			<hr>
			<!-- ****자기소개서**** -->
			<form id="introAction" class="form-inline" role="form">
				<div>
					<div><h2>자기소개서</h2></div>
					<div class="form-group">
						<textarea class="form-control" rows="20" cols="150" name="content"></textarea>
					</div>
					<div>
						<span><input id="introSubmit" type="button" value="저장"></span>
					</div>
				</div>
			</form>
			<!-- ****자기소개서 끝**** -->
 --%>
		</div>
		<br/><br/>
		<form id="resumeAction" class="w3-container">
			<div align="center">
				<span><input id="resumeSubmit" class="w3-btn w3-dark-grey" type="button" value="확인"/></span>
			</div>
		</form>
	</t:putAttribute>
</t:insertDefinition>
</body>
</html>