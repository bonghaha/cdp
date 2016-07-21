<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SchoolList</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goHome").click(function(){
			$("#schoolListAction").attr("action", "/home");
			$("#schoolListAction").submit();
		});
		$("#goInsert").click(function(){
			$("#schoolListAction").attr("action", "/infoSchoolInsert");
			$("#schoolListAction").submit();
		});
		$("#schoolSearch").click(function(){
			$("#schoolListAction").attr("action", "/infoSchoolList");
			$("#schoolListAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
		<!-- �б� ����Ʈ -->
		<h1>�б� ����Ʈ</h1>
		<div>
			<table>
				<tr>
					<th>�б��ڵ�</th>
					<th>����</th>
					<th>�б�����</th>
					<th>�б���</th>
				</tr>
				<c:forEach var="is" items="${infoSchoolList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
					<tr>
						<td>${is.infoSchoolCode}</td>
						<td>${is.infoSchoolBigName}</td>
						<td>${is.infoSchoolMiddleName}</td>
						<td><a href="/infoSchoolDetail?infoSchoolCode=${is.infoSchoolCode}&searchType=${searchType}&searchWord=${searchWord}">${is.infoSchoolName}</a></td>
					</tr>
				</c:forEach>
			</table>
				<div>
					<form id="schoolListAction" action="">
						<div>
							<span>
								<select name="searchType">
									<option value="">::�˻�����::</option>
									<option value="info_school_bigname">����</option>
									<option value="info_school_middlename">�б�����</option>
									<option value="info_school_name">�б���</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="schoolSearch" type="button" value="�˻�"/></span>
						</div>
						
					<!-- ����¡ -->
						<div>
							<!-- ù�������� �̵� -->
							<span>
								<a href="/infoSchoolList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">ó��</a>
							</span>
							
							<!-- ������������ �̵� -->
							<c:if test="${pageHelper.clickPage>1}">
								<span>
									<a href="/infoSchoolList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
								</span>
							</c:if>
							
							<!-- ����¡�۾�(1,2,3, ... , 9, 10 -->
							<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
								<c:choose>
									<c:when test="${pageNo eq pageHelper.clickPage}">
										<span><a href="/infoSchoolList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:when>
									<c:otherwise>
										<span><a href="/infoSchoolList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- �������������� �̵� -->
							<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
								<span>
									<a href="/infoSchoolList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
								</span>
							</c:if>
							
							<!-- 10������ �ڷ� �̵� -->
							<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
								<span>
									<a href="/infoSchoolList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10������ �ڷ�</a>
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