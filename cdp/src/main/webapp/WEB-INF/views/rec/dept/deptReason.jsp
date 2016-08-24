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
			<span>${recDept.job}</span>
		</div>
		<div>
			<span>학과명 : </span>
			<span>${recDept.mClass}</span>
		</div>
		<div>추천이유 : </div>
		<div>${recDept.recDeptReason}</div>
		<div>추천내용 : </div>
		<div>${recDept.recDeptContent}</div>
	</div>
	<div>
		<input type="button" value="창닫기" onClick="window.close()">
	</div>

</body>
</html>