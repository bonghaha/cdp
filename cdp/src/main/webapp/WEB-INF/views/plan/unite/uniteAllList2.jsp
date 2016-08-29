<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.processVar{
display: block;
background-color: red;}

</style>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
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
							+'<span><input id="'+index+'" class="showPlanSchoolDetail" name="showPlanSchoolDetail'+index+'" type="button" value="▶"/></span>'
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
							+'<div class="w3-progress-container">'
							+'<div id="myBar" class="w3-progressbar w3-yellow" style="width:'+item.planSchoolPercent+'">'+item.planSchoolPercent+'</div>'
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
					$('#planSchoolListBot').append('<span><input id="hidePlanSchoolList" type="button" value="학교접기"/></span>')
					
				},
				error:function(error){
					alert("error:"+error)
				}
			});
		});
		
		//계획학교디테일리스트 보기
		$(document).on('click', '.showPlanSchoolDetail', function(){
			var planSchoolDetailBtn = this.name;
			var planSchoolCode = this.form.planSchoolCode.value;
			var no = this.id;
			var planSchoolDetailListTop = $('#planSchoolDetailListTop'+no);
			var planSchoolDetailList = $('#planSchoolDetailList'+no);
			var planSchoolDetailListBot = $('#planSchoolDetailListBot'+no);
			$.ajax({
				url:'/planSchoolDetailList',
				type:'POST',
				data:{
					planSchoolCode:planSchoolCode
				},
				success:function(data){
					$('input[name='+planSchoolDetailBtn+']').attr("disabled","disabled");
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
							+'<span><input type="text" name="planSchoolDetailContent" value=""/></span>'
							+'<span><input type="date" name="planSchoolDetailStartDate" value=""/></span>'
							+'<span><input type="date" name="planSchoolDetailEndDate" value=""/></span>'
							+'<span><input class="planSchoolDetailSubmit" type="button" value="확인"/></span>'
							+'</form>');
					planSchoolDetailListTop.append('</div>');
					planSchoolDetailListTop.append('<br>');
					
					$(data).each(function(index,item){
						if(item.planSchoolDetailCondition == 0){
							planSchoolDetailList.append(
								'<div>'
								+'<form id="planSchoolDetailListForm" name="planSchoolDetailListForm'+index+'">'
								+'<input type="hidden" name="indexVal" value="'+no+'">'
								+'<input type="hidden" name="planSchoolDetailCode" value="'+item.planSchoolDetailCode+'">'
								+'<span><input type="text" name="planSchoolDetailContent" value="'+item.planSchoolDetailContent+'"/></span>'
								+'<span><input type="date" name="planSchoolDetailStartDate" value="'+item.planSchoolDetailStartDate+'"/></span>'
								+'<span><input type="date" name="planSchoolDetailEndDate" value="'+item.planSchoolDetailEndDate+'"/></span>'
								+'<span><input class="goPlanSchoolDetailUpdate" type="button" value="수정"/></span>'
								+'<span><input class="goPlanSchoolDetailUpdate" type="button" value="삭제"/></span>'
								+'<span><input id="'+no+'" class="goPlanSchoolDetailComplete" type="button" value="완료"/></span>'
								+'</form>'
								+'</div>');
						}
						if(item.planSchoolDetailCondition == 1){
							planSchoolDetailList.append(
									'<div>'
									+'<span><input type="text" name="planSchoolDetailContent" readonly="readonly" value="'+item.planSchoolDetailContent+'"/></span>'
									+'<span><input type="date" name="planSchoolDetailStartDate" readonly="readonly" value="'+item.planSchoolDetailStartDate+'"/></span>'
									+'<span><input type="date" name="planSchoolDetailEndDate" readonly="readonly" value="'+item.planSchoolDetailEndDate+'"/></span>'
									+'<span>실천완료</span>'
									+'</div>');
						}
						planSchoolDetailList.append('<br/>');
					});
					planSchoolDetailListBot.append(
						'<div>'
						+'<span><input id="'+no+'" class="hidePlanSchoolDetailList" name="hidePlanSchoolList'+no+'" type="button" value="접기"/></span>'
						+'</div>'
						+'<hr>');
				},
				error:function(error){
					alert('디테일리스트 출력 실패..');
				},
			});
		});
		
		// 계획학교상세완료처리
		// plan_school_detail_code 값에 해당하는 condition 1로 바꾸기
		// plan_school_detail_condition 1로 바꾸기
		$(document).on('click', '.goPlanSchoolDetailComplete', function(){
			var no = this.id; // 계획학교상세리스트보기버튼 no
			var planSchoolDetailCode = this.form.planSchoolDetailCode.value;
			console.log("planSchoolDetailCode : " + planSchoolDetailCode);
			$.ajax({
				url:'/planSchoolDetailComplete',
				type:'POST',
				data:{
					planSchoolDetailCode:planSchoolDetailCode
				},
				success:function(data){
					alert("완료처리 성공!");
					$('#hidePlanSchoolList').trigger('click');
					$('#showPlanSchoolList').trigger('click');
					console.log("no :" + no);
				},
				error:function(error){
					alert("완료처리 실패..");
				}
			});
		});
		
		// 계획학교상세리스트 접기
		$(document).on('click', '.hidePlanSchoolDetailList', function(){
			console.log("hidePlanSchoolDetailList 버튼 클릭 !");
			var hidePlanSchoolDetailListBtn = this.name;
			var no = this.id;
			var planSchoolDetailListTop = $('#planSchoolDetailListTop'+no);
			var planSchoolDetailList = $('#planSchoolDetailList'+no);
			var planSchoolDetailListBot = $('#planSchoolDetailListBot'+no);
			planSchoolDetailListTop.empty();
			planSchoolDetailList.empty();
			planSchoolDetailListBot.empty();
			$('input[name=showPlanSchoolDetail'+no+']').removeAttr("disabled");
		});
		
		// 계획학교상세등록
		$(document).on('click', '.planSchoolDetailSubmit', function(){
			var planSchoolCode = this.form.planSchoolCode.value;
			var planSchoolDetailContent = this.form.planSchoolDetailContent.value;
			var planSchoolDetailStartDate = this.form.planSchoolDetailStartDate.value;
			var planSchoolDetailEndDate = this.form.planSchoolDetailEndDate.value;
			console.log("planSchoolCode : " + planSchoolCode);
			console.log("planSchoolDetailContent : " + planSchoolDetailContent);
			console.log("planSchoolDetailStartDate : " + planSchoolDetailStartDate);
			console.log("planSchoolDetailEndDate : " + planSchoolDetailEndDate);
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
					$('#hidePlanSchoolList').trigger('click');
					$('#showPlanSchoolList').trigger('click');
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
							'<div>'
							+'<form id="planDeptListForm">'
							+'<input type="hidden" name="planDeptCode" value="'+item.planDeptCode+'"/>'
							+'<input type="hidden" name="planUniteCode" value="'+item.planUniteCode+'"/>'
							+'<span><input id="'+index+'" class="showPlanDeptDetail" name="showPlanDeptDetail'+index+'" type="button" value="▶"/></span>'
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
							+'</form>'
							+'</div>'
							+'<div class="w3-progress-container">'
							+'<div id="myBar" class="w3-progressbar w3-yellow" style="width:'+item.planDeptPercent+'">'+item.planDeptPercent+'</div>'
							+'</div>'
							+'<div>'
							+'<div id="planDeptDetailListTop'+index+'">'
							+'</div>'
							+'<div id="planDeptDetailList'+index+'">'
							+'</div>'
							+'<div id="planDeptDetailListBot'+index+'">'
							+'</div>'
							+'</div>');
					});
					$('#planDeptListBot').append('<span><input id="hidePlanDeptList" type="button" value="학과접기"/></span>')
					
				},
				error:function(error){
					alert("error:"+error)
				}
			});
		});
		
		//계획학과디테일리스트 보기
		$(document).on('click', '.showPlanDeptDetail', function(){
			var planDeptDetailBtn = this.name;
			var planDeptCode = this.form.planDeptCode.value;
			var no = this.id;
			var planDeptDetailListTop = $('#planDeptDetailListTop'+no);
			var planDeptDetailList = $('#planDeptDetailList'+no);
			var planDeptDetailListBot = $('#planDeptDetailListBot'+no);
			console.log("no :" + no);
			$.ajax({
				url:'/planDeptDetailList',
				type:'POST',
				data:{
					planDeptCode:planDeptCode
				},
				success:function(data){
					$('input[name='+planDeptDetailBtn+']').attr("disabled","disabled");
					planDeptDetailListTop.empty();
					planDeptDetailList.empty();
					planDeptDetailListTop.append('<div>');
					planDeptDetailListTop.append('<span>내용</span>');
					planDeptDetailListTop.append('<span>시작일</span>');
					planDeptDetailListTop.append('<span>종료일</span>');
					planDeptDetailListTop.append('</div>');
					planDeptDetailListTop.append('<div>');
					planDeptDetailListTop.append(
							'<form id="planDeptDetailForm">'
							+'<span><input type="hidden" name="planDeptCode" value="'+planDeptCode+'"/>'
							+'<span><input type="text" name="planDeptDetailContent" value=""/></span>'
							+'<span><input type="date" name="planDeptDetailStartDate" value=""/></span>'
							+'<span><input type="date" name="planDeptDetailEndDate" value=""/></span>'
							+'<span><input class="planDeptDetailSubmit" type="button" value="확인"/></span>'
							+'</form>');
					planDeptDetailListTop.append('</div>');
					planDeptDetailListTop.append('<br>');
					
					$(data).each(function(index,item){
						if(item.planDeptDetailCondition == 0){
							planDeptDetailList.append(
								'<div>'
								+'<form id="planDeptDetailListForm" name="planDeptDetailListForm'+index+'">'
								+'<input type="hidden" name="indexVal" value="'+no+'">'
								+'<input type="hidden" name="planDeptDetailCode" value="'+item.planDeptDetailCode+'">'
								+'<span><input type="text" name="planDeptDetailContent" value="'+item.planDeptDetailContent+'"/></span>'
								+'<span><input type="date" name="planDeptDetailStartDate" value="'+item.planDeptDetailStartDate+'"/></span>'
								+'<span><input type="date" name="planDeptDetailEndDate" value="'+item.planDeptDetailEndDate+'"/></span>'
								+'<span><input class="goPlanDeptDetailUpdate" type="button" value="수정"/></span>'
								+'<span><input class="goPlanDeptDetailUpdate" type="button" value="삭제"/></span>'
								+'<span><input id="'+no+'" class="goPlanDeptDetailComplete" type="button" value="완료"/></span>'
								+'</form>'
								+'</div>');
						}
						if(item.planDeptDetailCondition == 1){
							planDeptDetailList.append(
									'<div>'
									+'<span><input type="text" name="planDeptDetailContent" readonly="readonly" value="'+item.planDeptDetailContent+'"/></span>'
									+'<span><input type="date" name="planDeptDetailStartDate" readonly="readonly" value="'+item.planDeptDetailStartDate+'"/></span>'
									+'<span><input type="date" name="planDeptDetailEndDate" readonly="readonly" value="'+item.planDeptDetailEndDate+'"/></span>'
									+'<span>실천완료</span>'
									+'</div>');
						}
						planDeptDetailList.append('<br/>');
					});
					planDeptDetailListBot.append(
						'<div>'
						+'<span><input id="'+no+'" class="hidePlanDeptDetailList" name="hidePlanDeptList'+no+'" type="button" value="접기"/></span>'
						+'</div>'
						+'<hr>');
				},
				error:function(error){
					alert('디테일리스트 출력 실패..');
				},
			});
		});
		
		// 계획학과상세완료처리
		// plan_dept_detail_code 값에 해당하는 condition 1로 바꾸기
		// plan_dept_detail_condition 1로 바꾸기
		$(document).on('click', '.goPlanDeptDetailComplete', function(){
			var no = this.id; // 계획학교상세리스트보기버튼 no
			var planDeptDetailCode = this.form.planDeptDetailCode.value;
			console.log("planDeptDetailCode : " + planDeptDetailCode);
			$.ajax({
				url:'/planDeptDetailComplete',
				type:'POST',
				data:{
					planDeptDetailCode:planDeptDetailCode
				},
				success:function(data){
					alert("완료처리 성공!");
					$('#hidePlanDeptList').trigger('click');
					$('#showPlanDeptList').trigger('click');
					console.log("no :" + no);
				},
				error:function(error){
					alert("완료처리 실패..");
				}
			});
		});
		
		// 계획학과상세리스트 접기
		$(document).on('click', '.hidePlanDeptDetailList', function(){
			console.log("hidePlanDeptDetailList 버튼 클릭 !");
			var hidePlanDeptDetailListBtn = this.name;
			var no = this.id;
			var planDeptDetailListTop = $('#planDeptDetailListTop'+no);
			var planDeptDetailList = $('#planDeptDetailList'+no);
			var planDeptDetailListBot = $('#planDeptDetailListBot'+no);
			planDeptDetailListTop.empty();
			planDeptDetailList.empty();
			planDeptDetailListBot.empty();
			$('input[name=showPlanDeptDetail'+no+']').removeAttr("disabled");
		});
		
		// 계획학과상세등록
		$(document).on('click', '.planDeptDetailSubmit', function(){
			var planDeptCode = this.form.planDeptCode.value;
			var planDeptDetailContent = this.form.planDeptDetailContent.value;
			var planDeptDetailStartDate = this.form.planDeptDetailStartDate.value;
			var planDeptDetailEndDate = this.form.planDeptDetailEndDate.value;
			console.log("planDeptCode : " + planDeptCode);
			console.log("planDeptDetailContent : " + planDeptDetailContent);
			console.log("planDeptDetailStartDate : " + planDeptDetailStartDate);
			console.log("planDeptDetailEndDate : " + planDeptDetailEndDate);
			$.ajax({
				url:'/planDeptDetailInsert',
				type:'POST',
				data:{
					planDeptCode:planDeptCode,
					planDeptDetailContent:planDeptDetailContent,
					planDeptDetailStartDate:planDeptDetailStartDate,
					planDeptDetailEndDate:planDeptDetailEndDate
				},
				success:function(){
					alert("planDeptDetail 입력 성공!");
					$('#hidePlanDeptList').trigger('click');
					$('#showPlanDeptList').trigger('click');
				},
				error:function(error){
					alert("planDeptDetail 입력 실패..");
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
		
		/* 계획학교 각각의 폼 삭제하기 */
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
				success:function(data){	//planCertList 담기
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
							'<div>'
							+'<form id="planCertListForm">'
							+'<input type="hidden" name="planCertCode" value="'+item.planCertCode+'"/>'
							+'<input type="hidden" name="planUniteCode" value="'+item.planUniteCode+'"/>'
							+'<span><input id="'+index+'" class="showPlanCertDetail" name="showPlanCertDetail'+index+'" type="button" value="▶"/></span>'
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
							+'</form>'
							+'</div>'
							+'<div class="w3-progress-container">'
							+'<div id="myBar" class="w3-progressbar w3-yellow" style="width:'+item.planCertPercent+'">'+item.planCertPercent+'</div>'
							+'</div>'
							+'<div>'
							+'<div id="planCertDetailListTop'+index+'">'
							+'</div>'
							+'<div id="planCertDetailList'+index+'">'
							+'</div>'
							+'<div id="planCertDetailListBot'+index+'">'
							+'</div>'
							+'</div>');
					});
					$('#planCertListBot').append('<span><input id="hidePlanCertList" type="button" value="자격증접기"/></span>')
					
				},
				error:function(error){
					alert("error:"+error)
				}
			});
		});
		
		//계획자격증 디테일리스트 보기
		$(document).on('click', '.showPlanCertDetail', function(){
			var planCertDetailBtn = this.name;
			var planCertCode = this.form.planCertCode.value;
			var no = this.id;
			var planCertDetailListTop = $('#planCertDetailListTop'+no);
			var planCertDetailList = $('#planCertDetailList'+no);
			var planCertDetailListBot = $('#planCertDetailListBot'+no);
			$.ajax({
				url:'/planCertDetailList',
				type:'POST',
				data:{
					planCertCode:planCertCode
				},
				success:function(data){
					$('input[name='+planCertDetailBtn+']').attr("disabled","disabled");
					planCertDetailListTop.empty();
					planCertDetailList.empty();
					planCertDetailListTop.append('<div>');
					planCertDetailListTop.append('<span>내용</span>');
					planCertDetailListTop.append('<span>시작일</span>');
					planCertDetailListTop.append('<span>종료일</span>');
					planCertDetailListTop.append('</div>');
					planCertDetailListTop.append('<div>');
					planCertDetailListTop.append(
							'<form id="planCertDetailForm">'
							+'<span><input type="hidden" name="planCertCode" value="'+planCertCode+'"/>'
							+'<span><input type="text" name="planCertDetailContent" value=""/></span>'
							+'<span><input type="date" name="planCertDetailStartDate" value=""/></span>'
							+'<span><input type="date" name="planCertDetailEndDate" value=""/></span>'
							+'<span><input class="planCertDetailSubmit" type="button" value="확인"/></span>'
							+'</form>');
					planCertDetailListTop.append('</div>');
					planCertDetailListTop.append('<br>');
					
					$(data).each(function(index,item){
						if(item.planCertDetailCondition == 0){
							planCertDetailList.append(
								'<div>'
								+'<form id="planCertDetailListForm" name="planCertDetailListForm'+index+'">'
								+'<input type="hidden" name="indexVal" value="'+no+'">'
								+'<input type="hidden" name="planCertDetailCode" value="'+item.planCertDetailCode+'">'
								+'<span><input type="text" name="planCertDetailContent" value="'+item.planCertDetailContent+'"/></span>'
								+'<span><input type="date" name="planCertDetailStartDate" value="'+item.planCertDetailStartDate+'"/></span>'
								+'<span><input type="date" name="planCertDetailEndDate" value="'+item.planCertDetailEndDate+'"/></span>'
								+'<span><input class="goPlanCertDetailUpdate" type="button" value="수정"/></span>'
								+'<span><input class="goPlanCertDetailUpdate" type="button" value="삭제"/></span>'
								+'<span><input id="'+no+'" class="goPlanCertDetailComplete" type="button" value="완료"/></span>'
								+'</form>'
								+'</div>');
						}
						if(item.planCertDetailCondition == 1){
							planCertDetailList.append(
									'<div>'
									+'<span><input type="text" name="planCertDetailContent" readonly="readonly" value="'+item.planCertDetailContent+'"/></span>'
									+'<span><input type="date" name="planCertDetailStartDate" readonly="readonly" value="'+item.planCertDetailStartDate+'"/></span>'
									+'<span><input type="date" name="planCertDetailEndDate" readonly="readonly" value="'+item.planCertDetailEndDate+'"/></span>'
									+'<span>실천완료</span>'
									+'</div>');
						}
						planCertDetailList.append('<br/>');
					});
					planCertDetailListBot.append(
						'<div>'
						+'<span><input id="'+no+'" class="hidePlanCertDetailList" name="hidePlanCertList'+no+'" type="button" value="접기"/></span>'
						+'</div>'
						+'<hr>');
				},
				error:function(error){
					alert('디테일리스트 출력 실패..');
				},
			});
		});
		
		// 계획자격증 상세완료처리
		// plan_cert_detail_code 값에 해당하는 condition 1로 바꾸기
		// plan_cert_detail_condition 1로 바꾸기
		$(document).on('click', '.goPlanCertDetailComplete', function(){
			var no = this.id; // 계획학교상세리스트보기버튼 no
			var planCertDetailCode = this.form.planCertDetailCode.value;
			console.log("planCertDetailCode : " + planCertDetailCode);
			$.ajax({
				url:'/planCertDetailComplete',
				type:'POST',
				data:{
					planCertDetailCode:planCertDetailCode
				},
				success:function(data){
					alert("완료처리 성공!");
					$('#hidePlanCertList').trigger('click');
					$('#showPlanCertList').trigger('click');
					console.log("no :" + no);
				},
				error:function(error){
					alert("완료처리 실패..");
				}
			});
		});
		
		// 계획자격증 상세리스트 접기
		$(document).on('click', '.hidePlanCertDetailList', function(){
			console.log("hidePlanCertDetailList 버튼 클릭 !");
			var hidePlanCertDetailListBtn = this.name;
			var no = this.id;
			var planCertDetailListTop = $('#planCertDetailListTop'+no);
			var planCertDetailList = $('#planCertDetailList'+no);
			var planCertDetailListBot = $('#planCertDetailListBot'+no);
			planCertDetailListTop.empty();
			planCertDetailList.empty();
			planCertDetailListBot.empty();
			$('input[name=showPlanCertDetail'+no+']').removeAttr("disabled");
		});
		
		// 계획자격증 상세등록
		$(document).on('click', '.planCertDetailSubmit', function(){
			var planCertCode = this.form.planCertCode.value;
			var planCertDetailContent = this.form.planCertDetailContent.value;
			var planCertDetailStartDate = this.form.planCertDetailStartDate.value;
			var planCertDetailEndDate = this.form.planCertDetailEndDate.value;
			console.log("planCertCode : " + planCertCode);
			console.log("planCertDetailContent : " + planCertDetailContent);
			console.log("planCertDetailStartDate : " + planCertDetailStartDate);
			console.log("planCertDetailEndDate : " + planCertDetailEndDate);
			$.ajax({
				url:'/planCertDetailInsert',
				type:'POST',
				data:{
					planCertCode:planCertCode,
					planCertDetailContent:planCertDetailContent,
					planCertDetailStartDate:planCertDetailStartDate,
					planCertDetailEndDate:planCertDetailEndDate
				},
				success:function(){
					alert("planCertDetail 입력 성공!");
					$('#hidePlanCertList').trigger('click');
					$('#showPlanCertList').trigger('click');
				},
				error:function(error){
					alert("planCertDetail 입력 실패..");
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
<style>
	.ual_fontMain{
		font-size: 18px;
		font-weight: bold;
	}
	.ual_fontSub{
		font-size: 13px;	
	}		
</style>
</head>
<body>
	<!-- 
		act쪽에서 그래프로 plan과 resume 비교하기
	 -->
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
		<div class="w3-container" align="center">
		  <h1>커리어 플래너</h1>
		  <p>단계별로 원하는 직업에 대한 학교,학과,자격증 플랜을 짜 봅시다!</p>
		  <br/><br/>
		  <ul class="w3-pagination w3-border w3-round w3-xlarge">
		    <li><a href="/planUniteDetail">&laquo;</a></li>
		    <li><a href="/infoJobList">
		    	<font class="ual_fontMain">직업리스트</font><br/>
		    	<font class="ual_fontSub">직업을 선택하세요</font></a></li>
		    <li><a href="/infoJobDetail?searchType=${searchType}&searchWord=${searchWord}">
		    	<font class="ual_fontMain">직업상세보기</font><br/>
		    	<font class="ual_fontSub">계획을 등록을 클릭 해주세요</font></a></li>
		    <li><a href="/planUniteInsert?jobdicSeq=${infoJob.jobdicSeq}">
		    	<font class="ual_fontMain">계획 등록</font><br/>
		    	<font class="ual_fontSub">계획 등록을 해주세요</font></a></li>
		    <li><a href="/planUniteList">
		    	<font class="ual_fontMain">계획리스트</font><br/>
		    	<font class="ual_fontSub">계획리스트를 선택 해주세요</font></a></li>
		    <li><a href="/planUniteDetail">
		    	<font class="ual_fontMain">계획 상세보기</font><br/>
		    	<font class="ual_fontSub">각각의 계획을 등록 해주세요</font></a></li>
		    <li><a class="w3-blue-grey" href="/planCertInsertAndList">
		    	<font class="ual_fontMain">계획 통합 리스트</font><br/>
		    	<font class="ual_fontSub">세부적인 계획을 작성 해주세요</font></a></li>
		    <li><a href="">&raquo;</a></li>
		  </ul>
		</div>
		<br/><br/>
			<h1>실천 리스트</h1>
			<br/>
			<h3>${sessionScope.memberLoginId}님이 등록하신 계획입니다.</h3>
			<table class="w3-table w3-striped w3-border ">
				<tr class="w3-dark-grey">
					<th>직업</th>
					<th>계획 제목</th>
					<th>계획 내용</th>
					<th>계획 등록일</th>
				</tr>
				<tr>
					<td>${planUnite.job}</td>
					<td>${planUnite.planUniteTitle}</td>
					<td>${planUnite.planUniteContent}</td>
					<td>${planUnite.planUniteRegisterDate}</td>
				</tr>
			<%-- <div>직업 : ${planUnite.job}</div>
			<div>계획 제목 : ${planUnite.planUniteTitle}</div>
			<div>계획 내용 : ${planUnite.planUniteContent}</div>
			<div>계획 등록일 : ${planUnite.planUniteRegisterDate}</div> --%>
			</table>
			<input id="planUniteCode" type="hidden" name="planUniteCode" value="${planUnite.planUniteCode}"/>
			<hr>
			<div>
				<!-- 계획학교리스트 -->
				<div>
					<input id="showPlanSchoolList" class="w3-btn w3-dark-grey" type="button" value="학교"/>
				</div>
				<!-- 추천학교 리스트 보여주기(ajax) -->
				<div >
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