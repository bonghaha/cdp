<%@ page session="false" language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α���������</title>
</head>
<body>
	<h2>�α���</h2>
	<form name="form" method="post" action="loginProcess">
		<table>
			<tr>
				<td>���̵�</td>
				<td><input type="text" name="id"/></td>
			</tr>
			<tr>
				<td>�н�����</td>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="�α���"></td>
				<td><input type="reset" value="����"></td>
			</tr>
		</table>
	</form>
</body>
</html>