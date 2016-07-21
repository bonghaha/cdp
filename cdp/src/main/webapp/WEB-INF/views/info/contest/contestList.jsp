<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ContestList</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goHome").click(function(){
			$("#contestListAction").attr("action", "/home");
			$("#contestListAction").submit();
		});
		$("#goInsert").click(function(){
			$("#contestListAction").attr("action", "/infoContestInsert");
			$("#contestListAction").submit();
		});
		$("#contestSearch").click(function(){
			$("#contestListAction").attr("action", "/infoContestList");
			$("#contestListAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- ������ ����Ʈ -->
			<h1>������ ����Ʈ</h1>
			<div>
				<table>
					<tr>
						<th>��ȣ</th>
						<th>���ֱ��</th>
						<th>���󳻿�</th>
						<th>������</th>
						<th>��������</th>
						
					</tr>
					<c:forEach var="ib" items="${infoContestList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td>${ib.infoContestCode}</td>
							<td>${ib.infoContestInstitute}</td>
							<td>${ib.infoContestPrize}</td>
							<td>${ib.infoContestContent}</td>
							<td><a href="/infoContestDetail?infoContestCode=${ib.infoContestCode}&searchType=${searchType}&searchWord=${searchWord}">${ib.infoContestName}</a></td>
						</tr>
					</c:forEach>
				</table>
				<form id="contestListAction" action="">
					<div>
						<span>
							<select name="searchType">
								<option value="">::�˻�����::</option>
								<option value="info_contest_name">��������</option>
								<option value="info_contest_institute">���ֱ��</option>
								<option value="info_contest_prize">���󳻿�</option>
								<option value="info_contest_content">������</option>
							</select>
						</span>
						<span><input type="text" name="searchWord"/></span>
						<span><input id="contestSearch" type="button" value="�˻�"/></span>
					</div>
					
					<!-- ����¡ -->
					<div>
						<!-- ù�������� �̵� -->
						<span>
							<a href="/infoContestList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">ó��</a>
						</span>
						
						<!-- ������������ �̵� -->
						<c:if test="${pageHelper.clickPage>1}">
							<span>
								<a href="/infoContestList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
							</span>
						</c:if>
						
						<!-- ����¡�۾�(1,2,3, ... , 9, 10 -->
						<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
							<c:choose>
								<c:when test="${pageNo eq pageHelper.clickPage}">
									<span><a href="/infoContestList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
								</c:when>
								<c:otherwise>
									<span><a href="/infoContestList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<!-- �������������� �̵� -->
						<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
							<span>
								<a href="/infoContestList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
							</span>
						</c:if>
						
						<!-- 10������ �ڷ� �̵� -->
						<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
							<span>
								<a href="/infoContestList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10������ �ڷ�</a>
							</span>
						</c:if>
					</div>
					
					<!-- Ȩ���� ���� -->
					<div>
						<span>
							<input id="goHome" type="button" value="Ȩ���� ����"/>
						</span>
						<span>
							<input id="goInsert" type="button" value="�Է�"/>
						</span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>