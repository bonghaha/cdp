<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<span>직업명 : </span>
			<span>${recCert.job}</span>
		</div>
		<div>
			<span>자격증명 : </span>
			<span>${recCert.jmFldNm}</span>
		</div>
		<div>추천이유 : </div>
		<div>${recCert.recCertReason}</div>
		<div>추천내용 : </div>
		<div>${recCert.recCertContent}</div>
	</div>
	<div>
		<input type="button" value="창닫기" onClick="window.close()">
	</div>

</body>
</html>