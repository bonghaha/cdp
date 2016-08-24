<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goBack").click(function(){
			$("#schoolListAction").attr("action", "/infoJobDetail");
			$("#schoolListAction").submit();
		});
		$("#goHome").click(function(){
			$("#schoolListAction").attr("action", "/home");
			$("#schoolListAction").submit();
		});

		$("#goRecSchoolInsert").click(function(){
			$("#schoolListAction").attr("action","/recSchoolInsert");
			$("#schoolListAction").submit();
		});
		
		$("#schoolSearch").click(function(){
			$("#schoolListAction").attr("action", "/recSchoolList");
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
			<h1>추천 학교 리스트</h1>
			<div>
				<form id="schoolListAction" action="">
					<input type="hidden" name="jobdicSeq" value="${infoJob.jobdicSeq}">
					<input type="hidden" name="recSchoolCode" value="${recSchool.recSchoolCode}">
					<input type="hidden" name="seq" value="${recSchool.seq}">
					<table>
						<tr>
							<th>학교코드</th>
							<th>지역</th>
							<th>설립유형</th>
							<th>학교유형</th>
							<th>학교종류</th>
							<th>학교명</th>
							<th>추천상태</th>
							<th>추천이유</th>
							<th>추천내용</th>
							<th>추천등록일</th>
						</tr>
						<c:forEach var="rwisl" items="${recWithInfoSchoolList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
							<tr>
								<td>${rwisl.seq}</td>
								<td>${rwisl.region}</td>
								<td>${rwisl.estType}</td>
								<td>${rwisl.schoolType}</td>
								<td>${rwisl.schoolGubun}</td>
								<td><a href="/infoSchoolDetail?seq=${rwisl.seq}&jobdicSeq=${rwisl.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">${rwisl.schoolName}</a></td>
								<td>${rwisl.recSchoolCondition}</td>
								<td>${rwisl.recSchoolReason}</td>
								<td>${rwisl.recSchoolContent}</td>
								<td>${rwisl.recSchoolRegisterDate}</td>
							</tr>
						</c:forEach>
					</table>
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
						<span><input id="schoolSearch" type="button" value="검색"/></span>
					</div>
					
					<!-- 페이징 -->
					<div>
						<!-- 첫페이지로 이동 -->
						<span>
							<a href="/recSchoolList?clickPage=1&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">처음</a>
						</span>
						
						<!-- 이전페이지로 이동 -->
						<c:if test="${pageHelper.clickPage>1}">
							<span>
								<a href="/recSchoolList?clickPage=${pageHelper.clickPage-1}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">이전</a>
							</span>
						</c:if>
						
						<!-- 페이징작업(1,2,3, ... , 9, 10 -->
						<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
							<c:choose>
								<c:when test="${pageNo eq pageHelper.clickPage}">
									<span><a href="/recSchoolList?clickPage=${pageNo}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
								</c:when>
								<c:otherwise>
									<span><a href="/recSchoolList?clickPage=${pageNo}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<!-- 다음페이지으로 이동 -->
						<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
							<span>
								<a href="/recSchoolList?clickPage=${pageHelper.clickPage+1}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">다음</a>
							</span>
						</c:if>
						
						<!-- 10페이지 뒤로 이동 -->
						<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
							<span>
								<a href="/recSchoolList?clickPage=${pageHelper.clickPage+10}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">10페이지 뒤로</a>
							</span>
						</c:if>
					</div>
					
					<!-- 홈으로 가기 -->
					<div>
						<span><input id="goBack" type="button" value="뒤로가기"/></span>
						<span><input id="goHome" type="button" value="HOME"/></span>
						<span><input id="goRecSchoolInsert" type="button" value="학교리스트보기"/></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>