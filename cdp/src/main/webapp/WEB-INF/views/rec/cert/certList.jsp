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
			$("#certListAction").attr("action", "/infoJobDetail");
			$("#certListAction").submit();
		});
		$("#goHome").click(function(){
			$("#certListAction").attr("action", "/home");
			$("#certListAction").submit();
		});

		$("#goRecCertInsert").click(function(){
			$("#certListAction").attr("action","/recCertInsert");
			$("#certListAction").submit();
		});
		$("#certSearch").click(function(){
			$("#certListAction").attr("action", "/recCertList");
			$("#certListAction").submit();
		});
		
		/* 선택한 추천들 계획으로 보내기 */
		$("#goPlanCertInsert").click(function(){
			var recCertCode = [];	//배열 초기화
			$("#certListAction").attr("action","/planCertInsert");
			$("#recCertCheck:checked").each(function(){
				recCertCode.push($(this).val());	//배열에 체크된것들 각각의 value 값 푸쉬푸쉬
			});
			$("#certListAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- 자격증 리스트 -->
			<h1>추천 자격증 리스트</h1>
			<div>
				<form id="certListAction" action="">
					<input type="hidden" name="jobdicSeq" value="${infoJob.jobdicSeq}">
					<input type="hidden" name="recCertCode" value="${recCert.recCertCode}">
					<input type="hidden" name="jmCd" value="${recCert.jmCd}">
					<table>
						<tr>
							<th>선택</th>
							<th>자격증코드</th>
							<th>자격증명</th>
							<th>대직무분야명</th>
							<th>중직무분야명</th>
							<th>추천상태</th>
							<th>추천이유</th>
							<th>추천내용</th>
							<th>추천등록일</th>
						</tr>
						<c:forEach var="rwicl" items="${recWithInfoCertList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
							<tr>
								<td><input id="recCertCheck" type="checkbox" name="recCertCode" value="${rwicl.recCertCode}"></td>
								<td>${rwicl.jmCd}</td>
								<td><a href="/infoCertDetail?jmCd=${rwicl.jmCd}&jobdicSeq=${rwicl.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">${rwicl.jmFldNm}</a></td>
								<td>${rwicl.obligFldNm}</td>
								<td>${rwicl.mdobligFldNm}</td>
								<td>${rwicl.recCertCondition}</td>
								<td>${rwicl.recCertReason}</td>
								<td>${rwicl.recCertContent}</td>
								<td>${rwicl.recCertRegisterDate}</td>
							</tr>
						</c:forEach>
					</table>
					<div>
						<span>
							<select name="searchType">
								<option value="">::검색조건::</option>
								<option value="jmFldNm">자격증명</option>
								<option value="obligFldNm">대직무분야명</option>
								<option value="mdobligFldNm">중직무분야명</option>
							</select>
						</span>
						<span><input type="text" name="searchWord"/></span>
						<span><input id="certSearch" type="button" value="검색"/></span>
					</div>
					
					<!-- 페이징 -->
					<div>
						<!-- 첫페이지로 이동 -->
						<span>
							<a href="/recCertList?clickPage=1&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">처음</a>
						</span>
						
						<!-- 이전페이지로 이동 -->
						<c:if test="${pageHelper.clickPage>1}">
							<span>
								<a href="/recCertList?clickPage=${pageHelper.clickPage-1}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">이전</a>
							</span>
						</c:if>
						
						<!-- 페이징작업(1,2,3, ... , 9, 10 -->
						<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
							<c:choose>
								<c:when test="${pageNo eq pageHelper.clickPage}">
									<span><a href="/recCertList?clickPage=${pageNo}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
								</c:when>
								<c:otherwise>
									<span><a href="/recCertList?clickPage=${pageNo}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<!-- 다음페이지으로 이동 -->
						<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
							<span>
								<a href="/recCertList?clickPage=${pageHelper.clickPage+1}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">다음</a>
							</span>
						</c:if>
						
						<!-- 10페이지 뒤로 이동 -->
						<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
							<span>
								<a href="/recCertList?clickPage=${pageHelper.clickPage+10}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">10페이지 뒤로</a>
							</span>
						</c:if>
					</div>
					
					<!-- 홈으로 가기 -->
					<div>
						<span><input id="goBack" type="button" value="뒤로가기"/></span>
						<span><input id="goHome" type="button" value="HOME"/></span>
						<span><input id="goRecCertInsert" type="button" value="자격증리스트보기"/></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>