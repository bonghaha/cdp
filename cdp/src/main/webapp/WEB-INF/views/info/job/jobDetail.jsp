<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
				<div>
					<span>직업코드</span>
					<span>${infoJob.infoJobCode}</span>
				</div>
				<table>
					<tr>
						<th>직업코드</th>
						<th>직업코드ID</th>
						<th>직업명</th>
						<th>직업분야</th>
						<th>적성유형별코드</th>
						<th>직업분류코드</th>
						<th>직업설명</th>
						<th>유사직업</th>
						<th>고용평등</th>
						<th>발전가능성</th>
						<th>전망</th>
						<th>연봉</th>
					</tr>
					<c:if test="${infoJob != null}">
						<tr>
							<td>${infoJob.infoJobCode}</td>
							<td>${infoJob.infoJobdicSeq}</td>
							<td>${infoJob.infoJob}</td>
							<td>${infoJob.infoProfession}</td>
							<td>${infoJob.infoAptdTypeCode}</td>
							<td>${infoJob.infoJobCtgCode}</td>
							<td>${infoJob.infoSummary}</td>
							<td>${infoJob.infoSimilarJob}</td>
							<td>${infoJob.infoEqualemployment}</td>
							<td>${infoJob.infoPossibility}</td>
							<td>${infoJob.infoProspect}</td>
							<td>${infoJob.infoSalery}</td>
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