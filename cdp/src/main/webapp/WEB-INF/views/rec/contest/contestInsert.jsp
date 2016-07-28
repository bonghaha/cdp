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
			$("#contestInsertAction").attr("action", "/infoJobDetail");
			$("#contestInsertAction").submit();
		});
		$("#goHome").click(function(){
			$("#contestInsertAction").attr("action", "/home");
			$("#contestInsertAction").submit();
		});

		$("#goRecContestList").click(function(){
			$("#contestInsertAction").attr("action","/recContestList");
			$("#contestInsertAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- ��õ������ ��� -->
			<h1>��õ������ ���</h1>
			<div>
				<table>
					<tr>
						<th>��ȣ</th>
						<th>���ֱ��</th>
						<th>���󳻿�</th>
						<th>������</th>
						<th>��������</th>
<%-- 						<th>��õ����</th> --%>
					</tr>
					<c:forEach var="icl" items="${infoContestList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td>${icl.infoContestCode}</td>
							<td>${icl.infoContestInstitute}</td>
							<td>${icl.infoContestPrize}</td>
							<td>${icl.infoContestContent}</td>
							<td><a href="/recContestDetailInsert?infoContestCode=${icl.infoContestCode}&infoJobCode=${infoJob.infoJobCode}&searchType=${searchType}&searchWord=${searchWord}">${icl.infoContestName}</a></td>
<%-- 						<td>${ibl.recBookCondition}</td> --%>
						</tr>
					</c:forEach>
				</table>
				<div>
					<form id="contestInsertAction" action="">
						<input type="hidden" name="infoJobCode" value="${infoJob.infoJobCode}">
						<div>
							<span>
								<select name="searchType">
									<option value="">::�˻�����::</option>
									<option value="info_contest_name">��������</option>
									<option value="info_contest_institute">���ֱ��</option>
									<option value="info_contest_prize">���󳻿�</option>
									<option value="info_contest_content">������</option>
									<option value="rec_contest_condition">��õ����</option>
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
							<span><input id="goBack" type="button" value="�ڷΰ���"/></span>
							<span><input id="goHome" type="button" value="Ȩ���� ����"/></span>
							<span><input id="goRecContestList" type="button" value="��õ����������Ʈ"/></span>
						</div>
					</form>
				</div>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>