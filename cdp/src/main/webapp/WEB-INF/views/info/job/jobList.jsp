<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	table,th,tr,td{
		border : 1px black solid;
	}
</style>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- 직업 리스트 -->
			<div>
				<table>
					<tr>
						<th>직업코드</th>
						<th>직업코드ID</th>
						<th>직업명</th>
						<th>직업분야</th>
						<th>적성유형별코드</th>
						<th>직업분류코드</th>
						<th>고용평등</th>
						<th>발전가능성</th>
						<th>전망</th>
						<th>연봉</th>
					</tr>
					<c:forEach var="ijl" items="${infoJobList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
							<tr>
								<td>${ijl.infoJobCode}</td>
								<td>${ijl.infoJobdicSeq}</td>
								<td><a href="/infoJobDetail?infoJobdicSeq=${ijl.infoJobdicSeq}&infoSummary=${ijl.infoSummary}&searchType=${searchType}&searchWord=${searchWord}">${ijl.infoJob}</a></td>
								<td>${ijl.infoProfession}</td>
								<td>${ijl.infoAptdTypeCode}</td>
								<td>${ijl.infoJobCtgCode}</td>
								<td>${ijl.infoEqualemployment}</td>
								<td>${ijl.infoPossibility}</td>
								<td>${ijl.infoProspect}</td>
								<td>${ijl.infoSalery}</td>
							</tr>
					</c:forEach>
				</table>
				<div>
					<form id="jobListAction" action="">
						<div>
							<span>
								<select name="searchType">
									<option value="">검색</option>
									<option value="job">직업명</option>
									<option value="infoProfession">직업분야</option>
									<option value="infoEqualemployment">고용평등</option>
									<option value="infoPossibility">발전가능성</option>
									<option value="infoProspect">전망</option>
									<option value="infoSalery">연봉</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="jobSearch" type="button" value="검색"/></span>
						</div>
						
						<!-- 페이징 -->
						<div>
							<!-- 첫페이지로 이동 -->
							<span>
								<a href="/infoJobList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">처음</a>
							</span>
							
							<!-- 이전페이지로 이동 -->
							<c:if test="${pageHelper.clickPage>1}">
								<span>
									<a href="/infoJobList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">이전</a>
								</span>
							</c:if>
							
							<!-- 페이징작업(1,2,3, ... , 9, 10 -->
							<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
								<c:choose>
									<c:when test="${pageNo eq pageHelper.clickPage}">
										<span><a href="/infoJobList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:when>
									<c:otherwise>
										<span><a href="/infoJobList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- 다음페이지으로 이동 -->
							<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
								<span>
									<a href="/infoJobList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">다음</a>
								</span>
							</c:if>
							
							<!-- 10페이지 뒤로 이동 -->
							<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
								<span>
									<a href="/infoJobList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10페이지 뒤로</a>
								</span>
							</c:if>
						</div>

						<!-- 홈으로 가기 -->
						<div>
							<span>
								<input id="goHome" type="button" value="홈으로 가기"/>
							</span>
						</div>
					</form>
				</div>	
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>