<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>bookList</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goBack").click(function(){
			$("#jobTInsertAction").attr("action", "/infoJobDetail");
			$("#jobTInsertAction").submit();
		});
		$("#goHome").click(function(){
			$("#jobTInsertAction").attr("action", "/home");
			$("#jobTInsertAction").submit();
		});

		$("#goRecJobTList").click(function(){
			$("#jobTInsertAction").attr("action","/recJobTList");
			$("#jobTInsertAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- 추천직업훈련 등록 -->
			<h1>추천직업훈련 등록</h1>
			<div>
				<table>
					<tr>
						<th>번호</th>
						<th>대상</th>
						<th>지역</th>
						<th>기관명</th>
						<th>과정명</th>
						<th>시작일</th>
						<th>종료일</th>
<%-- 						<th>추천상태</th> --%>
					</tr>
					<c:forEach var="ibl" items="${infoJobTList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td>${ibl.infoJobTCode}</td>
							<td>${ibl.infoJobTTarget}</td>
							<td>${ibl.infoJobTLocation}</td>
							<td>${ibl.infoJobTInstitute}</td>
							<td><a href="/recJobTDetailInsert?infoJobTCode=${ibl.infoJobTCode}&infoJobCode=${infoJob.infoJobCode}&searchType=${searchType}&searchWord=${searchWord}">${ibl.infoJobTCourse}</a></td>
							<td>${ibl.infoJobTStartDate}</td>
							<td>${ibl.infoJobTEndDate}</td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<form id="jobTInsertAction" action="">
						<input type="hidden" name="infoJobCode" value="${infoJob.infoJobCode}">
						<div>
							<span>
								<select name="searchType">
									<option value="">::검색조건::</option>
									<option value="info_jobt_target">대상</option>
									<option value="info_jobt_location">지역</option>
									<option value="info_jobt_institute">기관명</option>
									<option value="info_jobt_course">과정명</option>
									<option value="rec_jobt_condition">추천상태</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="jobTSearch" type="button" value="검색"/></span>
						</div>
						
						<!-- 페이징 -->
						<div>
							<!-- 첫페이지로 이동 -->
							<span>
								<a href="/infoJobTList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">처음</a>
							</span>
							
							<!-- 이전페이지로 이동 -->
							<c:if test="${pageHelper.clickPage>1}">
								<span>
									<a href="/infoJobTList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">이전</a>
								</span>
							</c:if>
							
							<!-- 페이징작업(1,2,3, ... , 9, 10 -->
							<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
								<c:choose>
									<c:when test="${pageNo eq pageHelper.clickPage}">
										<span><a href="/infoJobTList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:when>
									<c:otherwise>
										<span><a href="/infoJobTList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- 다음페이지으로 이동 -->
							<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
								<span>
									<a href="/infoJobTList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">다음</a>
								</span>
							</c:if>
							
							<!-- 10페이지 뒤로 이동 -->
							<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
								<span>
									<a href="/infoJobTList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10페이지 뒤로</a>
								</span>
							</c:if>
						</div>

						<!-- 홈으로 가기 -->
						<div>
							<span><input id="goBack" type="button" value="뒤로가기"/></span>
							<span><input id="goHome" type="button" value="홈으로 가기"/></span>
							<span><input id="goRecJobTList" type="button" value="추천직업훈련리스트"/></span>
						</div>
					</form>
				</div>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>