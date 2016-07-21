<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>DeptList</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goHome").click(function(){
			$("#deptListAction").attr("action", "/home");
			$("#deptListAction").submit();
		});
		$("#goInsert").click(function(){
			$("#deptListAction").attr("action", "/infoDeptInsert");
			$("#deptListAction").submit();
		});
		$("#deptSearch").click(function(){
			$("#deptListAction").attr("action", "/infoDeptList");
			$("#deptListAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- �а� ����Ʈ -->
			<h1>�а� ����Ʈ</h1>
			<div>
				<table>
					<tr>
						<th>��ȣ</th>
						<th>�а��迭</th>
						<th>�к�</th>
						<th>�а���</th>
					</tr>
					<c:forEach var="id" items="${infoDeptList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td>${id.infoDeptCode}</td>
							<td>${id.infoDeptBigName}</td>
							<td>${id.infoDeptMiddleName}</td>
							<td><a href="/infoDeptDetail?infoDeptCode=${id.infoDeptCode}&searchType=${searchType}&searchWord=${searchWord}">${id.infoDeptSmallName}</a></td>
						</tr>
					</c:forEach>
				</table>
				<form id="deptListAction" action="">
					<div>
						<span>
							<select name="searchType">
								<option value="">::�˻�����::</option>
								<option value="info_dept_bigname">�а��迭</option>
								<option value="info_dept_middlename">�к�</option>
								<option value="info_dept_smallname">�а���</option>
							</select>
						</span>
						<span><input type="text" name="searchWord"/></span>
						<span><input id="deptSearch" type="button" value="�˻�"/></span>
					</div>
					
					<!-- ����¡ -->
					<div>
					
						<!-- ù�������� �̵� -->
						<span>
							<a href="/infoDeptList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">ó��</a>
						</span>
						
						<!-- ������������ �̵� -->
						<c:if test="${pageHelper.clickPage>1}">
							<span>
								<a href="/infoDeptList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
							</span>
						</c:if>
						
						<!-- ����¡�۾�(1,2,3, ... , 9, 10 -->
						<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
							<c:choose>
								<c:when test="${pageNo eq pageHelper.clickPage}">
									<span><a href="/infoDeptList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
								</c:when>
								<c:otherwise>
									<span><a href="/infoDeptList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<!-- �������������� �̵� -->
						<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
							<span>
								<a href="/infoDeptList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
							</span>
						</c:if>
						
						<!-- 10������ �ڷ� �̵� -->
						<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
							<span>
								<a href="/infoDeptList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10������ �ڷ�</a>
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