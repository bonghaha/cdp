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
	$("#goJobList").click(function(){
		$("#jobDetailAction").attr("action", "/infoJobList");
		$("#jobDetailAction").submit();
	});
	/* ��õ��� */
	$("#recSchoolInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recSchoolInsert");
		$("#jobDetailAction").submit();
	});
	$("#recDeptInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recDeptInsert");
		$("#jobDetailAction").submit();
	});
	$("#recLangInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recLangInsert");
		$("#jobDetailAction").submit();
	});
	$("#recCertInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recCertInsert");
		$("#jobDetailAction").submit();
	});
	$("#recContestInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recContestInsert");
		$("#jobDetailAction").submit();
	});
	$("#recStudyAbInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recStudyAbInsert");
		$("#jobDetailAction").submit();
	});
	$("#recVolunInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recVolunInsert");
		$("#jobDetailAction").submit();
	});
	$("#recJobTInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recJobTInsert");
		$("#jobDetailAction").submit();
	});
	$("#recBookInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recBookInsert");
		$("#jobDetailAction").submit();
	});
	
	/* ��õ����Ʈ */
	$("#recSchoolList").click(function(){
		$("#jobDetailAction").attr("action", "/recSchoolList");
		$("#jobDetailAction").submit();
	});
	$("#recDeptList").click(function(){
		$("#jobDetailAction").attr("action", "/recDeptList");
		$("#jobDetailAction").submit();
	});
	$("#recLangList").click(function(){
		$("#jobDetailAction").attr("action", "/recLangList");
		$("#jobDetailAction").submit();
	});
	$("#recCertList").click(function(){
		$("#jobDetailAction").attr("action", "/recCertList");
		$("#jobDetailAction").submit();
	});
	$("#recContestList").click(function(){
		$("#jobDetailAction").attr("action", "/recContestList");
		$("#jobDetailAction").submit();
	});
	$("#recStudyAbList").click(function(){
		$("#jobDetailAction").attr("action", "/recStudyAbList");
		$("#jobDetailAction").submit();
	});
	$("#recVolunList").click(function(){
		$("#jobDetailAction").attr("action", "/recVolunList");
		$("#jobDetailAction").submit();
	});
	$("#recJobTList").click(function(){
		$("#jobDetailAction").attr("action", "/recJobTList");
		$("#jobDetailAction").submit();
	});
	$("#recBookList").click(function(){
		$("#jobDetailAction").attr("action", "/recBookList");
		$("#jobDetailAction").submit();
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
			<h1>���� �󼼺���</h1>
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
					<c:if test="${infoJob != null}">
						<tr>
							<td>${infoJob.infoJobCode}</td>
							<td>${infoJob.infoJobBigName}</td>
							<td>${infoJob.infoJobMiddleName}</td>
							<td>${infoJob.infoJobSmallName}</td>
							<td>${infoJob.infoJobDetailName}</td>
							<td>${infoJob.infoJobUnitName}</td>
							<td>${infoJob.infoJobDetailInfo}</td>
							<td>${infoJob.infoJobInfo}</td>
							<td>${infoJob.infoJobCondition}</td>
							<td>${infoJob.infoJobApplyYear}</td>
							<td>${infoJob.infoJobChangeCount}</td>
							<td>${infoJob.infoJobRegisterDate}</td>
							<td>${infoJob.infoJobRegisterName}</td>
						</tr>
					</c:if>
				</table>
				<div>
					<form id="jobDetailAction" action="">
						<input type="hidden" name="infoJobCode" value="${infoJob.infoJobCode}"/>
						<input type="hidden" name="searchType" value="${searchType}"/>
						<input type="hidden" name="searchWord" value="${searchWord}"/>
						<div>
							<span><input id="goJobList" type="button" value="����Ʈ�� ����"/></span>
						</div>
						<hr>
						<div>
							<span><input id="recSchoolList" type="button" value="��õ�б�����Ʈ"/></span>
							<span><input id="recSchoolInsert" type="button" value="��õ�б��߰�"/></span>
						</div>
						<br>
						<div>
							<span><input id="recDeptList" type="button" value="��õ�а�����Ʈ"/></span>
							<span><input id="recDeptInsert" type="button" value="��õ�а��߰�"/></span>
						</div>
						<br>
						<div>
							<span><input id="recLangList" type="button" value="��õ����Ʈ"/></span>
							<span><input id="recLangInsert" type="button" value="��õ����߰�"/></span>
						</div>
						<br>
						<div>
							<span><input id="recCertList" type="button" value="��õ�ڰ�������Ʈ"/></span>
							<span><input id="recCertInsert" type="button" value="��õ�ڰ����߰�"/></span>
						</div>
						<br>
						<div>
							<span><input id="recContestList" type="button" value="��õ����������Ʈ"/></span>
							<span><input id="recContestInsert" type="button" value="��õ�������߰�"/></span>
						</div>
						<br>
						<div>
							<span><input id="recStudyAbList" type="button" value="��õ���п�������Ʈ"/></span>
							<span><input id="recStudyAbInsert" type="button" value="��õ���п����߰�"/></span>
						</div>
						<br>
						<div>
							<span><input id="recVolunList" type="button" value="��õ����Ȱ������Ʈ"/></span>
							<span><input id="recVolunInsert" type="button" value="��õ����Ȱ���߰�"/></span>
						</div>
						<br>
						<div>
							<span><input id="recJobTList" type="button" value="��õ�����Ʒø���Ʈ"/></span>
							<span><input id="recJobTInsert" type="button" value="��õ�����Ʒ��߰�"/></span>
						</div>
						<br>
						<div>
							<span><input id="recBookList" type="button" value="��õ��������Ʈ"/></span>	
							<span><input id="recBookInsert" type="button" value="��õ�����߰�"/></span>					
						</div>
					</form>
				</div>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>