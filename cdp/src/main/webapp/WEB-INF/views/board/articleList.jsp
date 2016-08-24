<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>board</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#articleSearch").click(function(){
			$("#articleAction").attr("action", "/articleList");
			$("#articleAction").attr("method", "GET");
			$("#articleAction").submit();
		});
		$("#goHome").click(function(){
			$("#articleAction").attr("action", "/home");
			$("#articleAction").attr("method", "GET");
			$("#articleAction").submit();
		});
		$("#goArticleInsert").click(function(){
			$("#articleAction").attr("action", "/articleInsert");
			$("#articleAction").attr("method", "GET");
			$("#articleAction").submit();
		});
	});
</script>
</head>
<body>
	<tiles:insertDefinition name="layout">
		<tiles:putAttribute name="body">
			<div id="articleList" align="center">
				<h1>Q&A �Խ���</h1><br/>
				<table class="w3-table w3-striped w3-border ">
					<tr class="w3-dark-grey">
						<th>�۹�ȣ</th>
						<th>������</th>
						<th>�ۼ���</th>
						<th>�Խ���</th>
					</tr>
					<c:forEach var="al" items="${articleList}">
						<tr>
							<td>${al.articleNo}</td>
							<td><a href="/articleDetail1?articleNo=${al.articleNo}" style="font-weight: bold;">${al.articleTitle}</a></td>
							<td>${al.articleWriter}</td>
							<td>${al.articleDate}</td>
						</tr>
					</c:forEach>
				</table>
				<br/>
				<div>
					<form id="articleAction" action="">
						<!-- �˻��ϱ� -->
						<div>
							<span>
								<select name="searchType">
									<option value="">::�˻�����::</option>
									<option value="article_title">����</option>
									<option value="article_content">����</option>
									<option value="article_writer">�ۼ���</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="articleSearch" class="w3-btn w3-dark-grey" type="button" value="�˻�"/></span>
							<span><button class="w3-btn w3-dark-grey"><a href="/articleList" style="text-decoration: none; color:white;">��ü�ۺ���</a></button></span>
						</div>
						
						<!-- ����¡ -->
						<div>
							<!-- ù�������� �̵� -->
							<span>
								<a href="/articleList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">ó��</a>
							</span>
							
							<!-- ������������ �̵� -->
							<c:if test="${pageHelper.clickPage>1}">
								<span>
									<a href="/articleList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
								</span>
							</c:if>
							
							<!-- ����¡�۾�(1,2,3, ... , 9, 10 -->
							<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
								<c:choose>
									<c:when test="${pageNo eq pageHelper.clickPage}">
										<span><a href="/articleList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}"><font class="page" style="font-weight: bold;">${pageNo}</font></a></span>
									</c:when>
									<c:otherwise>
										<span><a href="/articleList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- �������������� �̵� -->
							<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
								<span>
									<a href="/articleList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
								</span>
							</c:if>
							
							<!-- 10������ �ڷ� �̵� -->
							<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
								<span>
									<a href="/articleList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10������ �ڷ�</a>
								</span>
							</c:if>
						</div>
						<br/>
						<!-- Ȩ���� ���� -->
						<div>
							<span>
								<input id="goHome" class="w3-btn w3-dark-grey" type="button" value="HOME"/>
							</span>
							<span>
								<input id="goArticleInsert" class="w3-btn w3-dark-grey" type="button" value="�۾���"/>
							</span>
						</div>
					</form>
				</div>
				</div>
			</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>