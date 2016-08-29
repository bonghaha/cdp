<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
	 #inlineBlock {
	 	  border:1px solid #F6F6F6;
		  width:130px; height:140px;  text-align:center;
		  float:left;
		  margin : 5px;
		  margin-left : 25px;
		  display:inline-block;
	}
	
	.a{
   	display:table;
   	margin-bottom: 9%;
   	vertical-align: middle;
   	margin-left: 43%;
	}
</style>
</head>
<body>
	<div>
		<h1><a href="/home">프로젝트명 : 공공API를 활용한 경력 개발 프로그램 (CDP : Career Development Program)</a></h1>
	</div>
	<div>
		<h2>프로젝트 주제</h2>
		<h4> - NCS의 평생경력개발을 모티브로 학과교육, 직업훈련, 자격제도, 평생학습제도 등의 시스템을 통한 체계적이고 효과적인 능력단위 시스템을 구축하기 위함. </h4>
	</div>
	<div>
		<h2>개발방향</h2>
			<h4>1. 직업 학과 학교 자격증 등의 List를 Web Platform을 기반으로 효율적인 수립을 제공한다.</h4>
			<h4>2. 공공 Open API를 바탕으로 제작한다.</h4>
			<h4>3. 관리자가 회원의 개인이력정보와 선호직업에 따라 진로방향을 추천한다.</h4> 
			<h4>4. 리스트 목록을 보여주는 것을 넘어서 사용자가 직접 계획을 수립 할 수 있도록 한다.</h4> 
			<h4>5. 추천한 목록들과 계획목록들의 실천과정을 확인할 수 있도록 한다.</h4>
	</div>
	<div>
		<h2>개발환경</h2>
		<span><img alt="" src="/resources/image/develop.PNG" width="1000" height="500"></span>
	</div>
	<div>
		<h2>Follow Chart</h2>
		<span><img alt="" src="/resources/image/followChart.PNG" width="1200" height="700"></span>
	</div>
	<div>
		<h2>ERD</h2>
		<span><img alt="" src="/resources/image/cdpErd.PNG" width="1200" height="700"></span>
	</div>
	<br>
	<div class="a">
		<a href="/home" class="w3-btn w3-pink" id="inlineBlock">
    		<span>
    			<font class="fontMain">홈으로 가기</font><br>
    			<img alt="" src="/resources/image/image.PNG" width="100" height="100">
   			</span>
   		</a>
	</div>
</body>
</html>