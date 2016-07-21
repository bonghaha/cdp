<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>certList</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goHome").click(function(){
			$("#certListAction").attr("action", "/home");
			$("#certListAction").submit();
		});
		$("#goInsert").click(function(){
			$("#certListAction").attr("action", "/infoCertInsert");
			$("#certListAction").submit();
		});
		$("#certSearch").click(function(){
			$("#certListAction").attr("action", "/infoCertList");
			$("#certListAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">	
			<!-- �ڰ��� ����Ʈ -->
			<h1>�ڰ��� ����Ʈ</h1>
			<div>
				<table>
					<tr>
						<th>��ȣ</th>
						<th>�ڰ�Ÿ��</th>
						<th>����ó</th>
						<th>�ڰ�����</th>
					</tr>
					<c:forEach var="ic" items="${infoCertList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td>${ic.infoCertCode}</td>
							<td>${ic.infoCertType}</td>
							<td>${ic.infoCertInstitute}</td>
							<td><a href="/infoCertDetail?infoCertCode=${ic.infoCertCode}&searchType=${searchType}&searchWord=${searchWord}">${ic.infoCertName}</a></td>
							
						</tr>
					</c:forEach>
				</table>
				
				<form id="certListAction" action="">
					<div>
						<span>
							<select name="searchType">
								<option value="">::�˻�����::</option>
								<option value="info_cert_name">�ڰ�����</option>
								<option value="info_cert_type">�ڰ�Ÿ��</option>
								<option value="info_cert_institute">����ó</option>
							</select>
						</span>
						<span><input type="text" name="searchWord"/></span>
						<span><input id="certSearch" type="button" value="�˻�"/></span>
					</div>
					
					<!-- ����¡ -->
					<div>
						<!-- ù�������� �̵� -->
						<span>
							<a href="/infoCertList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">ó��</a>
						</span>
						
						<!-- ������������ �̵� -->
						<c:if test="${pageHelper.clickPage>1}">
							<span>
								<a href="/infoCertList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
							</span>
						</c:if>
						
						<!-- ����¡�۾�(1,2,3, ... , 9, 10 -->
						<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
							<c:choose>
								<c:when test="${pageNo eq pageHelper.clickPage}">
									<span><a href="/infoCertList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
								</c:when>
								<c:otherwise>
									<span><a href="/infoCertList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<!-- �������������� �̵� -->
						<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
							<span>
								<a href="/infoCertList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
							</span>
						</c:if>
						
						<!-- 10������ �ڷ� �̵� -->
						<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
							<span>
								<a href="/infoCertList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10������ �ڷ�</a>
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