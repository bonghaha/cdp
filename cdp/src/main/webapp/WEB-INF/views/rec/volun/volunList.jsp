<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goBack").click(function(){
			$("#volunListAction").attr("action", "/infoJobDetail");
			$("#volunListAction").submit();
		});
		$("#goHome").click(function(){
			$("#volunListAction").attr("action", "/home");
			$("#volunListAction").submit();
		});

		$("#goRecVolunInsert").click(function(){
			$("#volunListAction").attr("action","/recVolunInsert");
			$("#volunListAction").submit();
		});
		$("#volunSearch").click(function(){
			$("#volunListAction").attr("action", "/recVolunList");
			$("#volunListAction").submit();
		});
		
		/* 선택한 추천들 계획으로 보내기 */
		$("#goPlanVolunInsert").click(function(){
			var recVolunCode = [];	//배열 초기화
			$("#volunListAction").attr("action","/planVolunInsert");
			$("#recVolunCheck:checked").each(function(){
				recVolunCode.push($(this).val());	//배열에 체크된것들 각각의 value 값 푸쉬푸쉬
			});
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
			<h1>추천 봉사활동 리스트</h1>
			<div>
				<form id="volunListAction" action="">
					<input type="hidden" name="infoJobCode" value="${infoJob.infoJobCode}">
					<table>
						<tr>
							<th>번호</th>
							<th>대륙</th>
							<th>국가</th>
							<th>주제</th>
							<th>봉사활동</th>
							<th>추천상태</th>
							<th>추천이유</th>
							<th>추천내용</th>
							<th>추천등록일</th>
						</tr>
						<c:forEach var="rvl" items="${recVolunListWithRecVolunCondition}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
							<tr>
								<td>${rvl.infoVolunCode}</td>
								<td>${rvl.infoVolunContinent}</td>
								<td>${rvl.infoVolunCountry}</td>
								<td>${rvl.infoVolunTitle}</td>
								<td><a href="/infoVolunDetail?infoVolunCode=${rvl.infoVolunCode}&searchType=${searchType}&searchWord=${searchWord}">${rvl.infoVolunName}</a></td>
								<td>${rvl.recVolunCondition}</td>
								<td>${rvl.recVolunReason}</td>
								<td>${rvl.recVolunContent}</td>
								<td>${rvl.recVolunRegisterDate}</td>
							</tr>
						</c:forEach>
					</table>
					<div>
						<span>
							<select name="searchType">
								<option value="">::검색조건::</option>
								<option value="info_volun_continent">대륙</option>
								<option value="info_volun_country">국가</option>
								<option value="info_volun_title">주제</option>
								<option value="info_volun_name">봉사활동</option>
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
						<span><input id="goHome" type="button" value="HOME"/></span>
						<span><input id="goRecVolunInsert" type="button" value="봉사활동리스트보기"/></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>