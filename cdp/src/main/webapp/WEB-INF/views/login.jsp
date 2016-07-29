<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<body>
	<!-- 로그인 화면 -->
	<c:choose>
	    <c:when test="${not empty sessionScope.memberLoginInfo}">
	        <h2>로그인 성공</h2>
	        <div>
				<span>이름 : ${sessionScope.memberLoginInfo.infoMemberName}</span>
				<span>권한 : <c:out value="${sessionScope.memberLoginInfo.infoMemberLevel}"/></span> 
				<span><a href="/logout">로그아웃</a></span>
	        </div>
	        <div>
				<c:if test="${sessionScope.memberLoginInfo.infoMemberLevel == 1}">
				<span><a href="/home">관리자페이지로 가기</a></span>
				</c:if>
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
		                <td align="center"><input type="submit" value="로그인"></td>
		                <td align="center"><input type="reset" value="리셋"></td>
		            </tr>
		        </table>
	        </form>
	    </c:otherwise>
	</c:choose>
</body>
</html>