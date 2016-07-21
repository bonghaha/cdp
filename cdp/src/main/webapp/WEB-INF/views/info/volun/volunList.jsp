<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>봉사활동리스트</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goHome").click(function(){
			$("#volunListAction").attr("action", "/home");
			$("#volunListAction").submit();
		});
		$("#goInsert").click(function(){
			$("#volunListAction").attr("action", "/infoVolunInsert");
			$("#volunListAction").submit();
		});
		$("#volunSearch").click(function(){
			$("#volunListAction").attr("action", "/infoVolunList");
			$("#volunListAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- 봉사활동 리스트 -->
			<h1>봉사활동 리스트</h1>
			<div>
				<table>
					<tr>
						<th>봉사활동코드</th>
						<th>대륙</th>
						<th>국가</th>
						<th>주제</th>
						<th>봉사활동명</th>
					</tr>
					<c:forEach var="ivl" items="${infoVolunList}">
						<tr>
							<td>${ivl.infoVolunCode}</td>
							<td>${ivl.infoVolunContinent}</td>
							<td>${ivl.infoVolunCountry}</td>
							<td>${ivl.infoVolunTitle}</td>
							<td><a href="/infoVolunDetail?infoVolunCode=${ivl.infoVolunCode}&searchType=${searchType}&searchWord=${searchWord}">${ivl.infoVolunName}</a></td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<form id="volunListAction" action="">
						<div>
							<span>
								<select name="searchType">
									<option value="">::검색조건::</option>
									<option value="info_volun_continent">대륙</option>
									<option value="info_volun_country">국가</option>
									<option value="info_volun_title">주제</option>
									<option value="info_volun_name">봉사활동명</option>
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