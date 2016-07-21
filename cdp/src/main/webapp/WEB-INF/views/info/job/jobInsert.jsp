<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>직업 등록</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancel").click(function(){
			$("#insertAction").attr("action", "/infoJobList");
			$("#insertAction").attr("method", "get");
			$("#insertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#insertAction").attr("action", "/infoJobInsert");
			$("#insertAction").attr("method", "post");
			$("#insertAction").submit();
		});
	});
	
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<h1>직업 등록</h1>
			<div>
				<form id="insertAction" action="">
					<div>
						<span>대분류명</span>
						<div>
							<span>대분류코드 : </span>
							<span><input type="text" name="infoJobBigCode"/></span>
							<span>대분류명 : </span>
							<span><input type="text" name="infoJobBigName"/></span>
						</div>
					</div>
					<div>
						<span>중분류명</span>
						<div>
							<span>중분류코드 : </span>
							<span><input type="text" name="infoJobMiddleCode"/></span>
							<span>중분류명 : </span>
							<span><input type="text" name="infoJobMiddleName"/></span>
						</div>
					</div>
					<div>
						<span>소분류명</span>
						<div>
							<span>소분류코드 : </span>
							<span><input type="text" name="infoJobSmallCode"/></span>
							<span>소분류명 : </span>
							<span><input type="text" name="infoJobSmallName"/></span>
						</div>
					</div>
					<div>
						<span>세분류명</span>
						<div>
							<span>세분류코드 : </span>
							<span><input type="text" name="infoJobDetailCode"/></span>
							<span>세분류명 : </span>
							<span><input type="text" name="infoJobDetailName"/></span>
						</div>
					</div>
					<div>
						<span>능력단위명</span>
						<span><input type="text" name="infoJobUnitName"/></span>
					</div>
					<div>
						<span>분류정보</span>
						<span><input type="text" name="infoJobDetailInfo"/></span>
					</div>
					<div>
						<span>직업정보</span>
						<span><input type="text" name="infoJobInfo"/></span>
					</div>
					<div>
						<span>구분</span>
						<span><input type="text" name="infoJobCondition"/></span>
					</div>
					<div>
						<span>적용년도</span>
						<span><input type="date" name="infoJobApplyYear"/></span>
					</div>
					<div>
						<span>변경횟차</span>
						<span><input type="text" name="infoJobChangeCount"/></span>
					</div>
					<div>
						<span>등록자</span>
						<span><input type="text" name="infoJobRegisterName"/></span>
					</div>
					<div>
						<span><input id="insertCancel" type="button" value="취소"/></span>
						<span><input id="insertSubmit" type="button" value="확인"/></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>