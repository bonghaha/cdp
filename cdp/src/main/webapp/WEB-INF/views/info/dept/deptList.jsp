<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DeptList</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#deptSearch").click(function(){
			$("#deptListAction").attr("action", "/infoDeptList");
			$("#deptListAction").submit();
		});
	});
</script>
<style>
.infoDept {
	width: 80%;
}

</style>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- 학과 리스트 -->
			<div id="infoDept" align="center">
				<h1>학과 리스트</h1><br/>
				<table class="w3-table w3-striped w3-border ">
					<tr class="w3-dark-grey">
						<th>계열</th>
						<th>학과</th>
					</tr>
					<c:forEach var="idl" items="${infoDeptList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td>${idl.lClass}</td>
							<td><a href="/infoDeptDetail?majorSeq=${idl.majorSeq}&searchType=${searchType}&searchWord=${searchWord}" style="font-weight: bold;">${idl.mClass}</a></td>
						</tr>
					</c:forEach>
				</table>
				<br/>
				<form id="deptListAction" action="">
					<div>
						<span>
							<select name="searchType">
								<option value="">::검색조건::</option>
								<option value="lClass">계열</option>
								<option value="mClass">학과</option>
								<option value="facilName">세부학과명</option>
							</select>
						</span>
						<span><input type="text" name="searchWord"/></span>
						<span><input id="deptSearch" class="w3-btn w3-dark-grey" type="button" value="검색"/></span>
					</div>
					
					<!-- 페이징 -->
					<div>
					
						<!-- 첫페이지로 이동 -->
						<span>
							<a href="/infoDeptList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">처음</a>
						</span>
						
						<!-- 이전페이지로 이동 -->
						<c:if test="${pageHelper.clickPage>1}">
							<span>
								<a href="/infoDeptList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">이전</a>
							</span>
						</c:if>
						
						<!-- 페이징작업(1,2,3, ... , 9, 10 -->
						<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
							<c:choose>
								<c:when test="${pageNo eq pageHelper.clickPage}">
									<span><a href="/infoDeptList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}"><font class="page" style="font-weight: bold;">${pageNo}</font></a></span>
								</c:when>
								<c:otherwise>
									<span><a href="/infoDeptList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<!-- 다음페이지으로 이동 -->
						<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
							<span>
								<a href="/infoDeptList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">다음</a>
							</span>
						</c:if>
						
						<!-- 10페이지 뒤로 이동 -->
						<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
							<span>
								<a href="/infoDeptList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10페이지 뒤로</a>
							</span>
						</c:if>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>