
<%@ include file="/common_session_info.jsp" %>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>JSL 방문을 환영합니다</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">	
<link rel="stylesheet" type="text/css" href="/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/css/base.css" /> 
<link rel="stylesheet" type="text/css" href="/css/etc.css?ver=5" /> 

<!-- <link href="../css/font-awesome.min.css" rel="stylesheet">  -->
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript">
    //<![CDATA[
		$(function(){
		  $(".menu1").mouseover(function(){
			$("#s_div_1").stop().slideDown("slow");
		  });
		  $(".menu1").mouseleave(function(){
			$("#s_div_1").stop().slideUp("slow");
		  });		  
		  $(".menu2").mouseover(function(){
			$("#s_div_2").stop().slideDown("slow");
		  });
		  $(".menu2").mouseleave(function(){
			$("#s_div_2").stop().slideUp("slow");
		  });		  
		  $(".menu3").mouseover(function(){
			$("#s_div_3").stop().slideDown("slow");
		  });
		  $(".menu3").mouseleave(function(){
			$("#s_div_3").stop().slideUp("slow");
		  });		  
		  $(".menu4").mouseover(function(){
			$("#s_div_4").stop().slideDown("slow");
		  });
		  $(".menu4").mouseleave(function(){
			$("#s_div_4").stop().slideUp("slow");
		  });		  
		  $(".menu5").mouseover(function(){
			$("#s_div_5").stop().slideDown("slow");
		  });
		  $(".menu5").mouseleave(function(){
			$("#s_div_5").stop().slideUp("slow");
		  });		  
		  
		});    
    //]]>
</script>    
<style>

#container {
	width: 940px;
	margin: 0px auto;
//	margin: 0px;
	padding: 20px;
	border: 0px solid #bcbcbc;
//	background : #ccc;
}

#s_div_1,#s_div_2,#s_div_3,#s_div_4{
	position : absolute;
	display : none;
}
#s_div_5{
	position : absolute;
	display : none;
	right : 0px;
}


#s_div_1 ul li a{
	width : 100px;
	background : #A9D0F5;
}  
#s_div_2 ul li a{
	width : 100px;
	background : #A9D0F5;
} 
#s_div_3 ul li a{
	width : 100px;
	background : #A9D0F5;
} 
#s_div_4 ul li a{
	width : 100px;
	background : #A9D0F5;
} 
#s_div_5 ul li a{
	width : 100px;
	background : #A9D0F5;
} 
.top_right{
	position : relative;
	top : -15px;
}
.top_right li{
	float : right;
	border-right : 1px solid #6E6E6E;
}
.top_right li a{
	display:inline-block;
	width:50px;
	height : 14px;
	text-align:center;
	color : #848484;
	font-size : 10px;
}

</style>
</head>
<body>
    <div id="container">
		<ul class="top_right">
			
			<%  if(!sessionName.equals(""))
				{
			%>	
			<li><a href="/member/member_logout.jsp">LOGOUT</a></li>
			<li><a href="/member/member_myinfo.jsp">MYINFO</a></li>
			<%
				} else {
			%>
			<li><a href="/member/member_w.jsp">JOIN</a></li>
			<li><a href="/member/member_login.jsp">LOGIN</a></li>
			<%
				}
			%>
			<li><a href="/index.jsp">HOME</a></li>
			
			  <% if(!sessionName.equals("")) {  %> 
					<li>[<%=sessionName%>]님 &nbsp  </li>
			  <%  }%>
	
			${header.host}
		</ul>
		<div id="header">
			<ul class="header_menu">
				<li class="menu1"><a href="#">회사소개</a>
					<div id="s_div_1">
						<ul>
							<li><a href="">CEO 인사말</a></li>
							<li><a href="">전년판매현황</a></li>
							<li><a href="">VISION</a></li>
							<li><a href="">찾아오는길</a></li>
						</ul>
					</div>
				</li>
				<li class="menu2"><a href="#">제품안내</a>
					<div id="s_div_2">
						<ul>
							<li><a href="">DESKTOP</a></li>
							<li><a href="">NOTEBOOK</a></li>
							<li><a href="">PRINTER</a></li>
							<li><a href="">BEAM</a></li>
							<li><a href="">주변기기</a></li>
						</ul>
					</div>					
				</li>
				<li class="menu3"><a href="#">판매안내</a>
					<div id="s_div_3">
						<ul>
							<li><a href="">Online</a></li>
							<li><a href="">Offline</a></li>
						</ul>
					</div>					
				</li>
				<li class="menu4"><a href="#">주문안내</a>
					<div id="s_div_4">
						<ul>
							<li><a href="">배송안내</a></li>
							<li><a href="">환불안내</a></li>
						</ul>
					</div>					
				</li>
				<li class="menu5"><a href="/notice/notice_r.jsp">커뮤니티</a>
					<div id="s_div_5">
						<ul>
							<li><a href="/notice/notice_r.jsp">NOTICE</a></li>
							<li><a href="/news/news_r.jsp">NEWS</a></li>
							<li><a href="/freeboard/freeboard_r.jsp">자유게시판</a></li>
							<li><a href="/qanda/qanda_r.jsp">Q & A</a></li>
						</ul>
					</div>					
				</li>
			</ul>		
		</div>