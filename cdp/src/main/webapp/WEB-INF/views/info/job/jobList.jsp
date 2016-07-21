<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goHome").click(function(){
			$("#jobListAction").attr("action", "/home");
			$("#jobListAction").submit();
		});
		$("#goInsert").click(function(){
			$("#jobListAction").attr("action", "/infoJobInsert");
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
						<th>직업분류번호</th>
						<th>대분류명</th>
						<th>중분류명</th>
						<th>소분류명</th>
						<th>세분류명</th>
						<th>능력단위명</th>
						<th>분류정보</th>
						<th>직업정보</th>
						<th>구분</th>
						<th>적용년도</th>
						<th>변경횟차</th>
						<th>등록일</th>
						<th>등록자</th>
					</tr>
					<c:forEach var="ijl" items="${infoJobList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td>${ijl.infoJobCode}</td>
							<td>${ijl.infoJobBigName}</td>
							<td>${ijl.infoJobMiddleName}</td>
							<td>${ijl.infoJobSmallName}</td>
							<td>${ijl.infoJobDetailName}</td>
							<td><a href="/infoJobDetail?infoJobCode=${ijl.infoJobCode}&searchType=${searchType}&searchWord=${searchWord}">${ijl.infoJobUnitName}</a></td>
							<td>${ijl.infoJobDetailInfo}</td>
							<td>${ijl.infoJobInfo}</td>
							<td>${ijl.infoJobCondition}</td>
							<td>${ijl.infoJobApplyYear}</td>
							<td>${ijl.infoJobChangeCount}</td>
							<td>${ijl.infoJobRegisterDate}</td>
							<td>${ijl.infoJobRegisterName}</td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<form id="jobListAction" action="">
						<div>
							<span>
								<select name="searchType">
									<option value="">검색</option>
									<option value="info_job_bigname">대분류명</option>
									<option value="info_job_middlename">중분류명</option>
									<option value="info_job_smallname">소분류명</option>
									<option value="info_job_detailname">세분류명</option>
									<option value="info_job_unitname">능력단위명</option>
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