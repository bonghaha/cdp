<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����Ʒ� ����Ʈ</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goHome").click(function(){
			$("#jobTListAction").attr("action", "/home");
			$("#jobTListAction").submit();
		});
		$("#goInsert").click(function(){
			$("#jobTListAction").attr("action", "/infoJobTInsert");
			$("#jobTListAction").submit();
		});
		$("#jobTSearch").click(function(){
			$("#jobTListAction").attr("action", "/infoJobTList");
			$("#jobTListAction").submit();
		});
	});
</script>
<style>
	table,th,tr,td{
		border : 1px black solid;
	}
</style>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- �����Ʒ� ����Ʈ -->
			<div>
				<table>
					<tr>
						<th>�����Ʒúз� ��ȣ</th>
						<th>���</th>
						<th>����</th>
						<th>�����</th>
						<th>������</th>
						<th>������</th>
						<th>������</th>
					</tr>
					<c:forEach var="itl" items="${infoJobTList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td><a href="/infoJobTDetail?infoJobTCode=${itl.infoJobTCode}&searchType=${searchType}&searchWord=${searchWord}">${itl.infoJobTCode}</a></td>
							<td>${itl.infoJobTTarget}</td>
							<td>${itl.infoJobTLocation}</td>
							<td>${itl.infoJobTInstitute}</td>
							<td>${itl.infoJobTCourse}</td>
							<td>${itl.infoJobTStartDate}</td>
							<td>${itl.infoJobTEndDate}</td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<form id="jobTListAction" action="">
						<div>
							<span>
								<select name="searchType">
									<option value="">::�˻�����::</option>
									<option value="info_jobt_target">���</option>
									<option value="info_jobt_location">����</option>
									<option value="info_jobt_institute">�����</option>
									<option value="info_jobt_course">������</option>
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
							<span>
								<input id="goHome" type="button" value="Ȩ���� ����"/>
							</span>
							<span>
								<input id="goInsert" type="button" value="�Է�"/>
							</span>
						</div>
					</form>
				</div>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>