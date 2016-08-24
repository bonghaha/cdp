<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#goPlanList').click(function(){
			$('#uniteBtnAction').attr('action','/planSchoolInsertAndList');
			$('#uniteBtnAction').attr('method','POST');
			$('#uniteBtnAction').submit();
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
	                $('#btnForSchool').append('<div><input id="checkedSchoolSubmit" type="button" value="계획등록"/></div>')
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
	                $('#btnForDept').append('<div><input id="checkedDeptSubmit" type="button" value="계획등록"/></div>')
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
	                $('#btnForCert').append('<div><input id="checkedCertSubmit" type="button" value="계획등록"/></div>')
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
		<div align="center">
		<img src="/resources/image/ing55.PNG">
		</div>
			<h1>계획 통합 상세보기</h1>
			<div>
				<form id="uniteDetailAction" action="">
					<input id="planUniteCode" type="hidden" name="planUniteCode" value="${planUnite.planUniteCode}">
					<input id="jobdicSeq" type="hidden" name="jobdicSeq" value="${planUnite.jobdicSeq}">
					<input id="job" type="hidden" name="job" value="${planUnite.job}">
					<table>
						<tr>
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
					<div>
						<span><input id="showRecSchoolList" type="button" value="추천학교리스트"/></span>
					</div>
					<div>
						<table>
							<thead id="schoolListTop">
								
							</thead>
							<!-- 추천학교 리스트 보여주기(ajax) -->
							<tbody id="schoolList">
							
							</tbody>
						</table>
						<div id="btnForSchool"></div>
					</div>
					<br>
					<div>
						<span><input id="showRecDeptList" type="button" value="추천학과리스트"/></span>
					</div>
					<div>
						<table>
							<thead id="deptListTop">
								
							</thead>
							<!-- 추천학과 리스트 보여주기(ajax) -->
							<tbody id="deptList">
							
							</tbody>
						</table>
						<div id="btnForDept"></div>
					</div>
					<br>
					
					<div>
						<span><input id="showRecCertList" type="button" value="추천자격증리스트"/></span>
					</div>
					<div>
						<table>
							<thead id="certListTop">
								
							</thead>
							<!-- 추천자격증 리스트 보여주기(ajax) -->
							<tbody id="certList">
							
							</tbody>
						</table>
						<div id="btnForCert"></div>
					</div>
					<br>
				</form>
				<form id="uniteBtnAction" action="">
					<input id="planUniteCode" type="hidden" name="planUniteCode" value="${planUnite.planUniteCode}">
					<input id="jobdicSeq" type="hidden" name="jobdicSeq" value="${planUnite.jobdicSeq}">
					<input id="job" type="hidden" name="job" value="${planUnite.job}">
					<div>
						<span><input id="goPlanList" type="button" value="계획리스트보기"/></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>