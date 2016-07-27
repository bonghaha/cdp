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
			$("#contestListAction").attr("action", "/infoJobDetail");
			$("#contestListAction").submit();
		});
		$("#goHome").click(function(){
			$("#contestListAction").attr("action", "/home");
			$("#contestListAction").submit();
		});

		$("#goRecContestInsert").click(function(){
			$("#contestListAction").attr("action","/recContestInsert");
			$("#contestListAction").submit();
		});
		
		$("#contestSearch").click(function(){
			$("#contestListAction").attr("action", "/recContestList");
			$("#contestListAction").submit();
		});
		
		/* ������ ��õ�� ��ȹ���� ������ */
		$("#goPlanContestInsert").click(function(){
			var recContestCode = [];	//�迭 �ʱ�ȭ
			$("#contestListAction").attr("action","/planContestInsert");
			$("#recContestCheck:checked").each(function(){
				recContestCode.push($(this).val());	//�迭�� üũ�Ȱ͵� ������ value �� Ǫ��Ǫ��
			});
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
			<h1>��õ ������ ����Ʈ</h1>
			<div>
				<form id="contestListAction" action="">
					<input type="hidden" name="infoJobCode" value="${infoJob.infoJobCode}">
					<table>
						<tr>
							<th>����</th>
							<th>��ȣ</th>
							<th>���ֱ��</th>
							<th>���󳻿�</th>
							<th>������</th>
							<th>��������</th>
							<th>��õ����</th>
							<th>��õ����</th>
							<th>��õ����</th>
							<th>��õ�����</th>
						</tr>
						<c:forEach var="rcl" items="${recContestListWithRecContestCondition}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
							<tr>
								<td><input id="recContestCheck" type="checkbox" name="recContestCode" value="${rcl.recContestCode}"></td>
								<td>${rcl.infoContestCode}</td>
								<td>${rcl.infoContestInstitute}</td>
								<td>${rcl.infoContestPrize}</td>
								<td>${rcl.infoContestContent}</td>
								<td><a href="/infoContestDetail?infoContestCode=${rcl.infoContestCode}&searchType=${searchType}&searchWord=${searchWord}">${rcl.infoContestName}</a></td>
								<td>${rcl.recContestCondition}</td>
								<td>${rcl.recContestReason}</td>
								<td>${rcl.recContestContent}</td>
								<td>${rcl.recContestRegisterDate}</td>
							</tr>
						</c:forEach>
					</table>
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
						<span><input id="goBack" type="button" value="�ڷΰ���"/></span>
						<span><input id="goHome" type="button" value="HOME"/></span>
						<span><input id="goRecContestInsert" type="button" value="����������Ʈ����"/></span>
						<span><input id="goPlanContestInsert" type="button" value="��ȹ���"/></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>