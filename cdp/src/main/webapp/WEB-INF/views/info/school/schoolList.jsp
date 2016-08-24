<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SchoolList</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#schoolSearch").click(function(){
			$("#schoolListAction").attr("action", "/infoSchoolList");
			$("#schoolListAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
		<!-- 학교 리스트 -->
		<div id="infoSchool" align="center">
			<h1>학교 리스트</h1><br/>
			<table class="w3-table w3-striped w3-border ">
				<tr class="w3-dark-grey">
					<%-- <th>학교코드</th> --%>
					<th>지역</th>
					<th>설립유형</th>
					<th>학교유형</th>
					<th>학교종류</th>
					<th>학교명</th>
					<th>주소</th>
					<th>링크</th>
				</tr>
				<c:forEach var="isl" items="${infoSchoolList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
					<tr>
						<%-- <td>${isl.seq}</td> --%>
						<td>${isl.region}</td>
						<td>${isl.estType}</td>
						<td>${isl.schoolType}</td>
						<td>${isl.schoolGubun}</td>
						<td><a href="/infoSchoolDetail?seq=${isl.seq}&searchType=${searchType}&searchWord=${searchWord}" style="font-weight: bold;">${isl.schoolName}</a></td>
						<td>${isl.adres}</td>
						<td>${isl.link}</td>
					</tr>
				</c:forEach>
			</table>
			<br/>
				<div>
					<form id="schoolListAction" action="">
						<div>
							<span>
								<select name="searchType">
									<option value="">::검색조건::</option>
									<option value="region">지역</option>
									<option value="schoolGubun">학교종류</option>
									<option value="schoolName">학교명</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="schoolSearch" class="w3-btn w3-dark-grey" type="button" value="검색"/></span>
						</div>
						
					<!-- 페이징 -->
						<div>
							<!-- 첫페이지로 이동 -->
							<span>
								<a href="/infoSchoolList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">처음</a>
							</span>
							
							<!-- 이전페이지로 이동 -->
							<c:if test="${pageHelper.clickPage>1}">
								<span>
									<a href="/infoSchoolList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">이전</a>
								</span>
							</c:if>
							
							<!-- 페이징작업(1,2,3, ... , 9, 10 -->
							<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
								<c:choose>
									<c:when test="${pageNo eq pageHelper.clickPage}">
										<span><a href="/infoSchoolList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}"><font class="page" style="font-weight: bold;">${pageNo}</font></a></span>
									</c:when>
									<c:otherwise>
										<span><a href="/infoSchoolList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- 다음페이지으로 이동 -->
							<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
								<span>
									<a href="/infoSchoolList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">다음</a>
								</span>
							</c:if>
							
							<!-- 10페이지 뒤로 이동 -->
							<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
								<span>
									<a href="/infoSchoolList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10페이지 뒤로</a>
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