
<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>

<%@ include file="/common_head.jsp" %>


<style>

#container {
	width: 940px;
	margin: 0px auto;
//	margin: 0px;
	padding: 20px 0px;
	border: 0px solid #bcbcbc;
//	background : #ccc;
}
#header {
	width: 940px;
	height:140px;
	padding: 0px;
	margin-bottom: 20px;
	border: 0px solid red;
//	background : #F5DA81;
}
	  
#content {
	width: 900px; 
	height : 460px;
	padding: 20px;
	border: 0px solid #bcbcbc;
	background :url("images/j_language.png");
	background-size:100% 100%;
	
	
<img src="그림주소" style="max-width: 100%; height: auto;"> 
}
#footer {
	clear: both;
	padding: 20px;
	border: 1px solid #bcbcbc;
	background :#BCA9F5;
}

.header_menu li{
	float:left;
}

.header_menu li a{
	display : inline-block;
	//padding-top:5px;
	width : 188px;
	height : 20px;
	background : #A9A9A9;
	text-align:center;
	line-height: 20px;
	opacity : 0.8;
	color : white;
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
	
	
      <div id="content">
			
      </div>
<style>
/* footer css */
#footer {clear:both;background:#42464d; padding-top:10px; padding-bottom:10px; margin-top:20px;}
#footer .address {font-style:normal; color:#ababb1; margin-bottom:20px;}
#footer .address .title {font-size:14px; margin-bottom:8px; color:#fff;}
#footer  .copyright {color:#fff;}
</style>			
	 
	 
   
   	<%@ include file="/common_footer.jsp" %>