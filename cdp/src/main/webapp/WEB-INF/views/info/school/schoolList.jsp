<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SchoolList</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goHome").click(function(){
			$("#schoolListAction").attr("action", "/home");
			$("#schoolListAction").submit();
		});
		$("#goInsert").click(function(){
			$("#schoolListAction").attr("action", "/infoSchoolInsert");
			$("#schoolListAction").submit();
		});
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
		<h1>학교 리스트</h1>
		<div>
			<table>
				<tr>
					<th>학교코드</th>
					<th>지역</th>
					<th>학교유형</th>
					<th>학교명</th>
				</tr>
				<c:forEach var="is" items="${infoSchoolList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
					<tr>
						<td>${is.infoSchoolCode}</td>
						<td>${is.infoSchoolBigName}</td>
						<td>${is.infoSchoolMiddleName}</td>
						<td><a href="/infoSchoolDetail?infoSchoolCode=${is.infoSchoolCode}&searchType=${searchType}&searchWord=${searchWord}">${is.infoSchoolName}</a></td>
					</tr>
				</c:forEach>
			</table>
				<div>
					<form id="schoolListAction" action="">
						<div>
							<span>
								<select name="searchType">
									<option value="">::검색조건::</option>
									<option value="info_school_bigname">지역</option>
									<option value="info_school_middlename">학교유형</option>
									<option value="info_school_name">학교명</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="schoolSearch" type="button" value="검색"/></span>
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
										<span><a href="/infoSchoolList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
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
						
						<!-- 홈으로 가기 -->
						<div>
							<span>
								<input id="goHome" type="button" value="홈으로 가기"/>
							</span>
							<span>
								<input id="goInsert" type="button" value="입력"/>
							</span>
						</div>
					</form>
				</div>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>