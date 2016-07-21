<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="page">
		<t:insertAttribute name="header"/>
			<div class="content">
				<t:insertAttribute name="body"/>
			</div>
		<t:insertAttribute name="footer"/>
	</div>
</body>
</html>