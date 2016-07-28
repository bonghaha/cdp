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
			$("#bookListAction").attr("action", "/infoJobDetail");
			$("#bookListAction").submit();
		});
		$("#goHome").click(function(){
			$("#bookListAction").attr("action", "/home");
			$("#bookListAction").submit();
		});

		$("#goRecBookInsert").click(function(){
			$("#bookListAction").attr("action","/recBookInsert");
			$("#bookListAction").submit();
		});
		
		$("#bookSearch").click(function(){
			$("#bookListAction").attr("action", "/recBookList");
			$("#bookListAction").submit();
		});
		
		/* 선택한 추천들 계획으로 보내기 */
		$("#goPlanBookInsert").click(function(){
			var recBookCode = [];	//배열 초기화
			$("#bookListAction").attr("action","/planBookInsert");
			$("#recBookCheck:checked").each(function(){
				recBookCode.push($(this).val());	//배열에 체크된것들 각각의 value 값 푸쉬푸쉬
			});
			$("#bookListAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- 도서 리스트 -->
			<h1>추천 도서 리스트</h1>
			<div>
				<form id="bookListAction" action="">
					<input type="hidden" name="infoJobCode" value="${infoJob.infoJobCode}">
					<table>
						<tr>
							<th>선택</th>
							<th>번호</th>
							<th>장르</th>
							<th>출판사</th>
							<th>저자</th>
							<th>도서명</th>
							<th>추천상태</th>
							<th>추천이유</th>
							<th>추천내용</th>
							<th>추천등록일</th>
						</tr>
						<c:forEach var="rbl" items="${recBookListWithRecBookCondition}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
							<tr>
								<td><input id="recBookCheck" type="checkbox" name="recBookCode" value="${rbl.recBookCode}"></td>
								<td>${rbl.infoBookCode}</td>
								<td>${rbl.infoBookGenre}</td>
								<td>${rbl.infoBookInstitute}</td>
								<td>${rbl.infoBookWriter}</td>
								<td><a href="/infoBookDetail?infoBookCode=${rbl.infoBookCode}&searchType=${searchType}&searchWord=${searchWord}">${rbl.infoBookName}</a></td>
								<td>${rbl.recBookCondition}</td>
								<td>${rbl.recBookReason}</td>
								<td>${rbl.recBookContent}</td>
								<td>${rbl.recBookRegisterDate}</td>
							</tr>
						</c:forEach>
					</table>
					<div>
						<span>
							<select name="searchType">
								<option value="">::검색조건::</option>
								<option value="info_book_name">도서명</option>
								<option value="info_book_genre">장르</option>
								<option value="info_book_institute">출판사</option>
								<option value="info_book_writer">저자</option>
							</select>
						</span>
						<span><input type="text" name="searchWord"/></span>
						<span><input id="bookSearch" type="button" value="검색"/></span>
					</div>
					
					<!-- 페이징 -->
					<div>
						<!-- 첫페이지로 이동 -->
						<span>
							<a href="/infoBookList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">처음</a>
						</span>
						
						<!-- 이전페이지로 이동 -->
						<c:if test="${pageHelper.clickPage>1}">
							<span>
								<a href="/infoBookList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">이전</a>
							</span>
						</c:if>
						
						<!-- 페이징작업(1,2,3, ... , 9, 10 -->
						<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
							<c:choose>
								<c:when test="${pageNo eq pageHelper.clickPage}">
									<span><a href="/infoBookList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
								</c:when>
								<c:otherwise>
									<span><a href="/infoBookList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<!-- 다음페이지으로 이동 -->
						<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
							<span>
								<a href="/infoBookList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">다음</a>
							</span>
						</c:if>
						
						<!-- 10페이지 뒤로 이동 -->
						<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
							<span>
								<a href="/infoBookList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10페이지 뒤로</a>
							</span>
						</c:if>
					</div>
					
					<!-- 홈으로 가기 -->
					<div>
						<span><input id="goBack" type="button" value="뒤로가기"/></span>
						<span><input id="goHome" type="button" value="HOME"/></span>
						<span><input id="goRecBookInsert" type="button" value="도서리스트보기"/></span>
						<span><input id="goPlanBookInsert" type="button" value="계획등록"/></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>