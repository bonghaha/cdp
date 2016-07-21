<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
	<title>CDP</title>
</head>
<body>
	<t:insertDefinition name="layout">
	
		<!-- body -->
		<t:putAttribute name="body">
			<h1>CDP</h1>
			<div>
				<span><a href="/infoMemberInsert">ȸ������</a></span>
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
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>