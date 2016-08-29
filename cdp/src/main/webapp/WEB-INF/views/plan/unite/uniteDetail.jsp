<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
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
				  <h1>커리어 플래너</h1>
				  <p>단계별로 원하는 직업에 대한 학교,학과,자격증 플랜을 짜 봅시다!</p>
				  <br/><br/>
				  <ul class="w3-pagination w3-border w3-round w3-xlarge">
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
				  </ul>
				</div>
				<br/><br/>
			<h1>계획 상세보기</h1>
			<div>
				<form id="uniteDetailAction" action="">
					<input id="planUniteCode" type="hidden" name="planUniteCode" value="${planUnite.planUniteCode}">
					<input id="jobdicSeq" type="hidden" name="jobdicSeq" value="${planUnite.jobdicSeq}">
					<input id="job" type="hidden" name="job" value="${planUnite.job}">
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
					<div>
						<span><input id="showRecSchoolList" class="w3-btn w3-dark-grey" type="button" value="추천학교리스트"/></span>
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
						<span><input id="showRecDeptList" class="w3-btn w3-dark-grey" type="button" value="추천학과리스트"/></span>
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
						<span><input id="showRecCertList" class="w3-btn w3-dark-grey" type="button" value="추천자격증리스트"/></span>
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
				</form>
				<form id="uniteBtnAction" action="">
					<input id="planUniteCode" type="hidden" name="planUniteCode" value="${planUnite.planUniteCode}">
					<input id="jobdicSeq" type="hidden" name="jobdicSeq" value="${planUnite.jobdicSeq}">
					<input id="job" type="hidden" name="job" value="${planUnite.job}">
					<hr>
					<div align="center">
						<span><input id="goPlanList" class="w3-btn w3-dark-grey" type="button" value="계획통합리스트보기"/></span>
					</div>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>