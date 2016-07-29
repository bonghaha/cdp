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
	<c:choose>
		<!-- 로그인 성공시 화면 -->
	    <c:when test="${not empty sessionScope.memberLoginInfo}">
	        <h2>로그인 성공</h2>
			        이름 : ${sessionScope.memberLoginInfo.infoMemberName}
			 
			        권한 : <c:out value="${sessionScope.memberLoginInfo.infoMemberLevel}"/> 
	        <a href="/logout">로그아웃</a>
	        <a href="page1">페이지1</a>  <a href="page2">페이지2</a>
	    </c:when>
	    
	    <c:otherwise>
	        <h2>로그인</h2>
	        <form name="form1" method="post" action="/loginProcess">
	        <table>
	            <tr>
	                <td>ID</td>
	                <td><input type="text" name="userId"></td>
	            </tr>
	            <tr>
	                <td>PW</td>
	                <td><input type="password" name="password"></td>
	            </tr>
	        </table>
	        <table>
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