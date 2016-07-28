<%@ page session="false" language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인페이지</title>
</head>
<body>
	<h2>로그인</h2>
	<form name="form" method="post" action="loginProcess">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"/></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="로그인"></td>
				<td><input type="reset" value="리셋"></td>
			</tr>
		</table>
	</form>
</body>
</html>