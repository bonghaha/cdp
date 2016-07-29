<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>CDP</title>
</head>
<body>
	<t:insertDefinition name="layout">
	
		<!-- body -->
		<t:putAttribute name="body">
			<h1>CDP</h1>
			<c:choose>
				<c:when test="${not empty sessionScope.memberLoginInfo}">
				<h2>�α��� ����</h2>
				<div>
					<span>�̸� : ${sessionScope.memberLoginInfo.infoMemberName}</span>
					<span>���� : <c:out value="${sessionScope.memberLoginInfo.infoMemberLevel}"/></span> 
					<span><a href="/logout">�α׾ƿ�</a></span>
				</div>
				</c:when>
			
				<c:otherwise>
					<h2>�α���</h2>
					<form action="/loginProcess" method="post">
						<table>
							<tr>
								<td>ID</td>
								<td><input type="text" name="infoMemberId"></td>
							</tr>
							<tr>
								<td>PW</td>
								<td><input type="password" name="infoMemberPw"></td>
							</tr>
							<tr>
								<td><input type="submit" value="�α���"></td>
								<td><input type="reset" value="����"></td>
								<td><a href="/infoMemberInsert">ȸ������</a></td>
							</tr>
						</table>
					</form>
				</c:otherwise>
			</c:choose>
			
			<div>
				<span><a href="/infoMemberList">ȸ�� ����Ʈ</a></span>
			</div>
			<div>
				<span><a href="/infoVolunInsert">����Ȱ�� ���</a></span>
				<span><a href="/infoVolunList">����Ȱ�� ����Ʈ</a></span>
			</div>
			<div>
				<span><a href="/infoBookInsert">���� ���</a></span>
				<span><a href="/infoBookList">���� ����Ʈ</a></span>
			</div>
			<div>
				<span><a href="/infoCertInsert">�ڰ��� ���</a></span>
				<span><a href="/infoCertList">�ڰ��� ����Ʈ</a></span>
			</div>
			<div>
				<span><a href="/infoContestInsert">������ ���</a></span>
				<span><a href="/infoContestList">������ ����Ʈ</a></span>
			</div>
			<div>
				<span><a href="/infoDeptInsert">�а� ���</a></span>
				<span><a href="/infoDeptList">�а� ����Ʈ</a></span>
			</div>
			<div>
				<span><a href="/infoJobInsert">���� ���</a></span>
				<span><a href="/infoJobList">��������Ʈ</a></span>
			</div>
			<div>
				<span><a href="/infoJobTInsert">�����Ʒ� ���</a></span>
				<span><a href="/infoJobTList">�����Ʒ� ����Ʈ</a></span>
			</div>
			<div>
				<span><a href="/infoLangInsert">��� ���</a></span>
				<span><a href="/infoLangList">��� ����Ʈ</a></span>
			</div>
			<div>
				<span><a href="/infoStudyAbInsert">���п��� ���</a></span>
				<span><a href="/infoStudyAbList">���п��� ����Ʈ</a></span>
			</div>
			<div>
				<span><a href="/infoSchoolInsert">�б� ���</a></span>
				<span><a href="/infoSchoolList">�б� ����Ʈ</a></span>
			</div>
			<form action="/recBookList">
			<div>
				<span><input type="text" name="infoJobUnitName"></span>
				<span><input type="submit" value="�����Է�"/></span>
			</div>
			</form>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>