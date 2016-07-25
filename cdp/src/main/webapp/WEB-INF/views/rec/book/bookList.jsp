<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>

</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<!-- ���� ����Ʈ -->
			<h1>��õ ���� ����Ʈ</h1>
			<div>
				<table>
					<tr>
						<th>��ȣ</th>
						<th>�帣</th>
						<th>���ǻ�</th>
						<th>����</th>
						<th>������</th>
					</tr>
					<c:forEach var="rbl" items="${recBookList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td>${rbl.infoBookCode}</td>
							<td>${rbl.infoBookGenre}</td>
							<td>${rbl.infoBookInstitute}</td>
							<td>${rbl.infoBookWriter}</td>
							<td><a href="/infoBookDetail?infoBookCode=${rbl.infoBookCode}&searchType=${searchType}&searchWord=${searchWord}">${ib.infoBookName}</a></td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<form id="bookListAction" action="">
						<div>
							<span>
								<select name="searchType">
									<option value="">::�˻�����::</option>
									<option value="info_book_name">������</option>
									<option value="info_book_genre">�帣</option>
									<option value="info_book_institute">���ǻ�</option>
									<option value="info_book_writer">����</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="bookSearch" type="button" value="�˻�"/></span>
						</div>
						
						<!-- ����¡ -->
						<div>
							<!-- ù�������� �̵� -->
							<span>
								<a href="/infoBookList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">ó��</a>
							</span>
							
							<!-- ������������ �̵� -->
							<c:if test="${pageHelper.clickPage>1}">
								<span>
									<a href="/infoBookList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
								</span>
							</c:if>
							
							<!-- ����¡�۾�(1,2,3, ... , 9, 10 -->
							<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
								<c:choose>
									<c:when test="${pageNo eq pageHelper.clickPage}">
										<span><a href="/infoBookList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:when>
									<c:otherwise>
										<span><a href="/infoBookList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- �������������� �̵� -->
							<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
								<span>
									<a href="/infoBookList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
								</span>
							</c:if>
							
							<!-- 10������ �ڷ� �̵� -->
							<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
								<span>
									<a href="/infoBookList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10������ �ڷ�</a>
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