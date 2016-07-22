<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>memberList</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goHome").click(function(){
			$("#memberListAction").attr("action", "/home");
			$("#memberListAction").submit();
		});
		$("#goInsert").click(function(){
			$("#memberListAction").attr("action", "/infoMemberInsert");
			$("#memberListAction").submit();
		});
		$("#memberSearch").click(function(){
			$("#memberListAction").attr("action", "/infoMemberList");
			$("#memberListAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="footer">
			<!-- ȸ�� ����Ʈ -->
			<div>
				<table>
					<tr>
						<th>���̵�</th>
						<th>�̸�</th>
						<th>��ȭ��ȣ</th>
						<th>�̸���</th>
						<th>����</th>
						<th>���</th>
						<th>ȸ��������</th>
					</tr>
					<c:forEach var="iml" items="${infoMemberList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td><a href="/infoMemberDetail?infoMemberCode=${iml.infoMemberCode}&searchType=${searchType}&searchWord=${searchWord}">${iml.infoMemberId}</a></td>
							<td>${iml.infoMemberName}</td>
							<td>${iml.infoMemberPhone}</td>
							<td>${iml.infoMemberEmail}</td>
							<td>${iml.infoMemberBirth}</td>
							<td>${iml.infoMemberLevel}</td>
							<td>${iml.infoMemberJoinDate}</td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<form id="memberListAction" action="">
						<!-- �˻��ϱ� -->
						<div>
							<span>
								<select name="searchType">
									<option value="">::�˻�����::</option>
									<option value="info_member_id">���̵�</option>
									<option value="info_member_name">�̸�</option>
									<option value="info_member_level">���</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="memberSearch" type="button" value="�˻�"/></span>
						</div>
						
						<!-- ����¡ -->
						<div>
							<!-- ù�������� �̵� -->
							<span>
								<a href="/infoMemberList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">ó��</a>
							</span>
							
							<!-- ������������ �̵� -->
							<c:if test="${pageHelper.clickPage>1}">
								<span>
									<a href="/infoMemberList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
								</span>
							</c:if>
							
							<!-- ����¡�۾�(1,2,3, ... , 9, 10 -->
							<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
								<c:choose>
									<c:when test="${pageNo eq pageHelper.clickPage}">
										<span><a href="/infoMemberList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:when>
									<c:otherwise>
										<span><a href="/infoMemberList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- �������������� �̵� -->
							<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
								<span>
									<a href="/infoMemberList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
								</span>
							</c:if>
							
							<!-- 10������ �ڷ� �̵� -->
							<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
								<span>
									<a href="/infoMemberList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10������ �ڷ�</a>
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