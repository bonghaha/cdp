<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>CDP</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
	 #inlineBlock {
	 	  border:1px solid #F6F6F6;
		  width:400px; height:620px;  text-align:center;
		  float:left;
		  margin : 5px;
		  margin-left : 25px;
		  display:inline-block;
		  
	}
	#inlineBlock1 {
		  border:1px solid #F6F6F6;
		  width:300px; height:410px;  text-align:center;
		  float:left;
		  margin : 5px;
		  display:inline-block; 
		  vertical-align:middle;
	} 
	 
	#inlineBlock2 {
		  border:1px solid #F6F6F6;
		  width:300px; height:200px;  text-align:center;
		  float:left;
		  margin : 5px;
		  display: inline-block;
	} 

	.a{
    	display:table;
    	margin-bottom: 9%;
    	vertical-align: middle;
    	margin-left: 9%;
	}
	
	.fontMain{
		font-weight: bold;
		font-size: 40px;
		color: white;
	}
	.fontSub{
		
		font-size: 20px;
		color: white;
	}
	.fontMain1{
		font-weight: bold;
		font-size: 30px;
		color: white;
	}
	.fontSub1{
		font-size: 15px;
		color: white;
		
		
	}
	.material-icons{vertical-align:-14%}
</style>
</head>
<body>
	<t:insertDefinition name="layout">
	
		<!-- body -->
		<t:putAttribute name="body">
		    <div class="a">
		    	<div>
		    		<!-- 경로 넣어야 함  -->
		    		<a href="/" class="w3-btn w3-pink" id="inlineBlock">
			    		<span>
			    			<br/><br/><br/><br/><br/>
			    			<font class="fontMain">프로젝트 소개</font><br/><br/>
			    			<font class="fontSub">프로젝트에 대한 소개입니다.<br/>
			    			(....개발환경 등)</font><br/><br/><br/><br/>
			    			<img alt="" src="/resources/image/image.PNG" width="150" height="150">
		    			</span>
		    		</a>	
		    	</div>
	    		<div class="inlineBlockDiv">
			    	<a href="/infoJobList" class="w3-btn w3-indigo " id="inlineBlock1"><br/>
			    		<font class="fontMain1">커리어 플래너</font><br/><br/>
			    		<font class="fontSub1">원하는 직업에 대한 내 계획을 짜 봅시다.</font><br/><br/><br/><br/>
			    		<img alt="" src="/resources/image/image_plane.PNG" width="100" height="100">
			    	</a>
			    	<a href="/infoSchoolList" class="w3-btn w3-teal" id="inlineBlock2"><br/>
			    		<font class="fontMain1">학교</font><br/><br/>
			    		<font class="fontSub1">학교에 대한 리스트입니다.</font><br/>
			    		<img alt="" src="/resources/image/image_clock.PNG" width="100" height="80">
			    	</a> 
			    	<a href="/infoDeptList" class="w3-btn w3-deep-orange " id="inlineBlock2"><br/>
			    		<font class="fontMain1">학과</font><br/><br/>
			    		<font class="fontSub1">학과에 대한 리스트입니다.</font><br/>
			    		<img alt="" src="/resources/image/image_bar.PNG" width="100" height="80">
			    	</a>
			    	<a href="/infoJobListSub" class="w3-btn w3-blue" id="inlineBlock2"><br/>
			    		<font class="fontMain1">직업</font><br/><br/>
			    		<font class="fontSub1">직업에 대한 리스트입니다.</font><br/>
			    		<img alt="" src="/resources/image/image_person.png" width="100" height="80">
			    	</a>
			    	<a href="/infoCertList" class="w3-btn w3-amber" id="inlineBlock2"><br/>
			    		<font class="fontMain1">자격증</font><br/><br/>
			    		<font class="fontSub1">자격증에 대한 리스트입니다.</font><br/>
			    		<img alt="" src="/resources/image/image_briefcase.PNG" width="100" height="80">
			    	</a>
		    	</div>
			</div>
		</t:putAttribute>
	</t:insertDefinition>
</body>
</html>