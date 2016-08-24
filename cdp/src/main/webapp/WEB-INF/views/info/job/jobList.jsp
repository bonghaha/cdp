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
		$("#goHome").click(function(){
			$("#jobListAction").attr("action", "/home");
			$("#jobListAction").submit();
		});
		$("#jobSearch").click(function(){
			$("#jobListAction").attr("action", "/infoJobList");
			$("#jobListAction").submit();
		});
	});
</script>
<style>
	#infoJob{
		width: 100%;
	}
	.jl_fontMain{
		font-size: 18px;
		font-weight: bold;
	}
	.jl_fontSub{
		font-size: 13px;
	}
	.page {
		text-decoration: none;
		color: black;
	}
</style>
</head>
<body>
	<t:insertDefinition name="layout">
	
		<!-- body -->
		<t:putAttribute name="body">
		
			<!-- 직업 리스트 -->
			<div id="infoJob">
				<div class="w3-container" align="center">
				  <h1>커리어 플래너</h1>
				  <p>단계별로 원하는 직업에 대한 학교,학과,자격증 플랜을 짜 봅시다!</p>
				  <br/><br/>
				  <ul class="w3-pagination w3-border w3-round w3-xlarge">
				    <li><a href="#">&laquo;</a></li>
				    <li><a class="w3-blue-grey" href="/infoJobList">
				    	<font class="jl_fontMain">직업리스트</font><br/>
				    	<font class="jl_fontSub">직업을 선택하세요</font></a></li>
				    <li><a href="/infoJobDetail?searchType=${searchType}&searchWord=${searchWord}">
				    	<font class="jl_fontMain">직업상세보기</font><br/>
				    	<font class="jl_fontSub">계획을 등록을 클릭 해주세요</font></a></li>
				    <li><a href="/planUniteInsert">
				    	<font class="jl_fontMain">계획 등록</font><br/>
				    	<font class="jl_fontSub">계획 등록을 해주세요</font></a></li>
				    <li><a href="#">
				    	<font class="jl_fontMain">계획리스트</font><br/>
				    	<font class="jl_fontSub">계획리스트를 선택 해주세요</font></a></li>
				    <li><a href="#">
				    	<font class="jl_fontMain">계획 상세보기</font><br/>
				    	<font class="jl_fontSub">각각의 계획을 등록 해주세요</font></a></li>
				    <li><a href="#">
				    	<font class="jl_fontMain">계획 통합 리스트</font><br/>
				    	<font class="jl_fontSub">세부적인 계획을 작성 해주세요</font></a></li>
				    <li><a href="#">&raquo;</a></li>
				  </ul>
				</div>
				<br/><br/>
				<h1>직업 리스트</h1>
				<table class="w3-table w3-striped w3-border ">
					<tr class="w3-dark-grey">
						<th>직업명</th>
						<th>직업분야</th>
						<th>고용평등</th>
						<th>발전가능성</th>
						<th>전망</th>
						<th>연봉</th>
					</tr>
					<c:forEach var="ijl" items="${infoJobList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
							<tr>
								<td><a href="/infoJobDetail?jobdicSeq=${ijl.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}" style="font-weight: bold;">${ijl.job}</a></td>
								<td>${ijl.profession}</td>
								<td>${ijl.equalemployment}</td>
								<td>${ijl.possibility}</td>
								<td>${ijl.prospect}</td>
								<td>${ijl.salery}</td>
							</tr>
					</c:forEach>
				</table>
				<br/>
				<div align="center">
					<form id="jobListAction" action="">
						<div>
							<span>
								<select name="searchType">
									<option value="">검색</option>
									<option value="job">직업명</option>
									<option value="profession">직업분야</option>
									<option value="equalemployment">고용평등</option>
									<option value="possibility">발전가능성</option>
									<option value="prospect">전망</option>
									<option value="salery">연봉</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="jobSearch" class="w3-btn w3-dark-grey" type="button" value="검색"/></span>
						</div>
						
						<!-- 페이징 -->
						<div>
							<!-- 첫페이지로 이동 -->
							<span>
								<a href="/infoJobList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}"><font class="page">처음</font></a>
							</span>
							
							<!-- 이전페이지로 이동 -->
							<c:if test="${pageHelper.clickPage>1}">
								<span>
									<a href="/infoJobList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}"><font class="page">이전</font></a>
								</span>
							</c:if>
							
							<!-- 페이징작업(1,2,3, ... , 9, 10 -->
							<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
								<c:choose>
									<c:when test="${pageNo eq pageHelper.clickPage}">
										<span><a href="/infoJobList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}"><font class="page" style="font-weight: bold;">${pageNo}</font></a></span>
									</c:when>
									<c:otherwise>
										<span><a href="/infoJobList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}"><font class="page">${pageNo}</font></a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- 다음페이지으로 이동 -->
							<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
								<span>
									<a href="/infoJobList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}"><font class="page">다음</font></a>
								</span>
							</c:if>
							
							<!-- 10페이지 뒤로 이동 -->
							<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
								<span>
									<a href="/infoJobList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}"><font class="page">10페이지 뒤로</font></a>
								</span>
							</c:if>
						</div>
						<br/>
					</form>
				</div>	
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>