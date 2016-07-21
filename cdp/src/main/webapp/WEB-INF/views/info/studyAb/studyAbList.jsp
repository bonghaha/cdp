<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���п��� ����Ʈ</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goHome").click(function(){
			$("#studyAbListAction").attr("action", "/home");
			$("#studyAbListAction").submit();
		});
		$("#goInsert").click(function(){
			$("#studyAbListAction").attr("action", "/infoStudyAbInsert");
			$("#studyAbListAction").submit();
		});
		$("#studyAbSearch").click(function(){
			$("#studyAbListAction").attr("action", "/infoStudyAbList");
			$("#studyAbListAction").submit();
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
			<!-- ���п��� ����Ʈ -->
			<div>
				<table>
					<tr>
						<th>���п����з� ��ȣ</th>
						<th>����</th>
						<th>�����</th>
						<th>���</th>
					</tr>
					<c:forEach var="isal" items="${infoStudyAbList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td><a href="/infoStudyAbDetail?infoStudyAbCode=${isal.infoStudyAbCode}&searchType=${searchType}&searchWord=${searchWord}">${isal.infoStudyAbCode}</a></td>
							<td>${isal.infoStudyAbLocation}</td>
							<td>${isal.infoStudyAbInstitute}</td>
							<td>${isal.infoStudyAbLang}</td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<!-- �˻� -->
					<form id="studyAbListAction" action="">
						<div>
							<span>
								<select name="searchType">
									<option value="">::�˻�����::</option>
									<option value="info_studyab_location">����</option>
									<option value="info_studyab_institute">�����</option>
									<option value="info_studyab_lang">���</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="studyAbSearch" type="button" value="�˻�"/></span>
						</div>
						
						<!-- ����¡ -->
						<div>
							<!-- ù�������� �̵� -->
							<span>
								<a href="/infoStudyAbList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">ó��</a>
							</span>
							
							<!-- ������������ �̵� -->
							<c:if test="${pageHelper.clickPage>1}">
								<span>
									<a href="/infoStudyAbList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
								</span>
							</c:if>
							
							<!-- ����¡�۾�(1,2,3, ... , 9, 10 -->
							<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
								<c:choose>
									<c:when test="${pageNo eq pageHelper.clickPage}">
										<span><a href="/infoStudyAbList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:when>
									<c:otherwise>
										<span><a href="/infoStudyAbList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- �������������� �̵� -->
							<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
								<span>
									<a href="/infoStudyAbList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
								</span>
							</c:if>
							
							<!-- 10������ �ڷ� �̵� -->
							<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
								<span>
									<a href="/infoStudyAbList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10������ �ڷ�</a>
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