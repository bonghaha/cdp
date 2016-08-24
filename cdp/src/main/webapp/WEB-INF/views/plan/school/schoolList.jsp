<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#goHome').click(function(){
			$('#planSchoolListAction').attr('action', '/home');
			$('#planSchoolListAction').submit();
		});
		$('#goPlanUniteDetail').click(function(){
			$('#planSchoolListAction').attr('action', '/planUniteDetail');
			$('#planSchoolListAction').submit();
		});
		$('#submitPlanSchool').click(function(){
			$('#planSchoolListAction').attr('action', '/planSchoolList');
			$('#planSchoolListAction').attr('method', 'post');
			$('#planSchoolListAction').submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
			<h1>계획 학교 리스트</h1>
			<h3>${sessionScope.memberLoginId}님이 등록하신 계획리스트입니다</h3>
			<div>
				<form id="planSchoolListAction" action="">
					<h4>학교</h4>
					<table>
						<tr>
							<th>계획학교코드</th>
							<th>계획통합코드</th>
							<th>추천학교코드</th>
							<th>계획상태</th>
							<th>계획내용</th>
							<th>계획변경회수</th>
							<th>계획시작일</th>
							<th>계획종료예정일</th>
							<th>계획등록일</th>
						</tr>
						<c:forEach var="psl" items="${planSchoolList}" varStatus="status">
							<input type="hidden" name="planSchoolCode" value="${psl.planSchoolCode}"/>
							<input type="hidden" name="planUniteCode" value="${psl.planUniteCode}"/>
							<input type="hidden" name="recSchoolCode" value="${psl.recSchoolCode}"/>
							<input id="count" type="hidden" value="${status.count}"/>
							<%-- 실험!!!
							<input type="hidden" name="planSchoolList" value="${planschoolList[status.index]}"/>
							<tr>
								<td>index = [${status.index}] : ${planSchoolList[status.index]}</td>
								<td>count = [${status.count}] : ${planSchoolList[status.count]}</td>
							</tr> --%>
							<tr>
								<td>${psl.planSchoolCode}</td>
								<td>${psl.planUniteCode}</td>
								<td>${psl.recSchoolCode}</td>
								<td>
									<select name="planSchoolCondition">
										<option value="${psl.planSchoolCondition}">${psl.planSchoolCondition}</option>
										<option value="계획중">계획중</option>
										<option value="실천중">실천중</option>
										<option value="실천완료">실천완료</option>
									</select>
								</td>
								<td><input type="text" name="planSchoolContent" value="${psl.planSchoolContent}"/></td>
								<td>${psl.planSchoolCount}</td>	<!-- form 내용 change 이벤트 일어나면 count+1 시키기 -->
								<td><input type="date" name="planSchoolStartDate" value="${psl.planSchoolStartDate}"/></td>
								<td><input type="date" name="planSchoolEndDate" value="${psl.planSchoolEndDate}"/></td>
								<td>${psl.planSchoolRegisterDate}</td>
								<td><input id="submitPlanSchool${status.count}" type="button" value="등록"/></td>
							</tr>
						</c:forEach>
					</table>

					<!-- 홈으로 가기 -->
					<div>
						<span><input id="goHome" type="button" value="HOME"/></span>
						<span><input id="goPlanUniteDetail" type="button" value="추천리스트보기"/></span>
						<span></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>