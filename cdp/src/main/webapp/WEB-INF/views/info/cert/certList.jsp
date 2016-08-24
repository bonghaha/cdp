<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>certList</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#certSearch").click(function(){
			$("#certListAction").attr("action", "/infoCertList");
			$("#certListAction").submit();
		});
		
		// 수정
	    $('#btn_modify').on('click',function(){
	        var id = $('#id').val();
	        var pw = $('#pw').val();
	        var name = $('#name').val();
	        var age = $('#age').val();
	        var gender = $('#gender').val();
	 
	        $.ajax({
	            url:'/modifyById',
	            type:'POST',
	            data:{id:id,pw:pw,name:name,age:age,gender:gender},
	            success:function(data){
	                alert(data+'님 수정');
	                $('#btn_list').trigger('click');
	            }
	        });
	    });
		
	    // 목록
	    $('#btn_list').on('click',function(){
	        $.ajax({
	            url:'/infoCertListJson',
	            type:'post',
// 	            dataType: "json",
// 	            contentType: "application/json",
	            success:function(data){
	                $('#infoCertList').empty();
	                $(data).each(function(index,item){
	                    $('#infoCertList').append('<tr>');
	                    $('#infoCertList').append('<td><input type="checkbox" class="ck" value="'+item.jmCd+'"></td>');
	                    $('#infoCertList').append('<td>'+item.jmCd+'</td>');
	                    $('#infoCertList').append('<td>'+item.jmFldNm+'</td>');
	                    $('#infoCertList').append('<td>'+item.mdobligFldCd+'</td>');
	                    $('#infoCertList').append('<td>'+item.mdobligFldNm+'</td>');
	                    $('#infoCertList').append('<td>'+item.obligFldCd+'</td>');
	                    $('#infoCertList').append('<td>'+item.obligFldNm+'</td>');
	                    $('#infoCertList').append('<td>'+item.qualgbCd+'</td>');
	                    $('#infoCertList').append('<td>'+item.qualgbNm+'</td>');
	                    $('#infoCertList').append('<td>'+item.seriesCd+'</td>');
	                    $('#infoCertList').append('<td>'+item.seriesNm+'</td>');
	                    $('#infoCertList').append('</tr>');
	                });
	            },
	        	error:function(data){
	        		alert("ajax실행 안됨");
	        	}
	        });
	    });
		
// 		$('#btn_list').trigger('click');	//로딩이 되고 강제로 클릭을 시키게 함
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<!-- body -->
		<t:putAttribute name="body">	
			<!-- 자격증 리스트 -->
			<div id="infoCert" align="center">
			<h1>자격증 리스트</h1><br/>
				<table class="w3-table w3-striped w3-border ">
					<tr class="w3-dark-grey">
						<th>종목명</th>
						<th>중직무분야명</th>
						<th>대직무분야명</th>
						<th>자격구분명</th>
						<th>계열명</th>
					</tr>
					<c:forEach var="icl" items="${infoCertList}" begin="${pageHelper.startRow}" end="${pageHelper.lastRow}" step="1">
						<tr>
							<td><a href="/infoCertDetail?jmCd=${icl.jmCd}&searchType=${searchType}&searchWord=${searchWord}" style="font-weight: bold;">${icl.jmFldNm}</a></td>
							<td>${icl.mdobligFldNm}</td>
							<td>${icl.obligFldNm}</td>
							<td>${icl.qualgbNm}</td>
							<td>${icl.seriesNm}</td>
						</tr>
					</c:forEach>
				</table>
				<br/>
				<form id="certListAction" action="">
					<div>
						<span>
							<select name="searchType">
								<option value="">::검색조건::</option>
								<option value="jmFldNm">자격증명</option>
								<option value="obligFldNm">대직무분야명</option>
								<option value="mdobligFldNm">중직무분야명</option>
							</select>
						</span>
						<span><input type="text" name="searchWord"/></span>
						<span><input id="certSearch" class="w3-btn w3-dark-grey" type="button" value="검색"/></span>
					</div>
					
					<!-- 페이징 -->
					<div>
						<!-- 첫페이지로 이동 -->
						<span>
							<a href="/infoCertList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">처음</a>
						</span>
						
						<!-- 이전페이지로 이동 -->
						<c:if test="${pageHelper.clickPage>1}">
							<span>
								<a href="/infoCertList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">이전</a>
							</span>
						</c:if>
						
						<!-- 페이징작업(1,2,3, ... , 9, 10 -->
						<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
							<c:choose>
								<c:when test="${pageNo eq pageHelper.clickPage}">
									<span><a href="/infoCertList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}"><font class="page" style="font-weight: bold;">${pageNo}</font></a></span>
								</c:when>
								<c:otherwise>
									<span><a href="/infoCertList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<!-- 다음페이지으로 이동 -->
						<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
							<span>
								<a href="/infoCertList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">다음</a>
							</span>
						</c:if>
						
						<!-- 10페이지 뒤로 이동 -->
						<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
							<span>
								<a href="/infoCertList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10페이지 뒤로</a>
							</span>
						</c:if>
					</div>
					<br/>
				</form>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>