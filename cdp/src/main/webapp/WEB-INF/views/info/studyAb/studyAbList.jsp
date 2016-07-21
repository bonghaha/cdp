<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>어학연수 리스트</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goHome").click(function(){
			$("#studyAbListAction").attr("action", "/home");
			$("#studyAbListAction").submit();
		});
		$("#goInsert").click(function(){
			$("#studyAbListAction").attr("action", "/infoStudyAbInsert");
			$("#studyAbListAction").submit();
		});
		$("#studyAbSearch").click(function(){
			$("#studyAbListAction").attr("action", "/infoStudyAbList");
			$("#studyAbListAction").submit();
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
			<!-- 어학연수 리스트 -->
			<div>
				<table>
					<tr>
						<th>어학연수분류 번호</th>
						<th>지역</th>
						<th>기관명</th>
						<th>언어</th>
					</tr>
					<c:forEach var="isal" items="${infoStudyAbList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td><a href="/infoStudyAbDetail?infoStudyAbCode=${isal.infoStudyAbCode}&searchType=${searchType}&searchWord=${searchWord}">${isal.infoStudyAbCode}</a></td>
							<td>${isal.infoStudyAbLocation}</td>
							<td>${isal.infoStudyAbInstitute}</td>
							<td>${isal.infoStudyAbLang}</td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<!-- 검색 -->
					<form id="studyAbListAction" action="">
						<div>
							<span>
								<select name="searchType">
									<option value="">::검색조건::</option>
									<option value="info_studyab_location">지역</option>
									<option value="info_studyab_institute">기관명</option>
									<option value="info_studyab_lang">언어</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="studyAbSearch" type="button" value="검색"/></span>
						</div>
						
						<!-- 페이징 -->
						<div>
							<!-- 첫페이지로 이동 -->
							<span>
								<a href="/infoStudyAbList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">처음</a>
							</span>
							
							<!-- 이전페이지로 이동 -->
							<c:if test="${pageHelper.clickPage>1}">
								<span>
									<a href="/infoStudyAbList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">이전</a>
								</span>
							</c:if>
							
							<!-- 페이징작업(1,2,3, ... , 9, 10 -->
							<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
								<c:choose>
									<c:when test="${pageNo eq pageHelper.clickPage}">
										<span><a href="/infoStudyAbList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:when>
									<c:otherwise>
										<span><a href="/infoStudyAbList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- 다음페이지으로 이동 -->
							<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
								<span>
									<a href="/infoStudyAbList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">다음</a>
								</span>
							</c:if>
							
							<!-- 10페이지 뒤로 이동 -->
							<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
								<span>
									<a href="/infoStudyAbList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10페이지 뒤로</a>
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