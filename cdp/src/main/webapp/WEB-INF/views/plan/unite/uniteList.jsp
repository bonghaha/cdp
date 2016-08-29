<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goInfoJobList").click(function(){
			$("#uniteListAction").attr("action", "/infoJobList");
			$('#uniteListAction').attr("method", "get");
			$("#uniteListAction").submit();
		});
	});
</script>
<style>
	.ul_fontMain{
		font-size: 18px;
		font-weight: bold;
	}
	.ul_fontSub{
		font-size: 13px;	
	}
</style>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
		<div id="infoJob">
				<div class="w3-container" align="center">
				  <h1>커리어 플래너</h1>
				  <p>단계별로 원하는 직업에 대한 학교,학과,자격증 플랜을 짜 봅시다!</p>
				  <br/><br/>
				  <ul class="w3-pagination w3-border w3-round w3-xlarge">
				    <li><a href="/planUniteInsert?jobdicSeq=${infoJob.jobdicSeq}">&laquo;</a></li>
				    <li><a href="/infoJobList">
				    	<font class="ul_fontMain">직업리스트</font><br/>
				    	<font class="ul_fontSub">직업을 선택하세요</font></a></li>
				    <li><a href="/infoJobDetail?searchType=${searchType}&searchWord=${searchWord}">
				    	<font class="ul_fontMain">직업상세보기</font><br/>
				    	<font class="ul_fontSub">계획을 등록을 클릭 해주세요</font></a></li>
				    <li><a href="/planUniteInsert?jobdicSeq=${infoJob.jobdicSeq}">
				    	<font class="ul_fontMain">계획 등록</font><br/>
				    	<font class="ul_fontSub">계획 등록을 해주세요</font></a></li>
				    <li><a class="w3-blue-grey" href="/planUniteList">
				    	<font class="ul_fontMain">계획리스트</font><br/>
				    	<font class="ul_fontSub">계획리스트를 선택 해주세요</font></a></li>
				    <li><a href="/planUniteDetail?planUniteCode=${pul.planUniteCode}&jobdicSeq=${pul.jobdicSeq}">
				    	<font class="ul_fontMain">계획 상세보기</font><br/>
				    	<font class="ul_fontSub">각각의 계획을 등록 해주세요</font></a></li>
				    <li><a href="#">
				    	<font class="ul_fontMain">계획 통합 리스트</font><br/>
				    	<font class="ul_fontSub">세부적인 계획을 작성 해주세요</font></a></li>
				    <li><a href="/planUniteDetail?planUniteCode=${pul.planUniteCode}&jobdicSeq=${pul.jobdicSeq}">&raquo;</a></li>
				  </ul>
				</div>
				<br/><br/>
				<h1>계획 통합</h1>
				<br/>
				<div>
				<form id="uniteListAction" action="">
					<input type="hidden" name="jobdicSeq" value="${infoJob.jobdicSeq}"/>
					<h3>${sessionScope.memberLoginId}님의 계획리스트</h3>
					<table class="w3-table w3-striped w3-border ">
						<tr class="w3-dark-grey">
							<th>직업명</th>
							<th>제목</th>
							<th>등록일</th>
						</tr>
						<c:choose>
							<c:when test="${empty planUniteList}">
								<tr>
									<td colspan="3">등록하신 계획이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="pul" items="${planUniteList}">
									<tr>
										<td>${pul.job}</td>
										<td><a href="/planUniteDetail?planUniteCode=${pul.planUniteCode}&jobdicSeq=${pul.jobdicSeq}" style="font-weight: bold;">${pul.planUniteTitle}</a></td>
										<td>${pul.planUniteRegisterDate}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<br/>
					<div align="center">
						<span><input id="goInfoJobList" class="w3-btn w3-dark-grey" type="button" value="계획등록하기"/></span>
					</div>	
				</form>
			</div>
		</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>