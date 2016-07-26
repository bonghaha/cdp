<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#goJobList").click(function(){
		$("#jobDetailAction").attr("action", "/infoJobList");
		$("#jobDetailAction").submit();
	});
	/* 추천등록 */
	$("#recSchoolInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recSchoolInsert");
		$("#jobDetailAction").submit();
	});
	$("#recDeptInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recDeptInsert");
		$("#jobDetailAction").submit();
	});
	$("#recLangInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recLangInsert");
		$("#jobDetailAction").submit();
	});
	$("#recCertInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recCertInsert");
		$("#jobDetailAction").submit();
	});
	$("#recContestInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recContestInsert");
		$("#jobDetailAction").submit();
	});
	$("#recStudyAbInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recStudyAbInsert");
		$("#jobDetailAction").submit();
	});
	$("#recVolunInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recVolunInsert");
		$("#jobDetailAction").submit();
	});
	$("#recJobTInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recJobTInsert");
		$("#jobDetailAction").submit();
	});
	$("#recBookInsert").click(function(){
		$("#jobDetailAction").attr("action", "/recBookInsert");
		$("#jobDetailAction").submit();
	});
	
	/* 추천리스트 */
	$("#recSchoolList").click(function(){
		$("#jobDetailAction").attr("action", "/recSchoolList");
		$("#jobDetailAction").submit();
	});
	$("#recDeptList").click(function(){
		$("#jobDetailAction").attr("action", "/recDeptList");
		$("#jobDetailAction").submit();
	});
	$("#recLangList").click(function(){
		$("#jobDetailAction").attr("action", "/recLangList");
		$("#jobDetailAction").submit();
	});
	$("#recCertList").click(function(){
		$("#jobDetailAction").attr("action", "/recCertList");
		$("#jobDetailAction").submit();
	});
	$("#recContestList").click(function(){
		$("#jobDetailAction").attr("action", "/recContestList");
		$("#jobDetailAction").submit();
	});
	$("#recStudyAbList").click(function(){
		$("#jobDetailAction").attr("action", "/recStudyAbList");
		$("#jobDetailAction").submit();
	});
	$("#recVolunList").click(function(){
		$("#jobDetailAction").attr("action", "/recVolunList");
		$("#jobDetailAction").submit();
	});
	$("#recJobTList").click(function(){
		$("#jobDetailAction").attr("action", "/recJobTList");
		$("#jobDetailAction").submit();
	});
	$("#recBookList").click(function(){
		$("#jobDetailAction").attr("action", "/recBookList");
		$("#jobDetailAction").submit();
	});
	
});
</script>		
<style>
	table,th,tr,td{
		border : 1px black solid;
	}
</style>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<h1>직업 상세보기</h1>
			<div>
				<table>
					<tr>
						<th>직업분류번호</th>
						<th>대분류명</th>
						<th>중분류명</th>
						<th>소분류명</th>
						<th>세분류명</th>
						<th>능력단위명</th>
						<th>분류정보</th>
						<th>직업정보</th>
						<th>구분</th>
						<th>적용년도</th>
						<th>변경횟차</th>
						<th>등록일</th>
						<th>등록자</th>
					</tr>
					<c:if test="${infoJob != null}">
						<tr>
							<td>${infoJob.infoJobCode}</td>
							<td>${infoJob.infoJobBigName}</td>
							<td>${infoJob.infoJobMiddleName}</td>
							<td>${infoJob.infoJobSmallName}</td>
							<td>${infoJob.infoJobDetailName}</td>
							<td>${infoJob.infoJobUnitName}</td>
							<td>${infoJob.infoJobDetailInfo}</td>
							<td>${infoJob.infoJobInfo}</td>
							<td>${infoJob.infoJobCondition}</td>
							<td>${infoJob.infoJobApplyYear}</td>
							<td>${infoJob.infoJobChangeCount}</td>
							<td>${infoJob.infoJobRegisterDate}</td>
							<td>${infoJob.infoJobRegisterName}</td>
						</tr>
					</c:if>
				</table>
				<div>
					<form id="jobDetailAction" action="">
						<input type="hidden" name="infoJobCode" value="${infoJob.infoJobCode}"/>
						<input type="hidden" name="searchType" value="${searchType}"/>
						<input type="hidden" name="searchWord" value="${searchWord}"/>
						<div>
							<span><input id="goJobList" type="button" value="리스트로 가기"/></span>
						</div>
						<hr>
						<div>
							<span><input id="recSchoolList" type="button" value="추천학교리스트"/></span>
							<span><input id="recSchoolInsert" type="button" value="추천학교추가"/></span>
						</div>
						<br>
						<div>
							<span><input id="recDeptList" type="button" value="추천학과리스트"/></span>
							<span><input id="recDeptInsert" type="button" value="추천학과추가"/></span>
						</div>
						<br>
						<div>
							<span><input id="recLangList" type="button" value="추천언어리스트"/></span>
							<span><input id="recLangInsert" type="button" value="추천언어추가"/></span>
						</div>
						<br>
						<div>
							<span><input id="recCertList" type="button" value="추천자격증리스트"/></span>
							<span><input id="recCertInsert" type="button" value="추천자격증추가"/></span>
						</div>
						<br>
						<div>
							<span><input id="recContestList" type="button" value="추천공모전리스트"/></span>
							<span><input id="recContestInsert" type="button" value="추천공모전추가"/></span>
						</div>
						<br>
						<div>
							<span><input id="recStudyAbList" type="button" value="추천어학연수리스트"/></span>
							<span><input id="recStudyAbInsert" type="button" value="추천어학연수추가"/></span>
						</div>
						<br>
						<div>
							<span><input id="recVolunList" type="button" value="추천봉사활동리스트"/></span>
							<span><input id="recVolunInsert" type="button" value="추천봉사활동추가"/></span>
						</div>
						<br>
						<div>
							<span><input id="recJobTList" type="button" value="추천직업훈련리스트"/></span>
							<span><input id="recJobTInsert" type="button" value="추천직업훈련추가"/></span>
						</div>
						<br>
						<div>
							<span><input id="recBookList" type="button" value="추천도서리스트"/></span>	
							<span><input id="recBookInsert" type="button" value="추천도서추가"/></span>					
						</div>
					</form>
				</div>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>