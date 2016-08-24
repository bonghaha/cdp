<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goBack").click(function(){
			$("#deptListAction").attr("action", "/infoJobDetail");
			$("#deptListAction").submit();
		});
		$("#goHome").click(function(){
			$("#deptListAction").attr("action", "/home");
			$("#deptListAction").submit();
		});

		$("#goRecDeptInsert").click(function(){
			$("#deptListAction").attr("action","/recDeptInsert");
			$("#deptListAction").submit();
		});
		$("#certSearch").click(function(){
			$("#deptListAction").attr("action", "/recDeptList");
			$("#deptListAction").submit();
		});
		
		/* ������ ��õ�� ��ȹ���� ������ */
		$("#goPlanDeptInsert").click(function(){
			var recDeptCode = [];	//�迭 �ʱ�ȭ
			$("#deptListAction").attr("action","/planDeptInsert");
			$("#recDeptCheck:checked").each(function(){
				recDeptCode.push($(this).val());	//�迭�� üũ�Ȱ͵� ������ value �� Ǫ��Ǫ��
			});
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
			<h1>��õ �а� ����Ʈ</h1>
			<div>
				<form id="deptListAction" action="">
					<input type="hidden" name="jobdicSeq" value="${infoJob.jobdicSeq}">
					<input type="hidden" name="recDeptCode" value="${recDept.recDeptCode}">
					<input type="hidden" name="majorSeq" value="${recDept.majorSeq}">
					<table>
						<tr>
							<th>��ȣ</th>
							<th>�а��迭</th>
							<th>�а���</th>
							<th>��õ����</th>
							<th>��õ����</th>
							<th>��õ����</th>
							<th>��õ�����</th>
						</tr>
						<c:forEach var="rwidl" items="${recWithInfoDeptList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
							<tr>
								<td>${rwidl.majorSeq}</td>
								<td>${rwidl.lClass}</td>
								<td><a href="/infoDeptDetail?majorSeq=${rwidl.majorSeq}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">${rwidl.mClass}</a></td>
								<td>${rwidl.recDeptCondition}</td>
								<td>${rwidl.recDeptReason}</td>
								<td>${rwidl.recDeptContent}</td>
								<td>${rwidl.recDeptRegisterDate}</td>
							</tr>
						</c:forEach>
					</table>
					<div>
						<span>
							<select name="searchType">
								<option value="">::�˻�����::</option>
								<option value="lClass">�迭</option>
								<option value="mClass">�а�</option>
								<option value="facilName">�����а���</option>
							</select>
						</span>
						<span><input type="text" name="searchWord"/></span>
						<span><input id="deptSearch" type="button" value="�˻�"/></span>
					</div>
					
					<!-- ����¡ -->
					<div>
						<!-- ù�������� �̵� -->
						<span>
							<a href="/recDeptList?clickPage=1&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">ó��</a>
						</span>
						
						<!-- ������������ �̵� -->
						<c:if test="${pageHelper.clickPage>1}">
							<span>
								<a href="/recDeptList?clickPage=${pageHelper.clickPage-1}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">����</a>
							</span>
						</c:if>
						
						<!-- ����¡�۾�(1,2,3, ... , 9, 10 -->
						<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
							<c:choose>
								<c:when test="${pageNo eq pageHelper.clickPage}">
									<span><a href="/recDeptList?clickPage=${pageNo}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
								</c:when>
								<c:otherwise>
									<span><a href="/recDeptList?clickPage=${pageNo}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<!-- �������������� �̵� -->
						<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
							<span>
								<a href="/recDeptList?clickPage=${pageHelper.clickPage+1}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">����</a>
							</span>
						</c:if>
						
						<!-- 10������ �ڷ� �̵� -->
						<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
							<span>
								<a href="/recDeptList?clickPage=${pageHelper.clickPage+10}&jobdicSeq=${infoJob.jobdicSeq}&searchType=${searchType}&searchWord=${searchWord}">10������ �ڷ�</a>
							</span>
						</c:if>
					</div>
					
					<!-- Ȩ���� ���� -->
					<div>
						<span><input id="goBack" type="button" value="�ڷΰ���"/></span>
						<span><input id="goHome" type="button" value="HOME"/></span>
						<span><input id="goRecDeptInsert" type="button" value="�а�����Ʈ����"/></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>