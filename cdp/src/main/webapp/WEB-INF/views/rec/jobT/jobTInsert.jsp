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
			$("#jobTInsertAction").attr("action", "/infoJobDetail");
			$("#jobTInsertAction").submit();
		});
		$("#goHome").click(function(){
			$("#jobTInsertAction").attr("action", "/home");
			$("#jobTInsertAction").submit();
		});

		$("#goRecJobTList").click(function(){
			$("#jobTInsertAction").attr("action","/recJobTList");
			$("#jobTInsertAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- ��õ�����Ʒ� ��� -->
			<h1>��õ�����Ʒ� ���</h1>
			<div>
				<table>
					<tr>
						<th>��ȣ</th>
						<th>���</th>
						<th>����</th>
						<th>�����</th>
						<th>������</th>
						<th>������</th>
						<th>������</th>
<%-- 						<th>��õ����</th> --%>
					</tr>
					<c:forEach var="ibl" items="${infoJobTList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td>${ibl.infoJobTCode}</td>
							<td>${ibl.infoJobTTarget}</td>
							<td>${ibl.infoJobTLocation}</td>
							<td>${ibl.infoJobTInstitute}</td>
							<td><a href="/recJobTDetailInsert?infoJobTCode=${ibl.infoJobTCode}&infoJobCode=${infoJob.infoJobCode}&searchType=${searchType}&searchWord=${searchWord}">${ibl.infoJobTCourse}</a></td>
							<td>${ibl.infoJobTStartDate}</td>
							<td>${ibl.infoJobTEndDate}</td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<form id="jobTInsertAction" action="">
						<input type="hidden" name="infoJobCode" value="${infoJob.infoJobCode}">
						<div>
							<span>
								<select name="searchType">
									<option value="">::�˻�����::</option>
									<option value="info_jobt_target">���</option>
									<option value="info_jobt_location">����</option>
									<option value="info_jobt_institute">�����</option>
									<option value="info_jobt_course">������</option>
									<option value="rec_jobt_condition">��õ����</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="jobTSearch" type="button" value="�˻�"/></span>
						</div>
						
						<!-- ����¡ -->
						<div>
							<!-- ù�������� �̵� -->
							<span>
								<a href="/infoJobTList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">ó��</a>
							</span>
							
							<!-- ������������ �̵� -->
							<c:if test="${pageHelper.clickPage>1}">
								<span>
									<a href="/infoJobTList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
								</span>
							</c:if>
							
							<!-- ����¡�۾�(1,2,3, ... , 9, 10 -->
							<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
								<c:choose>
									<c:when test="${pageNo eq pageHelper.clickPage}">
										<span><a href="/infoJobTList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:when>
									<c:otherwise>
										<span><a href="/infoJobTList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- �������������� �̵� -->
							<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
								<span>
									<a href="/infoJobTList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
								</span>
							</c:if>
							
							<!-- 10������ �ڷ� �̵� -->
							<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
								<span>
									<a href="/infoJobTList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10������ �ڷ�</a>
								</span>
							</c:if>
						</div>

						<!-- Ȩ���� ���� -->
						<div>
							<span><input id="goBack" type="button" value="�ڷΰ���"/></span>
							<span><input id="goHome" type="button" value="Ȩ���� ����"/></span>
							<span><input id="goRecJobTList" type="button" value="��õ�����Ʒø���Ʈ"/></span>
						</div>
					</form>
				</div>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>