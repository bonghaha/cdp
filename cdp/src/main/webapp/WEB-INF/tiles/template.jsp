<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* total */

#total {
 width:100%;
 margin:0 auto;


}


/* header */

#inner { 
 	/* border:1px solid black; */
 	
 	/* padding-left:0%; */
 	/* margin-right:0; */
 }

#btn {
	/* border:1px solid black; */
	height:150px;
	padding-top:11%;
}
#header { 
	/* border:1px solid black; */
	height:220px;
	margin-bottom:2%;
	margin-top:1%;
	width:100%;
}
#fontDecoNone{
	text-decoration:none;
	
}
input[type=text] {
    border: 2px solid   #0066cc;
}

/*menu  */

#topMenu{    
			/* border : 1px solid black; */
		    width: 90%;
            height: 90px;			/*  topMenu의 높이를 30px로 설정(제대로 설정 안하면 아래 내용이 깨짐) */ 
            margin-bottom: 1%;
            margin-left: 12%;   
              							 /* width: 2500px; */ /* topMenu의 넓이를 850px로 설정(제대로 설정 안하면 브라우져 넓이가 좁아지면 깨짐) */
}
		
#topMenu ul {          					 /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
			   
			   list-style-type: none; 	 /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */
			   
			   /* margin-left: 10%;  */         	
			   margin: 0%;				/* 메인 메뉴 안의 ul의 margin을 없앰 */
			   padding: 0px;        	 /* 메인 메뉴 안의 ul의 padding을 없앰 */
}
#topMenu ul li {                       /* topMenu의 ID를 가진 태그 안에 <ul> 태그 안에 <li> 태그의 스타일을 지정 */
         								 /* list-style: none; */ /* <li> 태그는 위의 이미지처럼 목록을 나타내는 점을 없앤다 */ 
	          color: #454545;                /* 글씨 색을 흰색으로 설정 */
	          background-color: #F6F6F6;   /* 배경색을 진한 회색(RGB(2D,2D,2D)으로 설정 */
	          float: left;                 /* <li>태그들이 왼쪽에 흐르게 설정(그러면 아래있는 내용은 오른쪽으로 옴) */
	          line-height: 50px;          	/* 글씨가 가운데로 오도록 설정하기 위해 한줄의 높이를 30px로 설정 */
	          vertical-align: middle;     	/* 세로 정렬을 가운데로 설정(위의 line-height와 같이 설정 필요함) */
	          text-align: center;          /* 글씨 정렬을 가운데로 설정 */
	          position: relative;	        /* 해당 li 태그 내부의 top/left 포지션 초기화 */
}
 .menuLink, .submenuLink {           /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
	                      			/* 링크(<a> 태그)가 가지는 기본 꾸밈 효과(밑줄 등)을 없앰 */
	         						 /* color: #454545; */  /* 폰트색을 흰색으로 설정 */
	          display: block;                  			/* 링크를 글씨가 있는 부분 뿐만아니라 전체 영역을 클릭해도 링크가 걸리게 설정 */
	          width: 230px;                   			/* 메뉴링크의 넓이 설정 */
	          font-size: 15px;                			/* 폰트 사이즈 12px로 설정 */
	          font-weight: bold;              			/* 폰트를 굵게 */
	          font-family: sans-serif;  					/* 기본 폰트 적용, 시스템 폰트를 종류별로 순서대로 */
}
.submenuLink {
			font-size: 12px;
	
}
.topMenuLi:hover .menuLink {            /* topMenu 아이디를 가진 태그 안에 menuLink클래스를 가진 태그에 마우스가 over되면 스타일 설정 */
	          color: #FF8224;                   /* 글씨 색을 붉은색으로 설정 */
	          background-color: #FFFFFF;    /* 배경색을 조금 더 밝은 회색으로 설정 */
}
.menuLink {     /* 상위 메뉴의 글씨색을 흰색으로 설정 */
      			color: #454545;
      			text-decoration:none;
}
.submenuLink {          /* 하위 메뉴의 a 태그 스타일 설정 */
			   color: #454545;             /* 글씨 색을 RGB(2D2D2D)로 설정 */
			   background-color: #FFFFFF;    /* 배경색을 흰색으로 설정 */
			   /* border: solid 1px black; */    /* 테두리를 설정 */
			   /* margin-top: -1px; */           /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설덩 */
} 
.longLink {     		/* 좀 더 긴 메뉴 스타일 설정 */
		        width: 230px;   /* 넓이는 190px로 설정 */
		        text-align: center;
		        text-decoration:none;      
}
.submenu {              /* 하위 메뉴 스타일 설정 */
		       position: absolute;     /* html의 flow에 영향을 미치지 않게 absolute 설정 */
		       height: 0px;
		                   /* 초기 높이는 0px로 설정 */
		       overflow: hidden;       /* 실 내용이 높이보다 커지면 해당 내용 감춤 */ 
		       transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */
}
.topMenuLi:hover .submenu { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
      			 height: 186px;           /* 높이를 93px로 설정 */
   }
.submenuLink:hover {        /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */
		       color: #FF9436;                 /* 글씨색을 빨간색으로 설정 */
		       background-color: #FFFFFF;  /* 배경을 RGB(DDDDDD)로 설정 */
}


 /* html,body{height:100%; margin:0; padding:0;} */ 


/* body */
.body {
		    /*  border : 1px solid black;  */
		    
		    width: 87%;
		    /* height:				auto; */
 		    height: auto !important;   
			vertical-align: middle;
			margin:0 auto;
			/* text-align: center; */
			/* margin-right:7%;
			margin-left:7%;  */
}

/* footer */
#footer {
		    /* border : 1px solid black;  */
		    font-size:        	105%;
		    width:           	100%;
		    height:				150px;
		    
		    margin-top: 8%; 
 		     /* height: 		 	auto !important;  */
}





</style>
<title>Insert title here</title>
</head>
<body>
<div id= "total">
	<t:insertAttribute name="header"/>
	<div id ="header">
		<div class="col-sm-4">
		</div>
		<div class="col-sm-4" id="inner" align="center">
		<h1 class="logo">
			<a href="/home">
				<img src="/resources/image/logo.png" alt="CDP" width="320" height="190">
			</a>
		</h1>
		</div>
		
		<c:choose>
			<c:when test="${empty sessionScope.memberLoginId}">
				<div class="col-sm-4" id="btn" align="center">	
					<div>
						<a id="fontDecoNone" class="w3-btn w3-light-grey" href="/login" >로그인</a>				
						<a id="fontDecoNone" class="w3-btn w3-light-grey" href="/infoMemberInsert" >회원가입</a>
					</div>
<!-- 				아이디 비번 찾기 추후 구현
					<span>
						<a id="a3" href="">
							<font color="#454545"onMouseOver="this.style.color='#FF8224'" onMouseOut="this.style.color='#454545'">아이디/비밀번호 찾기</font>
						</a>
					</span>
 -->					
				</div>
			</c:when>
			<c:otherwise>
				<div class="col-sm-4" id="btn" align="center">	
					<span>${sessionScope.memberLoginId}님 반갑습니다</span>
					<span>
						<a id="fontDecoNone" class="w3-btn w3-light-grey" href="/logout">로그아웃</a>
					</span>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	
	<!--매뉴  -->
	
	
	<div align="center">
		<nav id="topMenu">
	      <ul>
		      <li class="topMenuLi">
		      	<a id="fontDecoNone" class="menuLink"  href="#">진로심리검사</a>
			    <ul class="submenu">
	              <li><a id="fontDecoNone" class="submenuLink longLink">심리검사</a></li>
	              <li><a id="fontDecoNone" class="submenuLink longLink">진로탐색프로그램</a></li>
	              <li><a id="fontDecoNone" class="submenuLink longLink">진로심리검사안내</a></li>
		        </ul>
		      </li>
		      
		      <li class="topMenuLi">
		      	<a id="fontDecoNone" class="menuLink" href="#">직업·학과정보</a>
		      	<ul class="submenu">
	              <li><a id="fontDecoNone" class="submenuLink longLink" href="/infoJobListSub">직업정보</a></li>
	              <li><a id="fontDecoNone" class="submenuLink longLink" href="/infoSchoolList">학교정보</a></li>
	              <li><a id="fontDecoNone" class="submenuLink longLink" href="/infoDeptList">학과정보</a></li>
	              <li><a id="fontDecoNone" class="submenuLink longLink" href="/infoCertList">자격증정보</a></li>
		        </ul>
		      </li>
		      <li class="topMenuLi">
		      	<a id="fontDecoNone" class="menuLink" href="#">경력관리</a>
		      	<ul class="submenu">
	              <li><a id="fontDecoNone" class="submenuLink longLink">아직</a></li>
	              <li><a id="fontDecoNone" class="submenuLink longLink">뭘</a></li>
	              <li><a id="fontDecoNone" class="submenuLink longLink">할지</a></li>
		        </ul>
		      </li>
		      <li class="topMenuLi">
		      	<a id="fontDecoNone" class="menuLink" href="/articleList">Q&A 게시판</a>
		      </li>
		      <li class="topMenuLi">
		      	<a id="fontDecoNone" class="menuLink" href="#">마이페이지</a>
		      	<ul class="submenu">
	              <li><a id="fontDecoNone" class="submenuLink longLink" href="/myInfoManagement">내 정보관리</a></li>
	              <li><a id="fontDecoNone" class="submenuLink longLink" href="/resumeDetail">이력관리</a></li>
	              <li><a id="fontDecoNone" class="submenuLink longLink" href="/planUniteList">계획관리</a></li>
		        </ul>
		      </li>
	      </ul>
		</nav>
    </div>
 </div>
<div class="body">
	<t:insertAttribute name="body"/>
</div>

<t:insertAttribute name="footer"/>
<div id="footer" class="w3-grey" align="center">
<hr style="margin-top: 0%;">
	<div class="col-sm-4" align="right">
		<img alt="" src="/resources/image/logoFooter.png" width="70" height="70">
	</div>
	<div class="col-sm-3" align="left">
	<p>
	<font style="font-size: 11px;">
	주소 : 전북 전주시 덕진구 금암1동 708-16 2층
		한국스마트정보교육원(전북대 전주경기장 맞은편 대로변)
	전화 : 063-717-1008
	운영 : 한국스마트정보교육원 3조 | 지원 : 한국스마트정보교육원
	COPYRIGHTS © KRIVET ALL RIGHTS RESERVED.
	</font>
	</p>
	</div>
	<div class="col-sm-3" align="center">
		<img alt="" src="/resources/image/logoKrSmart.png" width="70" height="70">&nbsp;&nbsp;
		<img alt="" src="/resources/image/beanTie.png" width="70" height="70">&nbsp;&nbsp;
		<img alt="" src="/resources/image/careerNet1.PNG" width="70" height="70">
	</div>
</div>
		
</body>
</html>