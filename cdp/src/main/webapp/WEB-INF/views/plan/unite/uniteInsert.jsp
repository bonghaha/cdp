<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직업 등록</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancel").click(function(){
			$("#insertAction").attr("action", "/home");
			$("#insertAction").attr("method", "get");
			$("#insertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#insertAction").attr("action", "/planUniteInsert");
			$("#insertAction").attr("method", "post");
			$("#insertAction").submit();
		});
	});
</script>
<style>
	.ui_fontMain{
		font-size: 18px;
		font-weight: bold;
	}
	.ui_fontSub{
		font-size: 13px;	
	}
</style>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
		<div id="uniteInsert">
				<div class="w3-container" align="center">
				  <h1>커리어 플래너</h1>
				  <p>단계별로 원하는 직업에 대한 학교,학과,자격증 플랜을 짜 봅시다!</p>
				  <br/><br/>
				  <ul class="w3-pagination w3-border w3-round w3-xlarge">
				    <li><a href="/infoJobDetail?jobdicSeq=${planUnite.jobdicSeq}&job=${planUnite.job}&searchType=${searchType}&searchWord=${searchWord}">&laquo;</a></li>
				    <li><a href="/infoJobList">
				    	<font class="ui_fontMain">직업리스트</font><br/>
				    	<font class="ui_fontSub">직업을 선택하세요</font></a></li>
				    <li><a href="/infoJobDetail?jobdicSeq=${planUnite.jobdicSeq}&job=${planUnite.job}&searchType=${searchType}&searchWord=${searchWord}">
				    	<font class="ui_fontMain">직업상세보기</font><br/>
				    	<font class="ui_fontSub">계획을 등록을 클릭 해주세요</font></a></li>
				    <li><a class="w3-blue-grey" href="/planUniteInsert?jobdicSeq=${infoJob.jobdicSeq}">
				    	<font class="ui_fontMain">계획 등록</font><br/>
				    	<font class="ui_fontSub">계획 등록을 해주세요</font></a></li>
				    <li><a href="/planUniteList">
				    	<font class="ui_fontMain">계획리스트</font><br/>
				    	<font class="ui_fontSub">계획리스트를 선택 해주세요</font></a></li>
				    <li><a href="#">
				    	<font class="ui_fontMain">계획 상세보기</font><br/>
				    	<font class="ui_fontSub">각각의 계획을 등록 해주세요</font></a></li>
				    <li><a href="#">
				    	<font class="ui_fontMain">계획 통합 리스트</font><br/>
				    	<font class="ui_fontSub">세부적인 계획을 작성 해주세요</font></a></li>
				    <li><a href="/planUniteList">&raquo;</a></li>
				  </ul>
				</div>
				<br/><br/>
				<div class="w3-card-2" style="width:70%; margin-left: 15%;">
					<div class="w3-container w3-dark-grey">
					  <h2>계획 등록</h2>
					</div>
					<form id="insertAction" class="w3-container" action="">
						<input type="hidden" name="infoMemberId" value="${planUnite.infoMemberId}"/>
						<input type="hidden" name="jobdicSeq" value="${planUnite.jobdicSeq}"/>
						<input type="hidden" name="job" value="${planUnite.job}"/>
						<br/>
						<p>
							<label class="w3-label w3-text-dark-grey"><b>계획 제목 : </b></label>
							<input class="w3-input w3-border" name="planUniteTitle" type="text">
						</p>
						<br/>
						<p>
							<label class="w3-label w3-text-dark-grey"><b>내용 요약 : </b></label>
							<textarea class="w3-input w3-border" rows="4" cols="100" name="planUniteContent"></textarea>
						</p>
						<br/>
						<p align="center">
							<input id="insertCancel" class="w3-btn w3-dark-grey" type="button" value="취소"/>
							<input id="insertSubmit" class="w3-btn w3-dark-grey" type="button" value="확인"/>
						</p>
					</form>
				</div>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>