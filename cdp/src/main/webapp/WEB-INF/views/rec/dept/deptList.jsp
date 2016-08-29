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
		$("#goBack").click(function(){
			$("#deptListAction").attr("action", "/infoJobDetail");
			$("#deptListAction").submit();
		});
		$("#goHome").click(function(){
			$("#deptListAction").attr("action", "/home");
			$("#deptListAction").submit();
		});

		$("#goRecDeptInsert").click(function(){
			$("#deptListAction").attr("action","/recDeptInsert");
			$("#deptListAction").submit();
		});
		$("#certSearch").click(function(){
			$("#deptListAction").attr("action", "/recDeptList");
			$("#deptListAction").submit();
		});
		
		/* 선택한 추천들 계획으로 보내기 */
		$("#goPlanDeptInsert").click(function(){
			var recDeptCode = [];	//배열 초기화
			$("#deptListAction").attr("action","/planDeptInsert");
			$("#recDeptCheck:checked").each(function(){
				recDeptCode.push($(this).val());	//배열에 체크된것들 각각의 value 값 푸쉬푸쉬
			});
			$("#deptListAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- 학과 리스트 -->
			<h1>추천 학과 리스트</h1>
			<div align="center">
				<form id="deptListAction" action="">
					<input type="hidden" name="jobdicSeq" value="${infoJob.jobdicSeq}">
					<input type="hidden" name="recDeptCode" value="${recDept.recDeptCode}">
					<input type="hidden" name="majorSeq" value="${recDept.majorSeq}">
					<table class="w3-table w3-striped w3-border">
						<tr class="w3-dark-grey">
							<%-- <th>번호</th> --%>
							<th>학과계열</th>
							<th>학과명</th>
							<%-- <th>추천상태</th> --%>
							<th width="400px">추천이유</th>
							<th width="400px">추천내용</th>
							<th>추천등록일</th>
						</tr>
						<c:forEach var="rwidl" items="${recWithInfoDeptList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
							<tr>
								<%-- <td>${rwidl.majorSeq}</td> --%>
								<td>${rwidl.lClass}</td>
								<td><a href="/infoDeptDetail?majorSeq=${rwidl.majorSeq}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">${rwidl.mClass}</a></td>
								<%-- <td>${rwidl.recDeptCondition}</td> --%>
								<td>${rwidl.recDeptReason}</td>
								<td>${rwidl.recDeptContent}</td>
								<td>${rwidl.recDeptRegisterDate}</td>
							</tr>
						</c:forEach>
					</table>
					<br/>
					<div align="center">
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
							<a href="/recDeptList?clickPage=1&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">처음</a>
						</span>
						
						<!-- 이전페이지로 이동 -->
						<c:if test="${pageHelper.clickPage>1}">
							<span>
								<a href="/recDeptList?clickPage=${pageHelper.clickPage-1}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">이전</a>
							</span>
						</c:if>
						
						<!-- 페이징작업(1,2,3, ... , 9, 10 -->
						<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
							<c:choose>
								<c:when test="${pageNo eq pageHelper.clickPage}">
									<span><a href="/recDeptList?clickPage=${pageNo}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}"><font style="font-weight: bold;">${pageNo}</font></a></span>
								</c:when>
								<c:otherwise>
									<span><a href="/recDeptList?clickPage=${pageNo}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<!-- 다음페이지으로 이동 -->
						<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
							<span>
								<a href="/recDeptList?clickPage=${pageHelper.clickPage+1}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">다음</a>
							</span>
						</c:if>
						
						<!-- 10페이지 뒤로 이동 -->
						<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
							<span>
								<a href="/recDeptList?clickPage=${pageHelper.clickPage+10}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">10페이지 뒤로</a>
							</span>
						</c:if>
					</div>
					<br/>
					<!-- 홈으로 가기 -->
					<div>
						<span><input id="goBack" class="w3-btn w3-dark-grey" type="button" value="뒤로가기"/></span>
						<!-- <span><input id="goRecDeptInsert" class="w3-btn w3-dark-grey"type="button" value="학과리스트보기"/></span> -->
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>