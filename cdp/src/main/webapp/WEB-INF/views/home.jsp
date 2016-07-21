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
				<span><a href="/infoMemberInsert">회원가입</a></span>
				<span><a href="/infoMemberList">회원 리스트</a></span>
			</div>
			<div>
				<span><a href="/infoVolunInsert">봉사활동 등록</a></span>
				<span><a href="/infoVolunList">봉사활동 리스트</a></span>
			</div>
			<div>
				<span><a href="/infoBookInsert">도서 등록</a></span>
				<span><a href="/infoBookList">도서 리스트</a></span>
			</div>
			<div>
				<span><a href="/infoCertInsert">자격증 등록</a></span>
				<span><a href="/infoCertList">자격증 리스트</a></span>
			</div>
			<div>
				<span><a href="/infoContestInsert">공모전 등록</a></span>
				<span><a href="/infoContestList">공모전 리스트</a></span>
			</div>
			<div>
				<span><a href="/infoDeptInsert">학과 등록</a></span>
				<span><a href="/infoDeptList">학과 리스트</a></span>
			</div>
			<div>
				<span><a href="/infoJobInsert">직업 등록</a></span>
				<span><a href="/infoJobList">직업리스트</a></span>
			</div>
			<div>
				<span><a href="/infoJobTInsert">직업훈련 등록</a></span>
				<span><a href="/infoJobTList">직업훈련 리스트</a></span>
			</div>
			<div>
				<span><a href="/infoLangInsert">언어 등록</a></span>
				<span><a href="/infoLangList">언어 리스트</a></span>
			</div>
			<div>
				<span><a href="/infoStudyAbInsert">어학연수 등록</a></span>
				<span><a href="/infoStudyAbList">어학연수 리스트</a></span>
			</div>
			<div>
				<span><a href="/infoSchoolInsert">학교 등록</a></span>
				<span><a href="/infoSchoolList">학교 리스트</a></span>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>