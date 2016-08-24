<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
display:inline-block;
</style>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#goPlanUniteDetail').click(function(){
			$('#planSchoolListAction').attr('action', '/planUniteDetail');
			$('#planSchoolListAction').submit();
		});
		
		//계획학교리스트 
		$('#showPlanSchoolList').click(function(){
			var planUniteCode = $('#planUniteCode').val();
			$.ajax({
				url:'/showPlanSchoolList',
				type:'POST',
				data:{planUniteCode:planUniteCode},
				success:function(data){	//planSchoolList 담기
					$('#showPlanSchoolList').attr("disabled","disabled");
					$('#planSchoolListTop').empty();
					$('#planSchoolList').empty();
					$('#planSchoolListTop').append('<span>학교명</span>');
					$('#planSchoolListTop').append('<span>계획상태</span>');
					$('#planSchoolListTop').append('<span>계획내용</span>');
					$('#planSchoolListTop').append('<span>계획변경횟수</span>');
					$('#planSchoolListTop').append('<span>계획시작일</span>');
					$('#planSchoolListTop').append('<span>계획종료예정일</span>');
					$('#planSchoolListTop').append('<span>계획등록일</span>');
					
					$(data).each(function(index,item){
						$('#planSchoolList').append(
							'<div>'
							+'<form id="planSchoolListForm">'
							+'<input type="hidden" name="planSchoolCode" value="'+item.planSchoolCode+'"/>'
							+'<input type="hidden" name="planUniteCode" value="'+item.planUniteCode+'"/>'
							+'<span><input id="'+index+'" class="showPlanSchoolDetail" type="button" value="▶"/></span>'
							+'<span>'+item.schoolName+'</span>'
							+'<span>'
							+'<select name="planSchoolCondition">'
							+'<option value="'+item.planSchoolCondition+'">'+item.planSchoolCondition+'</option>'
							+'<option value="실천중">실천중</option>'
							+'<option value="실천완료">실천완료</option>'
							+'</select>'
							+'</span>'
							+'<span><input type="text" name="planSchoolContent" value="'+item.planSchoolContent+'"/></span>'
							+'<span><input type="text" name="planSchoolCount" value="'+item.planSchoolCount+'" readonly="readonly"/></span>'
							+'<span><input type="date" name="planSchoolStartDate" value="'+item.planSchoolStartDate+'"/></span>'
							+'<span><input type="date" name="planSchoolEndDate" value="'+item.planSchoolEndDate+'"/></span>'
							+'<span>'+item.planSchoolRegisterDate+'</td>'
							+'<span><input class="goPlanSchoolUpdate" type="button" value="등록"/></span>'
							+'<span><input class="goPlanSchoolDelete" type="button" value="삭제"/></span>'
							+'</form>'
							+'</div>'
							+'<div>'
							+'<div id="planSchoolDetailListTop'+index+'">'
							+'</div>'
							+'<div id="planSchoolDetailList'+index+'">'
							+'</div>'
							+'<div id="planSchoolDetailListBot'+index+'">'
							+'</div>'
							+'</div>');
					});
					$('#planSchoolListBot').append('<span><input id="hidePlanSchoolList" type="button" value="접기"/></span>')
					
				},
				error:function(error){
					alert("error:"+error)
				}
			});
		});
		
		//계획학교디테일리스트 보기
		$(document).on('click', '.showPlanSchoolDetail', function(){
			var planSchoolCode = this.form.planSchoolCode.value;
			var id = this.id;
			var planSchoolDetailListTop = $('#planSchoolDetailListTop'+id);
			var planSchoolDetailList = $('#planSchoolDetailList'+id);
			var planSchoolDetailListBot = $('#planSchoolDetailListBot'+id);
			$.ajax({
				url:'/planSchoolDetailList',
				type:'POST',
				data:{
					planSchoolCode:planSchoolCode
				},
				success:function(data){
					
					planSchoolDetailListTop.empty();
					planSchoolDetailList.empty();
					planSchoolDetailListTop.append('<div>');
					planSchoolDetailListTop.append('<span>내용</span>');
					planSchoolDetailListTop.append('<span>시작일</span>');
					planSchoolDetailListTop.append('<span>종료일</span>');
					planSchoolDetailListTop.append('</div>');
					planSchoolDetailListTop.append('<div>');
					planSchoolDetailListTop.append(
							'<form id="planSchoolDetailForm">'
							+'<span><input type="hidden" name="planSchoolCode" value="'+planSchoolCode+'"/>'
							+'<span><input type="hidden" name="forShowPlanSchoolDetailList" value="'+id+'"/>'
							+'<span><input type="text" name="planSchoolDetailContent" value=""/></span>'
							+'<span><input type="date" name="planSchoolDetailStartDate" value=""/></span>'
							+'<span><input type="date" name="planSchoolDetailEndDate" value=""/></span>'
							+'<span><input class="planSchoolDetailSubmit" type="button" value="확인"/></span>'
							+'</form>');
					planSchoolDetailListTop.append('</div>');
					planSchoolDetailListTop.append('<br>');
					
					$(data).each(function(index,item){
						planSchoolDetailList.append(
							'<div>'
							+'<form id="planSchoolDetailListForm">'
							+'<span><input type="text" name="planSchoolDetailContent" value="'+item.planSchoolDetailContent+'"/></span>'
							+'<span><input type="date" name="planSchoolDetailStartDate" value="'+item.planSchoolDetailStartDate+'"/></span>'
							+'<span><input type="date" name="planSchoolDetailEndDate" value="'+item.planSchoolDetailEndDate+'"/></span>'
							+'<span><input class="goPlanSchoolDetailUpdate" type="button" value="수정"/></span>'
							+'<span><input class="goPlanSchoolDetailUpdate" type="button" value="삭제"/></span>');
						
						if(item.planSchoolDetailCondition == 0){
							planSchoolDetailList.append(
								'<span><input class="goPlanSchoolDetailFinish" type="button" value="완료"/></span>'
								+'</form>'
								+'</div>'
								+'<br/>');
						}else if(item.planSchoolDetailCondition == 1){
							planSchoolDetailList.append('<span>실천완료</span>'
									+'</form>'
									+'</div>'
									+'<br/>');
						}
					});
					planSchoolDetailListBot.append('<hr>');
// 					planSchoolDetailListBot.append('<span><input id="'+index+'" class="hidePlanSchoolDetailList'+index+'" type="button" value="접기"/></span>')
				},
				error:function(error){
					alert('디테일리스트 출력 실패..');
				},
			});
		});
		
// 		$(document).on('click', '.hidePlanSchoolDetailList', function(){
// 			var id = this.id;
// 			var planSchoolDetailList = $('#planSchoolDetailList'+id);
// 			$('#planSchoolDetailListTop').empty();
// 			$('#planSchoolDetailList').empty();
// 			$('#planSchoolDetailListBot').empty();
// 			$('#showPlanSchoolDetailList').removeAttr("disabled");
// 		});
		
		$(document).on('click', '.planSchoolDetailSubmit', function(){
			var planSchoolCode = this.form.planSchoolCode.value;
			var planSchoolDetailContent = this.form.planSchoolDetailContent.value;
			var planSchoolDetailStartDate = this.form.planSchoolDetailStartDate.value;
			var planSchoolDetailEndDate = this.form.planSchoolDetailEndDate.value;
			var forShowPlanSchoolDetailList = this.form.forShowPlanSchoolDetailList.value;
			console.log("planSchoolCode : " + planSchoolCode);
			console.log("planSchoolDetailContent : " + planSchoolDetailContent);
			console.log("planSchoolDetailStartDate : " + planSchoolDetailStartDate);
			console.log("planSchoolDetailEndDate : " + planSchoolDetailEndDate);
			console.log("forShowPlanSchoolDetailList : " + forShowPlanSchoolDetailList);
			$.ajax({
				url:'/planSchoolDetailInsert',
				type:'POST',
				data:{
					planSchoolCode:planSchoolCode,
					planSchoolDetailContent:planSchoolDetailContent,
					planSchoolDetailStartDate:planSchoolDetailStartDate,
					planSchoolDetailEndDate:planSchoolDetailEndDate
				},
				success:function(){
					alert("planSchoolDetail 입력 성공!");
				},
				error:function(error){
					alert("planSchoolDetail 입력 실패..");
				}
			});
		});
		
		$(document).on('click', '#hidePlanSchoolList', function(){
			$('#planSchoolListTop').empty();
			$('#planSchoolList').empty();
			$('#planSchoolListBot').empty();
			$('#showPlanSchoolList').removeAttr("disabled");
		});
		
		/* 계획학교 각각의 폼 수정하기 */
		$(document).on('click','.goPlanSchoolUpdate',function(){
	    	var planSchoolCode = this.form.planSchoolCode.value;
	    	var planUniteCode = this.form.planUniteCode.value;
	    	var planSchoolCondition = this.form.planSchoolCondition.value;
	    	var planSchoolContent = this.form.planSchoolContent.value;
	    	var planSchoolCount = this.form.planSchoolCount.value;
	    	var planSchoolStartDate = this.form.planSchoolStartDate.value;
	    	var planSchoolEndDate = this.form.planSchoolEndDate.value;
	    	$.ajax({
	    		url:'/planSchoolUpdate',
	    		type:'POST',
	    		data:{
	    			planSchoolCode:planSchoolCode,
	    			planUniteCode:planUniteCode,
	    			planSchoolCondition:planSchoolCondition,
	    			planSchoolContent:planSchoolContent,
	    			planSchoolCount:planSchoolCount,
	    			planSchoolStartDate:planSchoolStartDate,
	    			planSchoolEndDate:planSchoolEndDate
	    		},
	    		success:function(data){
					alert("수정 성공!!!");
					$('#planSchoolListBot').empty();
					$('#showPlanSchoolList').trigger('click');
	    		},
	    		error:function(error){
	    			alert("error:"+error);
	    		}
	    	});
	    });
		
		/* 계획학교 각각의 폼 삭제하기 */
		$(document).on('click','.goPlanSchoolDelete',function(){
			var planSchoolCode = this.form.planSchoolCode.value;
			$.ajax({
				url:'/planSchoolDelete',
				type:'POST',
				data:{planSchoolCode:planSchoolCode},
				success:function(data){
					alert("삭제 성공!!!");
					$('#planSchoolListBot').empty();
					$('#showPlanSchoolList').trigger('click');
				},
				error:function(error){
					alert("error:" + error);
				}
			});
		});
		
//----------------------------------------------------------------------------------------------------------------		
		//계획학과리스트 
		$('#showPlanDeptList').click(function(){
			var planUniteCode = $('#planUniteCode').val();
			$.ajax({
				url:'/showPlanDeptList',
				type:'POST',
				data:{planUniteCode:planUniteCode},
				success:function(data){	//planDeptList 담기
					$('#showPlanDeptList').attr("disabled","disabled");
					$('#planDeptListTop').empty();
					$('#planDeptList').empty();
					$('#planDeptListTop').append('<span>학과명</span>');
					$('#planDeptListTop').append('<span>계획상태</span>');
					$('#planDeptListTop').append('<span>계획내용</span>');
					$('#planDeptListTop').append('<span>계획변경횟수</span>');
					$('#planDeptListTop').append('<span>계획시작일</span>');
					$('#planDeptListTop').append('<span>계획종료예정일</span>');
					$('#planDeptListTop').append('<span>계획등록일</span>');
					
					$(data).each(function(index,item){
						$('#planDeptList').append(
							'<form id="planDeptListForm">'
							+'<input type="hidden" name="planDeptCode" value="'+item.planDeptCode+'"/>'
							+'<input type="hidden" name="planUniteCode" value="'+item.planUniteCode+'"/>'
							+'<span>'+item.mClass+'</span>'
							+'<span>'
							+'<select name="planDeptCondition">'
							+'<option value="'+item.planDeptCondition+'">'+item.planDeptCondition+'</option>'
							+'<option value="실천중">실천중</option>'
							+'<option value="실천완료">실천완료</option>'
							+'</select>'
							+'</span>'
							+'<span><input type="text" name="planDeptContent" value="'+item.planDeptContent+'"/></span>'
							+'<span><input type="text" name="planDeptCount" value="'+item.planDeptCount+'" readonly="readonly"/></span>'
							+'<span><input type="date" name="planDeptStartDate" value="'+item.planDeptStartDate+'"/></span>'
							+'<span><input type="date" name="planDeptEndDate" value="'+item.planDeptEndDate+'"/></span>'
							+'<span>'+item.planDeptRegisterDate+'</td>'
							+'<span><input class="goPlanDeptUpdate" type="button" value="등록"/></span>'
							+'<span><input class="goPlanDeptDelete" type="button" value="삭제"/></span>'
							+'</form>');
					});
					$('#planDeptListBot').append('<span><input id="hidePlanDeptList" type="button" value="접기"/></span>')
				},
				error:function(error){
					alert("error:"+error)
				}
			});
		});
		
		$(document).on('click', '#hidePlanDeptList', function(){
			$('#planDeptListTop').empty();
			$('#planDeptList').empty();
			$('#planDeptListBot').empty();
			$('#showPlanDeptList').removeAttr("disabled");
		});
		
		/* 계획학과 각각의 폼 수정하기 */
		$(document).on('click','.goPlanDeptUpdate',function(){
	    	var planDeptCode = this.form.planDeptCode.value;
	    	var planUniteCode = this.form.planUniteCode.value;
	    	var planDeptCondition = this.form.planDeptCondition.value;
	    	var planDeptContent = this.form.planDeptContent.value;
	    	var planDeptCount = this.form.planDeptCount.value;
	    	var planDeptStartDate = this.form.planDeptStartDate.value;
	    	var planDeptEndDate = this.form.planDeptEndDate.value;
	    	$.ajax({
	    		url:'/planDeptUpdate',
	    		type:'POST',
	    		data:{
	    			planDeptCode:planDeptCode,
	    			planUniteCode:planUniteCode,
	    			planDeptCondition:planDeptCondition,
	    			planDeptContent:planDeptContent,
	    			planDeptCount:planDeptCount,
	    			planDeptStartDate:planDeptStartDate,
	    			planDeptEndDate:planDeptEndDate
	    		},
	    		success:function(data){
					alert("수정 성공!!!");
					$('#planDeptListBot').empty();
					$('#showPlanDeptList').trigger('click');
	    		},
	    		error:function(error){
	    			alert("error:"+error);
	    		}
	    	});
	    });
		
		/* 계획학과 각각의 폼 삭제하기 */
		$(document).on('click','.goPlanDeptDelete',function(){
			var planDeptCode = this.form.planDeptCode.value;
			$.ajax({
				url:'/planDeptDelete',
				type:'POST',
				data:{planDeptCode:planDeptCode},
				success:function(data){
					alert("삭제 성공!!!");
					$('#planDeptListBot').empty();
					$('#showPlanDeptList').trigger('click');
				},
				error:function(error){
					alert("error:" + error);
				}
			});
		});
		
//------------------------------------------------------------------------------------------------
		//계획자격증리스트 
		$('#showPlanCertList').click(function(){
			var planUniteCode = $('#planUniteCode').val();
			$.ajax({
				url:'/showPlanCertList',
				type:'POST',
				data:{planUniteCode:planUniteCode},
				success:function(data){	//planSchoolList 담기
					$('#showPlanCertList').attr("disabled","disabled");
					$('#planCertListTop').empty();
					$('#planCertList').empty();
					$('#planCertListTop').append('<span>자격증명</span>');
					$('#planCertListTop').append('<span>계획상태</span>');
					$('#planCertListTop').append('<span>계획내용</span>');
					$('#planCertListTop').append('<span>계획변경횟수</span>');
					$('#planCertListTop').append('<span>계획시작일</span>');
					$('#planCertListTop').append('<span>계획종료예정일</span>');
					$('#planCertListTop').append('<span>계획등록일</span>');
					
					$(data).each(function(index,item){
						$('#planCertList').append(
							'<form id="planCertListForm">'
							+'<input type="hidden" name="planCertCode" value="'+item.planCertCode+'"/>'
							+'<input type="hidden" name="planUniteCode" value="'+item.planUniteCode+'"/>'
							+'<span>'+item.jmFldNm+'</span>'
							+'<span>'
							+'<select name="planCertCondition">'
							+'<option value="'+item.planCertCondition+'">'+item.planCertCondition+'</option>'
							+'<option value="실천중">실천중</option>'
							+'<option value="실천완료">실천완료</option>'
							+'</select>'
							+'</span>'
							+'<span><input type="text" name="planCertContent" value="'+item.planCertContent+'"/></span>'
							+'<span><input type="text" name="planCertCount" value="'+item.planCertCount+'" readonly="readonly"/></span>'
							+'<span><input type="date" name="planCertStartDate" value="'+item.planCertStartDate+'"/></span>'
							+'<span><input type="date" name="planCertEndDate" value="'+item.planCertEndDate+'"/></span>'
							+'<span>'+item.planCertRegisterDate+'</td>'
							+'<span><input class="goPlanCertUpdate" type="button" value="등록"/></span>'
							+'<span><input class="goPlanCertDelete" type="button" value="삭제"/></span>'
							+'</form>');
					});
					$('#planCertListBot').append('<span><input id="hidePlanCertList" type="button" value="접기"/></span>')
				},
				error:function(error){
					alert("error:"+error)
				}
			});
		});
		
		$(document).on('click', '#hidePlanCertList', function(){
			$('#planCertListTop').empty();
			$('#planCertList').empty();
			$('#planCertListBot').empty();
			$('#showPlanCertList').removeAttr("disabled");
		});
		
		/* 계획자격증 각각의 폼 수정하기 */
		$(document).on('click','.goPlanCertUpdate',function(){
	    	var planCertCode = this.form.planCertCode.value;
	    	var planUniteCode = this.form.planUniteCode.value;
	    	var planCertCondition = this.form.planCertCondition.value;
	    	var planCertContent = this.form.planCertContent.value;
	    	var planCertCount = this.form.planCertCount.value;
	    	var planCertStartDate = this.form.planCertStartDate.value;
	    	var planCertEndDate = this.form.planCertEndDate.value;
	    	$.ajax({
	    		url:'/planCertUpdate',
	    		type:'POST',
	    		data:{
	    			planCertCode:planCertCode,
	    			planUniteCode:planUniteCode,
	    			planCertCondition:planCertCondition,
	    			planCertContent:planCertContent,
	    			planCertCount:planCertCount,
	    			planCertStartDate:planCertStartDate,
	    			planCertEndDate:planCertEndDate
	    		},
	    		success:function(data){
					alert("수정 성공!!!");
					$('#planCertListBot').empty();
					$('#showPlanCertList').trigger('click');
	    		},
	    		error:function(error){
	    			alert("error:"+error);
	    		}
	    	});
	    });
		
		/* 계획자격증 각각의 폼 삭제하기 */
		$(document).on('click','.goPlanCertDelete',function(){
			var planCertCode = this.form.planCertCode.value;
			$.ajax({
				url:'/planCertDelete',
				type:'POST',
				data:{planCertCode:planCertCode},
				success:function(data){
					alert("삭제 성공!!!");
					$('#planCertListBot').empty();
					$('#showPlanCertList').trigger('click');
				},
				error:function(error){
					alert("error:" + error);
				}
			});
		});
	});
</script>
</head>
<body>
	<!-- 
		act쪽에서 그래프로 plan과 resume 비교하기
	 -->
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
		<div align="center">
		<img src="/resources/image/ing66.PNG">
		</div>
			<h1>실천 리스트</h1>
			<div>${sessionScope.memberLoginId}님이 등록하신 계획입니다</div>
			<div>직업 : ${planUnite.job}</div>
			<div>계획 제목 : ${planUnite.planUniteTitle}</div>
			<div>계획 내용 : ${planUnite.planUniteContent}</div>
			<div>계획 등록일 : ${planUnite.planUniteRegisterDate}</div>
			<input id="planUniteCode" type="hidden" name="planUniteCode" value="${planUnite.planUniteCode}"/>
			<hr>
			<div>
				<!-- 계획학교리스트 -->
				<div>
					<input id="showPlanSchoolList" type="button" value="학교"/>
				</div>
				<!-- 추천학교 리스트 보여주기(ajax) -->
				<div>
					<div id="planSchoolListTop">
					</div>
					<div id="planSchoolList">
					</div>
					<div id="planSchoolListBot">
					</div>
				</div>
				<hr>
				
				<!-- 계획학과리스트 -->
				<div>
					<input id="showPlanDeptList" type="button" value="학과"/>
				</div>
				<!-- 추천학과 리스트 보여주기(ajax) -->
				<div>
					<div id="planDeptListTop">
					</div>
					<div id="planDeptList">
					</div>
					<div id="planDeptListBot">
					</div>
				</div>
				<hr>
				
				<!-- 계획자격증리스트 -->
				<div>
					<input id="showPlanCertList" type="button" value="자격증"/>
				</div>
				<!-- 추천자격증 리스트 보여주기(ajax) -->
				<div>	
					<div id="planCertListTop">
					</div>
					<div id="planCertList">
					</div>
					<div id="planCertListBot">
					</div>
				</div>
				<hr>
				
				<!-- 홈으로 가기 -->
				<form id="planSchoolListAction">
					<input type="hidden" name="jobdicSeq" value="${planUnite.jobdicSeq}"/>
					<input type="hidden" name="planUniteCode" value="${planUnite.planUniteCode}"/>
					<div>
						<span><input id="goPlanUniteDetail" type="button" value="계획통합상세보기"/></span>
						<span></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>