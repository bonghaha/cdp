<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
  <meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<style>
#inner { 
 	padding-top:1%;
 	/* padding-left:0%; */
 	/* margin-right:0; */
 }
#search {
	padding-top:3%;
}
#btn {
	padding-top:4%;
}
#header { 
	margin-bottom:7%;
	padding-right:9%;
}
#a {
	padding-right:4%;
	text-decoration:none;
}

input[type=text] {
    border: 2px solid   #0066cc;
}
 
 /* #topMenu {
 height: 150px;
 }
 input[type=text] {
    border: 2px solid   #0066cc;
 }
 ul{
   list-style:none;
 }
 div {
 	margin: 0px;
 	padding:0;
    list-style: none;
 }
 .inner { 
 	margin-left: 100px;
 }
 #inner1 {
 	margin-right: 100px;
 	overflow:hidden;
	height:20%;
 }
 ul { 
	list-style: none;

 }
 li {
 	 width: 100px; height: 110%;
 }
 body * {
    line-height: 100%;
 } */
</style>
</head>
<body>
	<div id ="header">
		<div class="col-sm-4" id="inner" align="center">
		<h1 class="logo">
			<a href="">
				<img src="/resources/image/CDP-Symbol-only.png" alt="CDP" width="120" height="50">
			</a>
		</h1>
		</div>
		
		<div class="col-sm-4" id="search" align="center" >
			<form class="form-inline" role="form">
			<div class="form-group">
				<input type="text" class="form-control" style="width:300px;" name="search" placeholder="Search">
				<img src="/resources/image/search.jpg" alt="search" width="45" height="45">
			</div>
			</form>		
		</div>
		
		<div class="col-sm-4" id="btn" align="center">	
			<a id="a" href="">
			<font color="#454545"onMouseOver="this.style.color='#FF8224'" onMouseOut="this.style.color='#454545'">로그인</font></a>
			<a id="a" href="">
			<font color="#454545"onMouseOver="this.style.color='#FF8224'" onMouseOut="this.style.color='#454545'">회원가입</font></a>
			<a id="a" href="">
			<font color="#454545"onMouseOver="this.style.color='#FF8224'" onMouseOut="this.style.color='#454545'">아이디/비밀번호 찾기</font></a>
		</div>
	</div>
		
	
	
	















<!-- <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">CDP</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#myPage">HOME</a></li>
        <li><a href="#band">BAND</a></li>
        <li><a href="#tour">TOUR</a></li>
        <li><a href="#contact">CONTACT</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Merchandise</a></li>
            <li><a href="#">Extras</a></li>
            <li><a href="#">Media</a></li>
          </ul>
        </li>
        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
      </ul>
    </div>
  </div>
</nav>
 -->


 <!-- <center>
	<div style='background-color:#A6A6A6;'>
		<font size='12px'>
			CDP HEADER
		</font>
	</div>
</center> -->
</body>
</html>