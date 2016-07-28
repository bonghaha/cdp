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
			$("#certListAction").attr("action", "/infoJobDetail");
			$("#certListAction").submit();
		});
		$("#goHome").click(function(){
			$("#certListAction").attr("action", "/home");
			$("#certListAction").submit();
		});

		$("#goRecCertInsert").click(function(){
			$("#certListAction").attr("action","/recCertInsert");
			$("#certListAction").submit();
		});
		$("#certSearch").click(function(){
			$("#certListAction").attr("action", "/recCertList");
			$("#certListAction").submit();
		});
		
		/* ������ ��õ�� ��ȹ���� ������ */
		$("#goPlanCertInsert").click(function(){
			var recCertCode = [];	//�迭 �ʱ�ȭ
			$("#certListAction").attr("action","/planCertInsert");
			$("#recCertCheck:checked").each(function(){
				recCertCode.push($(this).val());	//�迭�� üũ�Ȱ͵� ������ value �� Ǫ��Ǫ��
			});
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
			<h1>��õ �ڰ��� ����Ʈ</h1>
			<div>
				<form id="certListAction" action="">
					<input type="hidden" name="infoJobCode" value="${infoJob.infoJobCode}">
					<table>
						<tr>
							<th>��ȣ</th>
							<th>�ڰ�Ÿ��</th>
							<th>����ó</th>
							<th>�ڰ�����</th>
							<th>��õ����</th>
							<th>��õ����</th>
							<th>��õ����</th>
							<th>��õ�����</th>
						</tr>
						<c:forEach var="rcl" items="${recCertListWithRecCertCondition}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
							<tr>
								<td>${rcl.infoCertCode}</td>
								<td>${rcl.infoCertType}</td>
								<td>${rcl.infoCertInstitute}</td>
								<td><a href="/infoCertDetail?infoCertCode=${rcl.infoCertCode}&searchType=${searchType}&searchWord=${searchWord}">${rcl.infoCertName}</a></td>
								<td>${rcl.recCertCondition}</td>
								<td>${rcl.recCertReason}</td>
								<td>${rcl.recCertContent}</td>
								<td>${rcl.recCertRegisterDate}</td>
							</tr>
						</c:forEach>
					</table>
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
						<span><input id="goBack" type="button" value="�ڷΰ���"/></span>
						<span><input id="goHome" type="button" value="HOME"/></span>
						<span><input id="goRecCertInsert" type="button" value="�ڰ�������Ʈ����"/></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>