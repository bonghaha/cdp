<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goHome").click(function(){
			$("#jobListAction").attr("action", "/home");
			$("#jobListAction").submit();
		});
		$("#goInsert").click(function(){
			$("#jobListAction").attr("action", "/infoJobInsert");
			$("#jobListAction").submit();
		});
		$("#jobSearch").click(function(){
			$("#jobListAction").attr("action", "/infoJobList");
			$("#jobListAction").submit();
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
			<!-- ���� ����Ʈ -->
			<div>
				<table>
					<tr>
						<th>�����з���ȣ</th>
						<th>��з���</th>
						<th>�ߺз���</th>
						<th>�Һз���</th>
						<th>���з���</th>
						<th>�ɷ´�����</th>
						<th>�з�����</th>
						<th>��������</th>
						<th>����</th>
						<th>����⵵</th>
						<th>����Ƚ��</th>
						<th>�����</th>
						<th>�����</th>
					</tr>
					<c:forEach var="ijl" items="${infoJobList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td>${ijl.infoJobCode}</td>
							<td>${ijl.infoJobBigName}</td>
							<td>${ijl.infoJobMiddleName}</td>
							<td>${ijl.infoJobSmallName}</td>
							<td>${ijl.infoJobDetailName}</td>
							<td><a href="/infoJobDetail?infoJobCode=${ijl.infoJobCode}&searchType=${searchType}&searchWord=${searchWord}">${ijl.infoJobUnitName}</a></td>
							<td>${ijl.infoJobDetailInfo}</td>
							<td>${ijl.infoJobInfo}</td>
							<td>${ijl.infoJobCondition}</td>
							<td>${ijl.infoJobApplyYear}</td>
							<td>${ijl.infoJobChangeCount}</td>
							<td>${ijl.infoJobRegisterDate}</td>
							<td>${ijl.infoJobRegisterName}</td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<form id="jobListAction" action="">
						<div>
							<span>
								<select name="searchType">
									<option value="">�˻�</option>
									<option value="info_job_bigname">��з���</option>
									<option value="info_job_middlename">�ߺз���</option>
									<option value="info_job_smallname">�Һз���</option>
									<option value="info_job_detailname">���з���</option>
									<option value="info_job_unitname">�ɷ´�����</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="jobSearch" type="button" value="�˻�"/></span>
						</div>
						
						<!-- ����¡ -->
						<div>
							<!-- ù�������� �̵� -->
							<span>
								<a href="/infoJobList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">ó��</a>
							</span>
							
							<!-- ������������ �̵� -->
							<c:if test="${pageHelper.clickPage>1}">
								<span>
									<a href="/infoJobList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
								</span>
							</c:if>
							
							<!-- ����¡�۾�(1,2,3, ... , 9, 10 -->
							<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
								<c:choose>
									<c:when test="${pageNo eq pageHelper.clickPage}">
										<span><a href="/infoJobList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:when>
									<c:otherwise>
										<span><a href="/infoJobList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- �������������� �̵� -->
							<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
								<span>
									<a href="/infoJobList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
								</span>
							</c:if>
							
							<!-- 10������ �ڷ� �̵� -->
							<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
								<span>
									<a href="/infoJobList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10������ �ڷ�</a>
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