<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>memberList</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goHome").click(function(){
			$("#memberListAction").attr("action", "/home");
			$("#memberListAction").submit();
		});
		$("#goInsert").click(function(){
			$("#memberListAction").attr("action", "/infoMemberInsert");
			$("#memberListAction").submit();
		});
		$("#memberSearch").click(function(){
			$("#memberListAction").attr("action", "/infoMemberList");
			$("#memberListAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="footer">
			<!-- 회원 리스트 -->
			<div>
				<table>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>생일</th>
						<th>등급</th>
						<th>회원가입일</th>
					</tr>
					<c:forEach var="iml" items="${infoMemberList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td><a href="/infoMemberDetail?infoMemberCode=${iml.infoMemberCode}&searchType=${searchType}&searchWord=${searchWord}">${iml.infoMemberId}</a></td>
							<td>${iml.infoMemberName}</td>
							<td>${iml.infoMemberPhone}</td>
							<td>${iml.infoMemberEmail}</td>
							<td>${iml.infoMemberBirth}</td>
							<td>${iml.infoMemberLevel}</td>
							<td>${iml.infoMemberJoinDate}</td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<form id="memberListAction" action="">
						<!-- 검색하기 -->
						<div>
							<span>
								<select name="searchType">
									<option value="">::검색조건::</option>
									<option value="info_member_id">아이디</option>
									<option value="info_member_name">이름</option>
									<option value="info_member_level">등급</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="memberSearch" type="button" value="검색"/></span>
						</div>
						
						<!-- 페이징 -->
						<div>
							<!-- 첫페이지로 이동 -->
							<span>
								<a href="/infoMemberList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">처음</a>
							</span>
							
							<!-- 이전페이지로 이동 -->
							<c:if test="${pageHelper.clickPage>1}">
								<span>
									<a href="/infoMemberList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">이전</a>
								</span>
							</c:if>
							
							<!-- 페이징작업(1,2,3, ... , 9, 10 -->
							<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
								<c:choose>
									<c:when test="${pageNo eq pageHelper.clickPage}">
										<span><a href="/infoMemberList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:when>
									<c:otherwise>
										<span><a href="/infoMemberList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- 다음페이지으로 이동 -->
							<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
								<span>
									<a href="/infoMemberList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">다음</a>
								</span>
							</c:if>
							
							<!-- 10페이지 뒤로 이동 -->
							<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
								<span>
									<a href="/infoMemberList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10페이지 뒤로</a>
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