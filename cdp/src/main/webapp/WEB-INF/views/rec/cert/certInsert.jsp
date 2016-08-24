<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bookList</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goBack").click(function(){
			$("#certInsertAction").attr("action", "/infoJobDetail");
			$("#certInsertAction").submit();
		});
		$("#goHome").click(function(){
			$("#certInsertAction").attr("action", "/home");
			$("#certInsertAction").submit();
		});

		$("#goRecCertList").click(function(){
			$("#certInsertAction").attr("action","/recCertList");
			$("#certInsertAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- 추천자격증 등록 -->
			<h1>추천자격증 등록</h1>
			<div>
				<table>
					<tr>
						<th>종목코드</th>
						<th>종목명</th>
						<th>대직무분야코드</th>
						<th>대직무분야명</th>
						<th>중직무분야코드</th>
						<th>중직무분야명</th>
						<th>계열코드</th>
						<th>계열명</th>
						<th>자격구분</th>
						<th>자격구분명</th>
					</tr>
					<c:forEach var="icl" items="${infoCertList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td>${icl.jmCd}</td>
							<td><a href="/recCertDetailInsert?jmCd=${icl.jmCd}&jmFldNm=${icl.jmFldNm}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">${icl.jmFldNm}</a></td>
							<td>${icl.obligFldCd}</td>
							<td>${icl.obligFldNm}</td>
							<td>${icl.mdobligFldCd}</td>
							<td>${icl.mdobligFldNm}</td>
							<td>${icl.seriesCd}</td>
							<td>${icl.seriesNm}</td>
							<td>${icl.qualgbCd}</td>
							<td>${icl.qualgbNm}</td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<form id="certInsertAction" action="">
						<input type="hidden" name="jobdicSeq" value="${infoJob.jobdicSeq}">
						<input type="hidden" name="recCertCode" value="${recCert.recCertCode}">
						<input type="hidden" name="jmCd" value="${recCert.jmCd}">
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
								<a href="/recCertInsert?clickPage=1&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">처음</a>
							</span>
							
							<!-- 이전페이지로 이동 -->
							<c:if test="${pageHelper.clickPage>1}">
								<span>
									<a href="/recCertInsert?clickPage=${pageHelper.clickPage-1}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">이전</a>
								</span>
							</c:if>
							
							<!-- 페이징작업(1,2,3, ... , 9, 10 -->
							<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
								<c:choose>
									<c:when test="${pageNo eq pageHelper.clickPage}">
										<span><a href="/recCertInsert?clickPage=${pageNo}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:when>
									<c:otherwise>
										<span><a href="/recCertInsert?clickPage=${pageNo}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- 다음페이지으로 이동 -->
							<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
								<span>
									<a href="/recCertInsert?clickPage=${pageHelper.clickPage+1}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">다음</a>
								</span>
							</c:if>
							
							<!-- 10페이지 뒤로 이동 -->
							<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
								<span>
									<a href="/recCertInsert?clickPage=${pageHelper.clickPage+10}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">10페이지 뒤로</a>
								</span>
							</c:if>
						</div>

						<!-- 홈으로 가기 -->
						<div>
							<span><input id="goBack" type="button" value="뒤로가기"/></span>
							<span><input id="goHome" type="button" value="홈으로 가기"/></span>
							<span><input id="goRecCertList" type="button" value="추천자격증리스트"/></span>
						</div>
					</form>
				</div>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>