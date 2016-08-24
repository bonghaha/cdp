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
		$("#jobSearch").click(function(){
			$("#jobListAction").attr("action", "/infoJobList");
			$("#jobListAction").submit();
		});
	});
</script>
<style>
	/* table,th,tr,td{
		border : 1px black solid;
	} */
	
	#infoJob{
		/* overflow: scroll; */
	}
</style>
</head>
<body>
	<t:insertDefinition name="layout">
	
		<!-- body -->
		<t:putAttribute name="body">
		
			<!-- 직업 리스트 -->
			<div id="infoJob" align="center">
			<h1>직업 리스트</h1><br/>
				<table class="w3-table w3-striped w3-border ">
					<tr class="w3-dark-grey">
						<%-- <th>직업코드</th>
						<th>직업코드ID</th> --%>
						<th>직업명</th>
						<th>직업분야</th>
						<%-- <th>적성유형별코드</th>
						<th>직업분류코드</th> --%>
						<th>고용평등</th>
						<th>발전가능성</th>
						<th>전망</th>
						<th>연봉</th>
					</tr>
					<c:forEach var="ijl" items="${infoJobList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
							<tr>
								<%-- <td>${ijl.jobCode}</td>
								<td>${ijl.jobdicSeq}</td> --%>
								<td><a href="/infoJobDetail?jobdicSeq=${ijl.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}" style="font-weight: bold;">${ijl.job}</a></td>
								<td>${ijl.profession}</td>
								<%-- <td>${ijl.aptdTypeCode}</td>
								<td>${ijl.jobCtgCode}</td> --%>
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
										<span><a href="/infoJobList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}"><font class="page" style="font-weight: bold;">${pageNo}</font></a></span>
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
						<br/>
					</form>
				</div>	
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>