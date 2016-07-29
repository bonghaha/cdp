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
				<h2>로그인 성공</h2>
				<div>
					<span>이름 : ${sessionScope.memberLoginInfo.infoMemberName}</span>
					<span>권한 : <c:out value="${sessionScope.memberLoginInfo.infoMemberLevel}"/></span> 
					<span><a href="/logout">로그아웃</a></span>
				</div>
				</c:when>
			
				<c:otherwise>
					<h2>로그인</h2>
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
								<td><input type="submit" value="로그인"></td>
								<td><input type="reset" value="리셋"></td>
								<td><a href="/infoMemberInsert">회원가입</a></td>
							</tr>
						</table>
					</form>
				</c:otherwise>
			</c:choose>
			
			<div>
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
			<form action="/recBookList">
			<div>
				<span><input type="text" name="infoJobUnitName"></span>
				<span><input type="submit" value="직업입력"/></span>
			</div>
			</form>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>