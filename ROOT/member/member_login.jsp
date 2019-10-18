<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>

<%@ include file="/common_head.jsp" %>
 <style> 
	#menu ul li a{
		font : bold 12px "돋음", Gulim ; 
		color :#6E6E6E; 
		border-bottom : 1px dotted #848484;
		display : inline-block;
		width : 130px;
		height : 25px;
		//background : yellow;
		line-height : 25px;
	}
	.arrow{
		vertical-align:middle;
		width : 6px;
	}
	.home_icon{
		width : 15px;
	}
	#content{
		font : 10px "돋음", Gulim ; 
		color :#848484; 
	}	
	#content .title a{
		font : 10px "돋음", Gulim ; 
		color :#6E6E6E; 
	}	

 </style> 
      <div id="menu">
		<ul>
			<li><a href="notice_r.jsp"><img class="arrow" src="../images/arrow.gif"> 회원 가입</a></li>
			<li><a href="notice_r.jsp"><img class="arrow" src="../images/arrow.gif"> 아이디 찾기</a></li>
			<li><a href="notice_r.jsp"><img class="arrow" src="../images/arrow.gif"> 비밀번호 찾기</a></li>
		</ul>
      </div>
      <div id="content">
			<ul>
				<!-- <li class="btn_home"> -->
					<!-- <a href="index.html"><i class="fa fa-home btn_plus"></i></a> -->
				<!-- </li> -->
				<li class="btn_home">
					<a href="index.html">
						<img src="../images/home3.png" class="home_icon">
					</a>
					&nbsp;HOME | &nbsp;Login
				</li>
			</ul>
		
<style>

.bord_list {
	
	margin:50px 180px;
	width:300px;
	height:300px;
	
	color :white; 
	border-radius:20px 20px 20px 20px;
	background-color:#5e7e9b;
	padding-top:20px;
			
}
.bord_table {width:100%;}

	.bord_table td {
	font:20px;
	padding:8px; 

	}
	.bord_table .t_id{
		width : 170px;
		height: 20px;
	}
	.bord_table .t_pw{
		width : 170px;
		height: 20px;
	}

}

	.login{

		border:1px solid black;
		background-color:gray;
	}
	.login a{
		font-size:20px;
		font-weight:50;
		color:white;
	}
	.pass{
		font-size:20px;
		font-weight:50;
		
		color:white;
		width:130px;
		height:130px;
		border:1px solid black;
		background-color:gray;
	}
	.join{
		font-size:20px;
		font-weight:110;
		
		color:white;
		width:130px;
		height:130px;
		border:1px solid black;
		background-color:gray;
	}

</style>

<script>
	function login_check(){
		var form = document.member;
		if(!checkEmpty(form.t_id, "아이디를 입력하세요")){ return; }		
		if(!checkEmpty(form.t_pw, "비밀번호를 입력하세요")){ return; }		
		form.method = "post";
		form.action = "member_login_proc.jsp";
		form.submit();
	}
	
	function go_password()
	{
		var form = document.member;
		form.t_pw.focus();
	}
</script>	

	<form name="member">
	<input type="hidden" name="t_work_gubun" value="insert" >
	<div class="bord_list">
		<table class="bord_table">
			<colgroup>
				<col width="10%">
				<col width="*">
			</colgroup>
			<tbody>
					<tr>
						 <div  style="width:250px; font-size:15px; font-weight:bold; margin:auto;">&nbsp;&nbsp;아이디/비밀번호로 로그인</div>
					</tr>
			
					<tr>
					
						<td>
							<label>아이디</label><br>
							<input name="t_id" type="text" onkeydown="if(event.keyCode==9 ){go_password() } " onkeypress="if(event.keyCode==13 ){go_password() } " class="t_id" maxlength="30" autofocus="autofocus" maxlength="20" placeholder="ID" />
						</td>	
						<td rowspan="2" scope="col" class="login"> <a href="javascript:login_check()">로그인</a></td>
					</tr>
					<tr>
					
						<td>
							
							<label>비밀번호</label><br>
							<input name="t_pw" type="text" onkeypress="if(event.keyCode==13 ){login_check() } " class="t_pw" maxlength="15" placeholder="PASSWORD" /> 
						
						</td>
					</tr>
					
					<tr>
						<td  colspan="2">
							<div style="width:170px; margin:0px auto">
								<a href="" class="pass"  >ID/PW 찾기</a>
								<a href="/member/member_w.jsp" class="join" >회원가입</a>
							</div>
						</td>
					</tr>	
			</tbody>			
		</table>
		
	</form>
	
	</div>	
   
	  
	<%@ include file="/common_footer.jsp" %>