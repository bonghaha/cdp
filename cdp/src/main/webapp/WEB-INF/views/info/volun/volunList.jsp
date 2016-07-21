<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����Ȱ������Ʈ</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goHome").click(function(){
			$("#volunListAction").attr("action", "/home");
			$("#volunListAction").submit();
		});
		$("#goInsert").click(function(){
			$("#volunListAction").attr("action", "/infoVolunInsert");
			$("#volunListAction").submit();
		});
		$("#volunSearch").click(function(){
			$("#volunListAction").attr("action", "/infoVolunList");
			$("#volunListAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- ����Ȱ�� ����Ʈ -->
			<h1>����Ȱ�� ����Ʈ</h1>
			<div>
				<table>
					<tr>
						<th>����Ȱ���ڵ�</th>
						<th>���</th>
						<th>����</th>
						<th>����</th>
						<th>����Ȱ����</th>
					</tr>
					<c:forEach var="ivl" items="${infoVolunList}">
						<tr>
							<td>${ivl.infoVolunCode}</td>
							<td>${ivl.infoVolunContinent}</td>
							<td>${ivl.infoVolunCountry}</td>
							<td>${ivl.infoVolunTitle}</td>
							<td><a href="/infoVolunDetail?infoVolunCode=${ivl.infoVolunCode}&searchType=${searchType}&searchWord=${searchWord}">${ivl.infoVolunName}</a></td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<form id="volunListAction" action="">
						<div>
							<span>
								<select name="searchType">
									<option value="">::�˻�����::</option>
									<option value="info_volun_continent">���</option>
									<option value="info_volun_country">����</option>
									<option value="info_volun_title">����</option>
									<option value="info_volun_name">����Ȱ����</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="volunSearch" type="button" value="�˻�"/></span>
						</div>
						
							<!-- ����¡ -->
							<div>
								<!-- ù�������� �̵� -->
								<span>
									<a href="/infoVolunList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">ó��</a>
								</span>
								
								<!-- ������������ �̵� -->
								<c:if test="${pageHelper.clickPage>1}">
									<span>
										<a href="/infoVolunList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
									</span>
								</c:if>
								
								<!-- ����¡�۾�(1,2,3, ... , 9, 10 -->
								<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
									<c:choose>
										<c:when test="${pageNo eq pageHelper.clickPage}">
											<span><a href="/infoVolunList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
										</c:when>
										<c:otherwise>
											<span><a href="/infoVolunList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<!-- �������������� �̵� -->
								<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
									<span>
										<a href="/infoVolunList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
									</span>
								</c:if>
								
								<!-- 10������ �ڷ� �̵� -->
								<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
									<span>
										<a href="/infoVolunList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10������ �ڷ�</a>
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