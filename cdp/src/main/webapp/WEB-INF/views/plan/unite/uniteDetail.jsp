<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#goPlanList').click(function(){
			$('#uniteBtnAction').attr('action','/planSchoolInsertAndList');
			$('#uniteBtnAction').attr('method','POST');
			$('#uniteBtnAction').submit();
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
					$('#planSchoolListTop').append('<div class="row">');
					$('#planSchoolListTop').append('<div class="col-sm-1"></div>');
					$('#planSchoolListTop').append('<div class="col-sm-1">학교명</div>');
					$('#planSchoolListTop').append('<div class="col-sm-1">계획상태</div>');
					$('#planSchoolListTop').append('<div class="col-sm-1">계획내용</div>');
					$('#planSchoolListTop').append('<div class="col-sm-1">변경횟수</div>');
					$('#planSchoolListTop').append('<div class="col-sm-2">계획시작일</div>');
					$('#planSchoolListTop').append('<div class="col-sm-2">계획종료예정일</div>');
					$('#planSchoolListTop').append('<div class="col-sm-1">계획등록일</div>');
					$('#planSchoolListTop').append('<div class="col-sm-1">등록</div>');
					$('#planSchoolListTop').append('<div class="col-sm-1">삭제</div>');
					$('#planSchoolListTop').append('</div>');
					
					$(data).each(function(index,item){
						$('#planSchoolList').append('<br/><div class="row">');
						$('#planSchoolList').append(
							'<div>'
							+'<form id="planSchoolListForm">'
							+'<input type="hidden" name="planSchoolCode" value="'+item.planSchoolCode+'"/>'
							+'<input type="hidden" name="planUniteCode" value="'+item.planUniteCode+'"/>'
							+'<div class="col-sm-1"><input id="'+index+'" class="showPlanSchoolDetail" name="showPlanSchoolDetail'+index+'" type="button" value="상세보기▼"/></div>'
							+'<div class="col-sm-1">'+item.schoolName+'</div>'
							+'<div class="col-sm-1">'
							+'<select name="planSchoolCondition">'
							+'<option value="'+item.planSchoolCondition+'">'+item.planSchoolCondition+'</option>'
							+'<option value="실천중">실천중</option>'
							+'<option value="실천완료">실천완료</option>'
							+'</select>'
							+'</div>'
							+'<div class="col-sm-1"><input type="text" name="planSchoolContent" value="'+item.planSchoolContent+'"/></div>'
							+'<div class="col-sm-1"><input type="text" name="planSchoolCount" value="'+item.planSchoolCount+'" readonly="readonly"/></div>'
							+'<div class="col-sm-2"><input type="date" name="planSchoolStartDate" value="'+item.planSchoolStartDate+'"/></div>'
							+'<div class="col-sm-2"><input type="date" name="planSchoolEndDate" value="'+item.planSchoolEndDate+'"/></div>'
							+'<div class="col-sm-1">'+item.planSchoolRegisterDate+'</div>'
							+'<div class="col-sm-1"><input class="goPlanSchoolUpdate" type="button" value="등록"/></div>'
							+'<div class="col-sm-1"><input class="goPlanSchoolDelete" type="button" value="삭제"/></div>'
							+'</form>'
							+'</div>');
						$('#planSchoolList').append('</div>');
						$('#planSchoolList').append('<div class="row">');
						$('#planSchoolList').append(
							'<div class="w3-progress-container col-sm-8">'
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
					$('#planSchoolListBot').append('<br/><div><input id="hidePlanSchoolList" class="w3-btn w3-dark-grey" type="button" value="학교접기"/></div>')
					
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
					/* planSchoolDetailListTop.append('<div>내용</div>');
					planSchoolDetailListTop.append('<div>시작일</div>');
					planSchoolDetailListTop.append('<div>종료일</div>'); */
					planSchoolDetailListTop.append('</div>');
					planSchoolDetailListTop.append('<hr><div>');
					planSchoolDetailListTop.append(
							'<form id="planSchoolDetailForm">'
							+'<div><input type="hidden" name="planSchoolCode" value="'+planSchoolCode+'"/>'
							+'<font style="font-size:20px">[실천등록]</font>'
							+'<div>내용 : <input type="text" name="planSchoolDetailContent" value=""/></div>'
							+'<div>시작일 : <input type="date" name="planSchoolDetailStartDate" value=""/></div>'
							+'<div>종료일 : <input type="date" name="planSchoolDetailEndDate" value=""/></div>'
							+'<div><input class="planSchoolDetailSubmit w3-btn w3-dark-grey" type="button" value="확인"/></div>'
							+'</form>');
					planSchoolDetailListTop.append('</div>');
					planSchoolDetailListTop.append('<br>');
					
					$(data).each(function(index,item){
						if(item.planSchoolDetailCondition == 0){
							planSchoolDetailList.append(
								'<hr><div>'
								+'<form id="planSchoolDetailListForm" name="planSchoolDetailListForm'+index+'">'
								+'<input type="hidden" name="indexVal" value="'+no+'">'
								+'<input type="hidden" name="planSchoolDetailCode" value="'+item.planSchoolDetailCode+'">'
								+'<font style="font-size:20px">[실천내용]</font>'
								+'<div>내용 : <input type="text" name="planSchoolDetailContent" value="'+item.planSchoolDetailContent+'"/></div>'
								+'<div>시작일 : <input type="date" name="planSchoolDetailStartDate" value="'+item.planSchoolDetailStartDate+'"/></div>'
								+'<div>종료일 : <input type="date" name="planSchoolDetailEndDate" value="'+item.planSchoolDetailEndDate+'"/></div><br/>'
								+'<div><input class="goPlanSchoolDetailUpdate w3-btn w3-dark-grey" type="button" value="수정"/>'
								+'<input class="goPlanSchoolDetailUpdate w3-btn w3-dark-grey" type="button" value="삭제"/>'
								+'<input id="'+no+'" class="goPlanSchoolDetailComplete w3-btn w3-dark-grey" type="button" value="완료"/></div>'
								+'</form>'
								+'</div>');
						}
						if(item.planSchoolDetailCondition == 1){
							planSchoolDetailList.append(
									'<div>'
									+'<font style="font-size:20px">[실천완료]</font>'
									+'<div>내용 : <input type="text" name="planSchoolDetailContent" readonly="readonly" value="'+item.planSchoolDetailContent+'"/></div>'
									+'<div>시작일 : <input type="date" name="planSchoolDetailStartDate" readonly="readonly" value="'+item.planSchoolDetailStartDate+'"/></div>'
									+'<div>종료일 : <input type="date" name="planSchoolDetailEndDate" readonly="readonly" value="'+item.planSchoolDetailEndDate+'"/></div>'
									+'<div>실천완료</div>'
									+'</div>');
						}
						planSchoolDetailList.append('<br/>');
					});
					planSchoolDetailListBot.append(
						'<div>'
						+'<div><input id="'+no+'" class="hidePlanSchoolDetailList w3-btn w3-dark-grey" name="hidePlanSchoolList'+no+'" type="button" value="상세보기접기"/></div>'
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
					$('#planDeptListTop').append('<div class="row">');
					$('#planDeptListTop').append('<div class="col-sm-1"></div>');
					$('#planDeptListTop').append('<div class="col-sm-1">학과명</div>');
					$('#planDeptListTop').append('<div class="col-sm-1">계획상태</div>');
					$('#planDeptListTop').append('<div class="col-sm-1">계획내용</div>');
					$('#planDeptListTop').append('<div class="col-sm-1">변경횟수</div>');
					$('#planDeptListTop').append('<div class="col-sm-2">계획시작일</div>');
					$('#planDeptListTop').append('<div class="col-sm-2">계획종료예정일</div>');
					$('#planDeptListTop').append('<div class="col-sm-1">계획등록일</div>');
					$('#planDeptListTop').append('<div class="col-sm-1">등록</div>');
					$('#planDeptListTop').append('<div class="col-sm-1">삭제</div>');
					$('#planDeptListTop').append('</div>');
					
					$(data).each(function(index,item){
						$('#planDeptList').append('<br/><div class="row">');
						$('#planDeptList').append(
							'<div>'
							+'<form id="planDeptListForm">'
							+'<input type="hidden" name="planDeptCode" value="'+item.planDeptCode+'"/>'
							+'<input type="hidden" name="planUniteCode" value="'+item.planUniteCode+'"/>'
							+'<div class="col-sm-1"><input id="'+index+'" class="showPlanDeptDetail" name="showPlanDeptDetail'+index+'" type="button" value="상세보기▼"/></div>'
							+'<div class="col-sm-1">'+item.mClass+'</div>'
							+'<div class="col-sm-1">'
							+'<select name="planDeptCondition">'
							+'<option value="'+item.planDeptCondition+'">'+item.planDeptCondition+'</option>'
							+'<option value="실천중">실천중</option>'
							+'<option value="실천완료">실천완료</option>'
							+'</select>'
							+'</div>'
							+'<div class="col-sm-1"><input type="text" name="planDeptContent" value="'+item.planDeptContent+'"/></div>'
							+'<div class="col-sm-1"><input type="text" name="planDeptCount" value="'+item.planDeptCount+'" readonly="readonly"/></div>'
							+'<div class="col-sm-2"><input type="date" name="planDeptStartDate" value="'+item.planDeptStartDate+'"/></div>'
							+'<div class="col-sm-2"><input type="date" name="planDeptEndDate" value="'+item.planDeptEndDate+'"/></div>'
							+'<div class="col-sm-1">'+item.planDeptRegisterDate+'</div>'
							+'<div class="col-sm-1"><input class="goPlanDeptUpdate" type="button" value="등록"/></div>'
							+'<div class="col-sm-1"><input class="goPlanDeptDelete" type="button" value="삭제"/></div>'
							+'</form>'
							+'</div>');
						$('#planDeptList').append('</div>');
						$('#planDeptList').append('<div class="row">');
						$('#planDeptList').append(
							'<div class="w3-progress-container">'
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
					$('#planDeptListBot').append('<br/><div><input id="hidePlanDeptList"  class="w3-btn w3-dark-grey" type="button" value="학과접기"/></div>')
					
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
					/* planDeptDetailListTop.append('<div>내용</div>');
					planDeptDetailListTop.append('<div>시작일</div>');
					planDeptDetailListTop.append('<div>종료일</div>'); */
					planDeptDetailListTop.append('</div>');
					planDeptDetailListTop.append('<hr><div>');
					planDeptDetailListTop.append(
							'<form id="planDeptDetailForm">'
							+'<div><input type="hidden" name="planDeptCode" value="'+planDeptCode+'"/>'
							+'<font style="font-size:20px">[실천등록]</font>'
							+'<div>내용 : <input type="text" name="planDeptDetailContent" value=""/></div>'
							+'<div>시작일 : <input type="date" name="planDeptDetailStartDate" value=""/></div>'
							+'<div>종료일 : <input type="date" name="planDeptDetailEndDate" value=""/></div>'
							+'<div><input class="planDeptDetailSubmit w3-btn w3-dark-grey" type="button" value="확인"/></div>'
							+'</form>');
					planDeptDetailListTop.append('</div>');
					planDeptDetailListTop.append('<br><hr>');
					
					$(data).each(function(index,item){
						if(item.planDeptDetailCondition == 0){
							planDeptDetailList.append(
								'<hr><div>'
								+'<form id="planDeptDetailListForm" name="planDeptDetailListForm'+index+'">'
								+'<input type="hidden" name="indexVal" value="'+no+'">'
								+'<input type="hidden" name="planDeptDetailCode" value="'+item.planDeptDetailCode+'">'
								+'<font style="font-size:20px">[실천내용]</font>'
								+'<div>내용 : <input type="text" name="planDeptDetailContent" value="'+item.planDeptDetailContent+'"/></div>'
								+'<div>시작일 : <input type="date" name="planDeptDetailStartDate" value="'+item.planDeptDetailStartDate+'"/></div>'
								+'<div>종료일 : <input type="date" name="planDeptDetailEndDate" value="'+item.planDeptDetailEndDate+'"/></div>'
								+'<div><input class="goPlanDeptDetailUpdate w3-btn w3-dark-grey" type="button" value="수정"/>'
								+'<input class="goPlanDeptDetailUpdate w3-btn w3-dark-grey" type="button" value="삭제"/>'
								+'<input id="'+no+'" class="goPlanDeptDetailComplete w3-btn w3-dark-grey" type="button" value="완료"/></div>'
								+'</form>'
								+'</div>');
						}
						if(item.planDeptDetailCondition == 1){
							planDeptDetailList.append(
									'<div>'
									+'<font style="font-size:20px">[실천완료]</font>'
									+'<div>내용 : <input type="text" name="planDeptDetailContent" readonly="readonly" value="'+item.planDeptDetailContent+'"/></div>'
									+'<div>시작일 : <input type="date" name="planDeptDetailStartDate" readonly="readonly" value="'+item.planDeptDetailStartDate+'"/></div>'
									+'<div>종료일 : <input type="date" name="planDeptDetailEndDate" readonly="readonly" value="'+item.planDeptDetailEndDate+'"/></div>'
									+'<div>실천완료</div>'
									+'</div>');
						}
						planDeptDetailList.append('<br/>');
					});
					planDeptDetailListBot.append(
						'<div>'
						+'<div><input id="'+no+'" class="hidePlanDeptDetailList w3-btn w3-dark-grey" name="hidePlanDeptList'+no+'" type="button" value="상세보기접기"/></div>'
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
					$('#planCertListTop').append('<div class="row">');
					$('#planCertListTop').append('<div class="col-sm-1"></div>');
					$('#planCertListTop').append('<div class="col-sm-1">자격증명</div>');
					$('#planCertListTop').append('<div class="col-sm-1">계획상태</div>');
					$('#planCertListTop').append('<div class="col-sm-1">계획내용</div>');
					$('#planCertListTop').append('<div class="col-sm-1">변경횟수</div>');
					$('#planCertListTop').append('<div class="col-sm-2">계획시작일</div>');
					$('#planCertListTop').append('<div class="col-sm-2">계획종료예정일</div>');
					$('#planCertListTop').append('<div class="col-sm-1">계획등록일</div>');
					$('#planCertListTop').append('<div class="col-sm-1">등록</div>');
					$('#planCertListTop').append('<div class="col-sm-1">삭제</div>');
					$('#planCertListTop').append('</div>');
					
					$(data).each(function(index,item){
						$('#planCertList').append('<br/><div class="row">');
						$('#planCertList').append(
							'<div>'
							+'<form id="planCertListForm">'
							+'<input type="hidden" name="planCertCode" value="'+item.planCertCode+'"/>'
							+'<input type="hidden" name="planUniteCode" value="'+item.planUniteCode+'"/>'
							+'<div class="col-sm-1"><input id="'+index+'" class="showPlanCertDetail" name="showPlanCertDetail'+index+'" type="button" value="상세보기▼"/></div>'
							+'<div class="col-sm-1">'+item.jmFldNm+'</div>'
							+'<div class="col-sm-1">'
							+'<select name="planCertCondition">'
							+'<option value="'+item.planCertCondition+'">'+item.planCertCondition+'</option>'
							+'<option value="실천중">실천중</option>'
							+'<option value="실천완료">실천완료</option>'
							+'</select>'
							+'</div>'
							+'<div class="col-sm-1"><input type="text" name="planCertContent" value="'+item.planCertContent+'"/></div>'
							+'<div class="col-sm-1"><input type="text" name="planCertCount" value="'+item.planCertCount+'" readonly="readonly"/></div>'
							+'<div class="col-sm-2"><input type="date" name="planCertStartDate" value="'+item.planCertStartDate+'"/></div>'
							+'<div class="col-sm-2"><input type="date" name="planCertEndDate" value="'+item.planCertEndDate+'"/></div>'
							+'<div class="col-sm-1">'+item.planCertRegisterDate+'</div>'
							+'<div class="col-sm-1"><input class="goPlanCertUpdate" type="button" value="등록"/></div>'
							+'<div class="col-sm-1"><input class="goPlanCertDelete" type="button" value="삭제"/></div>'
							+'</form>'
							+'</div>');
						$('#planCertList').append('</div>');
						$('#planCertList').append('<div class="row">');
						$('#planCertList').append(
							'<div class="w3-progress-container">'
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
					$('#planCertListBot').append('<br/><div><input id="hidePlanCertList" class="w3-btn w3-dark-grey" type="button" value="자격증접기"/></div>')
					
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
					/* planCertDetailListTop.append('<div>내용</div>');
					planCertDetailListTop.append('<div>시작일</div>');
					planCertDetailListTop.append('<div>종료일</div>'); */
					planCertDetailListTop.append('</div><br/>');
					planCertDetailListTop.append('<div>');
					planCertDetailListTop.append(
							'<form id="planCertDetailForm">'
							+'<div><input type="hidden" name="planCertCode" value="'+planCertCode+'"/>'
							+'<font style="font-size:20px">[실천등록]</font>'
							+'<div>내용 : <input type="text" name="planCertDetailContent" value=""/></div>'
							+'<div>시작일 : <input type="date" name="planCertDetailStartDate" value=""/></div>'
							+'<div>종료일 : <input type="date" name="planCertDetailEndDate" value=""/></div>'
							+'<div><input class="planCertDetailSubmit w3-btn w3-dark-grey" type="button" value="확인"/></div>'
							+'</form>');
					planCertDetailListTop.append('</div><hr>');
					planCertDetailListTop.append('<br>');
					
					$(data).each(function(index,item){
						if(item.planCertDetailCondition == 0){
							planCertDetailList.append(
								'<hr><div>'
								+'<form id="planCertDetailListForm" name="planCertDetailListForm'+index+'">'
								+'<input type="hidden" name="indexVal" value="'+no+'">'
								+'<input type="hidden" name="planCertDetailCode" value="'+item.planCertDetailCode+'">'
								+'<font style="font-size:20px">[실천내용]</font>'
								+'<div>내용 : <input type="text" name="planCertDetailContent" value="'+item.planCertDetailContent+'"/></div>'
								+'<div>시작일 : <input type="date" name="planCertDetailStartDate" value="'+item.planCertDetailStartDate+'"/></div>'
								+'<div>종료일 : <input type="date" name="planCertDetailEndDate" value="'+item.planCertDetailEndDate+'"/></div>'
								+'<div><input class="goPlanCertDetailUpdate w3-btn w3-dark-grey" type="button" value="수정"/>'
								+'<input class="goPlanCertDetailUpdate w3-btn w3-dark-grey" type="button" value="삭제"/>'
								+'<input id="'+no+'" class="goPlanCertDetailComplete w3-btn w3-dark-grey" type="button" value="완료"/></div>'
								+'</form>'
								+'</div>');
						}
						if(item.planCertDetailCondition == 1){
							planCertDetailList.append(
									'<div>'
									+'<font style="font-size:20px">[실천완료]</font>'
									+'<div>내용 : <input type="text" name="planCertDetailContent" readonly="readonly" value="'+item.planCertDetailContent+'"/></div>'
									+'<div>시작일 : <input type="date" name="planCertDetailStartDate" readonly="readonly" value="'+item.planCertDetailStartDate+'"/></div>'
									+'<div>종료일 : <input type="date" name="planCertDetailEndDate" readonly="readonly" value="'+item.planCertDetailEndDate+'"/></div>'
									+'<div>실천완료</div>'
									+'</div>');
						}
						planCertDetailList.append('<br/>');
					});
					planCertDetailListBot.append(
						'<div>'
						+'<div><input id="'+no+'" class="hidePlanCertDetailList w3-btn w3-dark-grey" name="hidePlanCertList'+no+'" type="button" value="상세보기접기"/></div>'
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
		
			
		// 추천학교목록
	    $('#showRecSchoolList').on('click',function(){
	    	var jobdicSeq = $('#jobdicSeq').val();
	        $.ajax({
	            url:'/recSchoolListByAjax',
	            type:'POST',
	            data:{jobdicSeq:jobdicSeq},
	            success:function(data){
	            	$('#showRecSchoolList').attr("disabled","disabled");
	            	$('#schoolListTop').empty();
	                $('#schoolList').empty();
	                $('#schoolListTop').append('<tr>');
	                $('#schoolListTop').append('<th>선택</th>');
	                $('#schoolListTop').append('<th>지역</th>');
	                $('#schoolListTop').append('<th>설립유형</th>');
	                $('#schoolListTop').append('<th>학교유형</th>');
	                $('#schoolListTop').append('<th>학교종류</th>');
	                $('#schoolListTop').append('<th>학교명</th>');
	                $(data).each(function(index,item){
	                    $('#schoolList').append('<tr>');
	                    $('#schoolList').append('<td><input id="recSchoolCheck" type="checkbox" name="recSchoolCodes" value="'+item.recSchoolCode+'"></td>');
	                    $('#schoolList').append('<td>'+item.region+'</td>');
	                    $('#schoolList').append('<td>'+item.estType+'</td>');
	                    $('#schoolList').append('<td>'+item.schoolType+'</td>');
	                    $('#schoolList').append('<td>'+item.schoolGubun+'</td>');
	                    $('#schoolList').append('<td><a href="/recSchoolReason?recSchoolCode='+item.recSchoolCode+'" target="_blank">'+item.schoolName+'</a></td>');
	                    $('#schoolList').append('</tr>');
	                });
	                	$('#btnForSchool').append('<br/><div align="center"><input id="checkedSchoolSubmit" class="w3-btn w3-dark-grey" type="button" value="계획등록"/></div>')
	            },
	            error:function(error){
	                alert("error:"+error);
	            }
	        });
	    });
		
		// 선택한 추천들 계획으로 보내기
		$(document).on('click','#checkedSchoolSubmit',function(){
			var recSchoolCodes = [];	//배열 초기화
			$('#uniteDetailAction').attr('action','/planSchoolInsertAndList');
			$('#uniteDetailAction').attr('method','POST');
			$('#recSchoolCheck:checked').each(function(){
				recSchoolCodes.push($(this).val());	//배열에 체크된것들 각각의 value 값 푸쉬푸쉬
			});
			$('#uniteDetailAction').submit();
		});
		

		
		/***********************학과***********************/
		// 추천학과목록
	    $('#showRecDeptList').on('click',function(){
	    	var jobdicSeq = $('#jobdicSeq').val();
	        $.ajax({
	            url:'/recDeptListByAjax',
	            type:'POST',
	            data:{jobdicSeq:jobdicSeq},
	            success:function(data){
	            	$('#showRecDeptList').attr("disabled","disabled");
	            	$('#deptListTop').empty();
	                $('#deptList').empty();
	                $('#deptListTop').append('<tr>');
	                $('#deptListTop').append('<th>선택</th>');
	                $('#deptListTop').append('<th>계열</th>');
	                $('#deptListTop').append('<th>학과</th>');
	                $(data).each(function(index,item){
	                    $('#deptList').append('<tr>');
	                    $('#deptList').append('<td><input id="recDeptCheck" type="checkbox" name="recDeptCodes" value="'+item.recDeptCode+'"></td>');
	                    $('#deptList').append('<td>'+item.lClass+'</td>');
	                    $('#deptList').append('<td><a href="/recDeptReason?recDeptCode='+item.recDeptCode+'" target="_blank">'+item.mClass+'</a></td>');
	                    $('#deptList').append('</tr>');
	                });
	                $('#btnForDept').append('<br/><div align="center"><input id="checkedDeptSubmit" class="w3-btn w3-dark-grey" type="button" value="계획등록"/></div>')
	            },
	            error:function(error){
	                alert("error:"+error);
	            }
	        });
	    });
		
		// 선택한 추천들 계획으로 보내기
		$(document).on('click','#checkedDeptSubmit',function(){
			var recDeptCodes = [];	//배열 초기화
			$('#uniteDetailAction').attr('action','/planDeptInsertAndList');
			$('#uniteDetailAction').attr('method','POST');
			$('#recDeptCheck:checked').each(function(){
				recDeptCodes.push($(this).val());	//배열에 체크된것들 각각의 value 값 푸쉬푸쉬
			});
			$('#uniteDetailAction').submit();
		});
		
		/***********************자격증***********************/
		// 추천자격증목록
	    $('#showRecCertList').on('click',function(){
	    	var jobdicSeq = $('#jobdicSeq').val();
	        $.ajax({
	            url:'/recCertListByAjax',
	            type:'POST',
	            data:{jobdicSeq:jobdicSeq},
	            success:function(data){
	            	$('#showRecCertList').attr("disabled","disabled");
	                $('#certListTop').empty();
	                $('#certList').empty();
	                $('#certListTop').append('<tr>');
	                $('#certListTop').append('<th>선택</th>');
	                $('#certListTop').append('<th>자격증명</th>');
	                $('#certListTop').append('<th>대직무분야명</th>');
	                $('#certListTop').append('<th>중직무분야명</th>');
	                $('#certListTop').append('<th>자격구분명</th>');
	                $('#certListTop').append('<th>계열명</th>');
	                $(data).each(function(index,item){
	                    $('#certList').append('<tr>');
	                    $('#certList').append('<td><input id="recCertCheck" type="checkbox" name="recCertCodes" value="'+item.recCertCode+'"></td>');
	                    $('#certList').append('<td><a href="/recCertReason?recCertCode='+item.recCertCode+'" target="_blank">'+item.jmFldNm+'</a></td>');
	                    $('#certList').append('<td>'+item.obligFldNm+'</td>');
	                    $('#certList').append('<td>'+item.mdobligFldNm+'</td>');
	                    $('#certList').append('<td>'+item.qualgbNm+'</td>');
	                    $('#certList').append('<td>'+item.seriesNm+'</td>');
	                    $('#certList').append('</tr>');
	                });
	                $('#btnForCert').append('<br/><div align="center"><input id="checkedCertSubmit" class="w3-btn w3-dark-grey" type="button" value="계획등록"/></div>')
	            },
	            error:function(error){
	                alert("error:"+error);
	            }
	        });
	    });
		
	 	// 선택한 추천들 계획으로 보내기
		$(document).on('click','#checkedCertSubmit',function(){
			var recCertCodes = [];	//배열 초기화
			$('#uniteDetailAction').attr('action','/planCertInsertAndList');
			$('#uniteDetailAction').attr('method','POST');
			$('#recCertCheck:checked').each(function(){
				recCertCodes.push($(this).val());	
			});
			$('#uniteDetailAction').submit();
		});
		
	 	// 페이지 로딩시 계획리스트 보여주기
		$('#showPlanSchoolList').trigger('click');
		$('#showPlanDeptList').trigger('click');
		$('#showPlanCertList').trigger('click');
	 
	});
	
	
</script>
<style>
	.ud_fontMain{
		font-size: 18px;
		font-weight: bold;
	}
	.ud_fontSub{
		font-size: 13px;	
	}		
</style>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">
		<div class="w3-container" align="center">
				  <font style="font-size: 60px;">커리어 플래너</font>
				  <br/><br/>
				  
				  <br/><br/>
				  <%-- <ul class="w3-pagination w3-border w3-round w3-xlarge">
				    <li><a href="/planUniteList">&laquo;</a></li>
				    <li><a href="/infoJobList">
				    	<font class="ud_fontMain">직업리스트</font><br/>
				    	<font class="ud_fontSub">직업을 선택하세요</font></a></li>
				    <li><a href="/infoJobDetail?searchType=${searchType}&searchWord=${searchWord}">
				    	<font class="ud_fontMain">직업상세보기</font><br/>
				    	<font class="ud_fontSub">계획을 등록을 클릭 해주세요</font></a></li>
				    <li><a href="/planUniteInsert?jobdicSeq=${infoJob.jobdicSeq}">
				    	<font class="ud_fontMain">계획 등록</font><br/>
				    	<font class="ud_fontSub">계획 등록을 해주세요</font></a></li>
				    <li><a href="/planUniteList">
				    	<font class="ud_fontMain">계획리스트</font><br/>
				    	<font class="ud_fontSub">계획리스트를 선택 해주세요</font></a></li>
				    <li><a class="w3-blue-grey" href="/planUniteDetail">
				    	<font class="ud_fontMain">계획 상세보기</font><br/>
				    	<font class="ud_fontSub">각각의 계획을 등록 해주세요</font></a></li>
				    <li><a href="#">
				    	<font class="ud_fontMain">계획 통합 리스트</font><br/>
				    	<font class="ud_fontSub">세부적인 계획을 작성 해주세요</font></a></li>
				    <li><a href="/planUniteDetail?planUniteCode=${pul.planUniteCode}&jobdicSeq=${pul.jobdicSeq}">&raquo;</a></li>
				  </ul> --%>
				</div>
				<br/><br/>
			<h1>계획 상세보기</h1>
			<h3>${sessionScope.memberLoginId}님이 등록하신 계획입니다.</h3>
			<div>
				<table class="w3-table w3-striped w3-border ">
					<tr class="w3-dark-grey">
						<th>직종</th>
						<th>제목</th>
						<th>내용</th>
						<th>등록일</th>
					</tr>
						<tr>
							<td>${planUnite.job}</td>
							<td>${planUnite.planUniteTitle}</td>
							<td>${planUnite.planUniteContent}</td>
							<td>${planUnite.planUniteRegisterDate}</td>
						</tr>
				</table>
				<hr>
				
				<!-- 추천리스트 보여주기 -->
				<br/><br/>
				<div align="center"><font style="font-size: 35px;">1단계 : 아래의 추천 학교, 학과, 자격증 리스트에서 각각의 계획을 선택 해주세요.</font></div>
				<br/><br/>
				<form id="uniteDetailAction" action="">
					<input id="planUniteCode" type="hidden" name="planUniteCode" value="${planUnite.planUniteCode}">
					<input id="jobdicSeq" type="hidden" name="jobdicSeq" value="${planUnite.jobdicSeq}">
					<input id="job" type="hidden" name="job" value="${planUnite.job}">
					<div>
						<div><input id="showRecSchoolList" class="w3-btn w3-dark-grey" type="button" value="추천학교리스트"/></div>
					</div>
					<div>
						<table class="w3-table w3-striped w3-border ">
							<thead id="schoolListTop" class="w3-dark-grey">
								
							</thead>
							<!-- 추천학교 리스트 보여주기(ajax) -->
							<tbody id="schoolList">
							
							</tbody>
						</table>
						<div id="btnForSchool"></div>
					</div>
					<br>
					<div>
						<div><input id="showRecDeptList" class="w3-btn w3-dark-grey" type="button" value="추천학과리스트"/></div>
					</div>
					<div>
						<table class="w3-table w3-striped w3-border ">
							<thead id="deptListTop" class="w3-dark-grey">
								
							</thead>
							<!-- 추천학과 리스트 보여주기(ajax) -->
							<tbody id="deptList">
							
							</tbody>
						</table>
						<div id="btnForDept"></div>
					</div>
					<br>
					
					<div>
						<div><input id="showRecCertList" class="w3-btn w3-dark-grey" type="button" value="추천자격증리스트"/></div>
					</div>
					<div>
						<table class="w3-table w3-striped w3-border ">
							<thead id="certListTop" class="w3-dark-grey">
								
							</thead>
							<!-- 추천자격증 리스트 보여주기(ajax) -->
							<tbody id="certList">
							
							</tbody>
						</table>
						<div id="btnForCert"></div>
					</div>
					<br>
				</form><br/><br/>
				
				
				<!-- 계획리스트보여주기 -->
				<hr>
				<br/><br/>
				<div align="center"><font style="font-size: 35px;">2단계 : 상세보기를 클릭 해 계획을 이루기 위한 실천을 기록 해주세요.</font></div>
				<br/><br/>
				<div>
					<!-- 계획학교리스트 -->
					<div>
						<font style="font-size: 30px;">[학교]</font><br/>
						<input id="showPlanSchoolList" class="w3-btn w3-dark-grey" type="button" value="학교"/>
					</div>
					<!-- 추천학교 리스트 보여주기(ajax) -->
					<div >
						<div id="planSchoolListTop" class="w3-container w3-dark-grey">
						</div>
						<div id="planSchoolList" class="w3-container">
						</div>
						<div id="planSchoolListBot">
						</div>
					</div>
					<br/><br/>
					<hr>
					
					<!-- 계획학과리스트 -->
					<div>
						<font style="font-size: 30px;">[학과]</font><br/>
						<input id="showPlanDeptList" class="w3-btn w3-dark-grey" type="button" value="학과"/>
					</div>
					<!-- 추천학과 리스트 보여주기(ajax) -->
					<div>
						<div id="planDeptListTop" class="w3-container w3-dark-grey">
						</div>
						<div id="planDeptList" class="w3-container">
						</div>
						<div id="planDeptListBot">
						</div>
					</div>
					<br/><br/>
					<hr>
					
					<!-- 계획자격증리스트 -->
					<div>
						<font style="font-size: 30px;">[자격증]</font><br/>
						<input id="showPlanCertList" class="w3-btn w3-dark-grey" type="button" value="자격증"/>
					</div>
					<!-- 추천자격증 리스트 보여주기(ajax) -->
					<div>	
						<div id="planCertListTop" class="w3-container w3-dark-grey">
						</div>
						<div id="planCertList" class="w3-container">
						</div>
						<div id="planCertListBot">
						</div>
					</div>
					<br/><br/>
					<hr>
				</div>
				
				
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>