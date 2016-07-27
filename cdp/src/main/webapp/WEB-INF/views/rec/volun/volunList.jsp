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
			$("#volunListAction").attr("action", "/infoJobDetail");
			$("#volunListAction").submit();
		});
		$("#goHome").click(function(){
			$("#volunListAction").attr("action", "/home");
			$("#volunListAction").submit();
		});

		$("#goRecVolunInsert").click(function(){
			$("#volunListAction").attr("action","/recVolunInsert");
			$("#volunListAction").submit();
		});
		$("#volunSearch").click(function(){
			$("#volunListAction").attr("action", "/recVolunList");
			$("#volunListAction").submit();
		});
		
		/* ������ ��õ�� ��ȹ���� ������ */
		$("#goPlanVolunInsert").click(function(){
			var recVolunCode = [];	//�迭 �ʱ�ȭ
			$("#volunListAction").attr("action","/planVolunInsert");
			$("#recVolunCheck:checked").each(function(){
				recVolunCode.push($(this).val());	//�迭�� üũ�Ȱ͵� ������ value �� Ǫ��Ǫ��
			});
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
			<h1>��õ ����Ȱ�� ����Ʈ</h1>
			<div>
				<form id="volunListAction" action="">
					<input type="hidden" name="infoJobCode" value="${infoJob.infoJobCode}">
					<table>
						<tr>
							<th>��ȣ</th>
							<th>���</th>
							<th>����</th>
							<th>����</th>
							<th>����Ȱ��</th>
							<th>��õ����</th>
							<th>��õ����</th>
							<th>��õ����</th>
							<th>��õ�����</th>
						</tr>
						<c:forEach var="rvl" items="${recVolunListWithRecVolunCondition}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
							<tr>
								<td>${rvl.infoVolunCode}</td>
								<td>${rvl.infoVolunContinent}</td>
								<td>${rvl.infoVolunCountry}</td>
								<td>${rvl.infoVolunTitle}</td>
								<td><a href="/infoVolunDetail?infoVolunCode=${rvl.infoVolunCode}&searchType=${searchType}&searchWord=${searchWord}">${rvl.infoVolunName}</a></td>
								<td>${rvl.recVolunCondition}</td>
								<td>${rvl.recVolunReason}</td>
								<td>${rvl.recVolunContent}</td>
								<td>${rvl.recVolunRegisterDate}</td>
							</tr>
						</c:forEach>
					</table>
					<div>
						<span>
							<select name="searchType">
								<option value="">::�˻�����::</option>
								<option value="info_volun_continent">���</option>
								<option value="info_volun_country">����</option>
								<option value="info_volun_title">����</option>
								<option value="info_volun_name">����Ȱ��</option>
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
						<span><input id="goBack" type="button" value="�ڷΰ���"/></span>
						<span><input id="goHome" type="button" value="HOME"/></span>
						<span><input id="goRecVolunInsert" type="button" value="����Ȱ������Ʈ����"/></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>