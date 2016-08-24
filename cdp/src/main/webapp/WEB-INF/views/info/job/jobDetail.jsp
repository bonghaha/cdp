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
$(document).ready(function(){
	$("#goJobList").click(function(){
		$("#jobDetailAction").attr("action", "/infoJobList");
		$("#jobDetailAction").submit();
	});
	/* 추천등록 */
	$("#recSchoolInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recSchoolInsert");
		$("#jobDetailAction").submit();
	});
	$("#recDeptInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recDeptInsert");
		$("#jobDetailAction").submit();
	});
	$("#recCertInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recCertInsert");
		$("#jobDetailAction").submit();
	});
	
	/* 추천리스트 */
	$("#recSchoolList").click(function(){
		$("#jobDetailAction").attr("action", "/recSchoolList");
		$("#jobDetailAction").submit();
	});
	$("#recDeptList").click(function(){
		$("#jobDetailAction").attr("action", "/recDeptList");
		$("#jobDetailAction").submit();
	});
	$("#recCertList").click(function(){
		$("#jobDetailAction").attr("action", "/recCertList");
		$("#jobDetailAction").submit();
	});
	
	$("#goPlanUniteInsert").click(function(){
		$("#jobDetailAction").attr("action", "/planUniteInsert");
		$("#jobDetailAction").attr("method", "get");
		$("#jobDetailAction").submit();
	});
	$("#goPlanUniteList").click(function(){
		$("#jobDetailAction").attr("action", "/planUniteList");
		$("#jobDetailAction").attr("method", "get");
		$("#jobDetailAction").submit();
	});
	
});
</script>		
<style>
	.jd_fontMain{
		font-size: 18px;
		font-weight: bold;
	}
	.jd_fontSub{
		font-size: 13px;
	}
</style>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
		<div id="infoJobDetail">
			<div class="w3-container" align="center">
				<h1>커리어 플래너</h1>
				<p>단계별로 원하는 직업에 대한 학교,학과,자격증 플랜을 짜 봅시다!</p>
				<br/><br/>
				<ul class="w3-pagination w3-border w3-round w3-xlarge">
					<li>
						<a href="#">&laquo;</a>
					</li>
					<li>
						<a href="/infoJobList">
						<font class="jd_fontMain">직업리스트</font><br/>
						<font class="jd_fontSub">직업을 선택하세요</font></a>
					</li>
					<li>
						<a class="w3-blue-grey" href="/infoJobDetail?jobdicSeq=${ijl.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">
						<font class="jd_fontMain">직업상세보기</font><br/>
						<font class="jd_fontSub">계획을 등록을 클릭 해주세요</font></a>
					</li>
					<li>
						<a href="/planUniteInsert">
						<font class="jd_fontMain">계획 등록</font><br/>
						<font class="jd_fontSub">계획 등록을 해주세요</font></a>
					</li>
					<li>
						<a href="#">
						<font class="jd_fontMain">계획리스트</font><br/>
						<font class="jd_fontSub">계획리스트를 선택 해주세요</font></a>
					</li>
					<li>
						<a href="#">
						<font class="jd_fontMain">계획 상세보기</font><br/>
						<font class="jd_fontSub">각각의 계획을 등록 해주세요</font></a>
					</li>
					<li>
						<a href="#">
						<font class="jd_fontMain">계획 통합 리스트</font><br/>
						<font class="jd_fontSub">세부적인 계획을 작성 해주세요</font></a>
					</li>
					<li>
						<a href="#">&raquo;</a>
					</li>
				</ul>
			</div>
			<br/><br/>
			<h1>직업 상세보기</h1>
			<div>
				<div style="text-align: center;">
					<table class="w3-table w3-striped w3-border">
						<tr class="w3-dark-grey">
							<th>직업명</th>
							<th>직업분야</th>
							<th>직업설명</th>
							<th>유사직업</th>
							<th>고용평등</th>
							<th>발전가능성</th>
							<th>전망</th>
							<th>연봉</th>
						</tr>
						<c:if test="${infoJob != null}">
							<tr>
								<td>${infoJob.job}</td>
								<td>${infoJob.profession}</td>
								<td>${infoJob.summary}</td>
								<td>${infoJob.similarJob}</td>
								<td>${infoJob.equalemployment}</td>
								<td>${infoJob.possibility}</td>
								<td>${infoJob.prospect}</td>
								<td>${infoJob.salery}</td>
							</tr>
						</c:if>
					</table>
				</div>
				<div>
					<form id="jobDetailAction" action="">
						<input type="hidden" name="jobdicSeq" value="${infoJob.jobdicSeq}"/>
						<input type="hidden" name="job" value="${infoJob.job}"/>
						<input type="hidden" name="searchType" value="${searchType}"/>
						<input type="hidden" name="searchWord" value="${searchWord}"/>
						<div align="center">
							<span><input class="w3-btn w3-dark-grey" id="goJobList" type="button" value="리스트로 가기"/></span>
						</div>
						<hr>
						<c:choose>
							<c:when test="${infoMember.infoMemberLevel eq 1}">
								관리자
								<div>
									<span><input class="w3-btn w3-dark-grey" id="recSchoolInsert" type="button" value="추천학교추가"/></span>
									<span><input class="w3-btn w3-dark-grey" id="recDeptInsert" type="button" value="추천학과추가"/></span>
									<span><input class="w3-btn w3-dark-grey" id="recCertInsert" type="button" value="추천자격증추가"/></span>
								</div>
								<br>
								<div>
									<span><input class="w3-btn w3-dark-grey" id="recSchoolList" type="button" value="추천학교리스트"/></span>
									<span><input class="w3-btn w3-dark-grey" id="recDeptList" type="button" value="추천학과리스트"/></span>
									<span><input class="w3-btn w3-dark-grey" id="recCertList" type="button" value="추천자격증리스트"/></span>
								</div>
								<br>
								<div align="center">
									<span><input class="w3-btn w3-dark-grey" id="goPlanUniteInsert" type="button" value="계획등록"></span>
									<span><input class="w3-btn w3-dark-grey" id="goPlanUniteList" type="button" value="계획리스트"/></span>
								</div>
							</c:when>
							
							<c:when test="${infoMember.infoMemberLevel eq 0}">
								<div>
									<span><input class="w3-btn w3-dark-grey" id="recSchoolList" type="button" value="추천학교리스트"/></span>
									<span><input class="w3-btn w3-dark-grey" id="recDeptList" type="button" value="추천학과리스트"/></span>
									<span><input class="w3-btn w3-dark-grey" id="recCertList" type="button" value="추천자격증리스트"/></span>
								</div>
								<br>
								<div align="center">
									<span><input class="w3-btn w3-dark-grey" id="goPlanUniteInsert" type="button" value="계획등록"></span>
									<span><input class="w3-btn w3-dark-grey" id="goPlanUniteList" type="button" value="계획리스트"/></span>
								</div>
							</c:when>
						</c:choose>
					</form>
				</div>
			</div>
		</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>