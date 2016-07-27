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
			$("#volunInsertAction").attr("action", "/infoJobDetail");
			$("#volunInsertAction").submit();
		});
		$("#goHome").click(function(){
			$("#volunInsertAction").attr("action", "/home");
			$("#volunInsertAction").submit();
		});

		$("#goRecVolunList").click(function(){
			$("#volunInsertAction").attr("action","/recVolunList");
			$("#volunInsertAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- 추천봉사활동 등록 -->
			<h1>추천봉사활동 등록</h1>
			<div>
				<table>
					<tr>
						<th>번호</th>
						<th>대륙</th>
						<th>국가</th>
						<th>주제</th>
						<th>봉사활동</th>
<%-- 						<th>추천상태</th> --%>
					</tr>
					<c:forEach var="ivl" items="${infoVolunList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td>${ivl.infoVolunCode}</td>
							<td>${ivl.infoVolunContinent}</td>
							<td>${ivl.infoVolunCountry}</td>
							<td>${ivl.infoVolunTitle}</td>
							<td><a href="/recVolunDetailInsert?infoVolunCode=${ivl.infoVolunCode}&infoJobCode=${infoJob.infoJobCode}&searchType=${searchType}&searchWord=${searchWord}">${ivl.infoVolunName}</a></td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<form id="volunInsertAction" action="">
						<input type="hidden" name="infoJobCode" value="${infoJob.infoJobCode}">
						<div>
							<span>
								<select name="searchType">
									<option value="">::검색조건::</option>
									<option value="info_volun_continent">대륙</option>
									<option value="info_volun_country">국가</option>
									<option value="info_volun_title">주제</option>
									<option value="info_volun_name">봉사활동</option>
									<option value="rec_cert_condition">추천상태</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="volunSearch" type="button" value="검색"/></span>
						</div>
						
						<!-- 페이징 -->
						<div>
							<!-- 첫페이지로 이동 -->
							<span>
								<a href="/infoVolunList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">처음</a>
							</span>
							
							<!-- 이전페이지로 이동 -->
							<c:if test="${pageHelper.clickPage>1}">
								<span>
									<a href="/infoVolunList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">이전</a>
								</span>
							</c:if>
							
							<!-- 페이징작업(1,2,3, ... , 9, 10 -->
							<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
								<c:choose>
									<c:when test="${pageNo eq pageHelper.clickPage}">
										<span><a href="/infoVolunList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:when>
									<c:otherwise>
										<span><a href="/infoVolunList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- 다음페이지으로 이동 -->
							<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
								<span>
									<a href="/infoVolunList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">다음</a>
								</span>
							</c:if>
							
							<!-- 10페이지 뒤로 이동 -->
							<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
								<span>
									<a href="/infoVolunList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10페이지 뒤로</a>
								</span>
							</c:if>
						</div>

						<!-- 홈으로 가기 -->
						<div>
							<span><input id="goBack" type="button" value="뒤로가기"/></span>
							<span><input id="goHome" type="button" value="홈으로 가기"/></span>
							<span><input id="goRecVolunList" type="button" value="추천봉사활동리스트"/></span>
						</div>
					</form>
				</div>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>