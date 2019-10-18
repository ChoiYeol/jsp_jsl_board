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
					&nbsp;HOME | &nbsp;회원가입
				</li>
			</ul>
		
<style>


.bord_list { padding-top:20px;}
.bord_table {width:100%;}

.bord_table td {
	font:20px;
	padding:8px; 
	
	border-top:2px solid black;
	border-bottom:2px solid black;
}
	.bord_table .t_id{
	
		width : 100px;
		
	
	}
	.bord_table .t_pw{
	width : 100px;
	}
	
	.bord_table .t_name
	{
	
		width : 80px;
	}
	
	.bord_table .t_birth
	{
			width : 90px;
	}
	
	.bord_table .t_address
	{
			width : 400px;
	}
	.bord_table select
	{
		
			height : 22px;
			font : bold 11px "돋음", Gulim ; 
			color :#6E6E6E; 
	}
	.bord_table .t_phone
	{
	
		width : 40px;

	}
	
	.bord_table .t_email
	{
		width : 90px;
	}
}


</style>
		


<style>

	.log_in{
		font-size:20px;
		font:white;
		font-weight:50;
		width:150px;
		height:130px;
		border:1px solid black;
		background-color:gray;
	}
</style>

<script>
	function check_id(){
		var id = document.member.t_id.value;
		if(id =="")
			{	alert("입력된 아이디가 없습니다.");
				//fm.action ="/member/check_id.jsp";
				//fm.method ="post";
				//fm.submit();
				document.member.t_id.focus();

			}
		 else{
			window.open("check_id.jsp?t_id="+id,"asdf", " width=400 , height=210");
			}
	}
		function save()
		{
				var form = document.member;
				
			
			
				
				
				if(!checkEmpty(form.t_email_1  , "e-Mail 입력")){ return; }
				
				if(!checkEmpty(form.t_email_2  , "e-Mail 입력")){ return; }
				
				form.action="/member/member_proc.jsp";
				form.method="post";
				form.submit();
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
						<th>아이디</th>
						<td>
							<input name="t_id" type="text" class="t_id" maxlength="30" autofocus="autofocus" maxlength="20" />
							<input type = "button" onClick="check_id()" value = "중복검사" style="height:21.5px; width:70px; color :#6E6E6E;" /> 
							<input type = "text" name="id_check_value" /> 
						</td>	
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input name="t_pw_1" type="text" class="t_pw" maxlength="15" />&nbsp;&nbsp;&nbsp;비밀번호 확인
							<input name="t_pw_2" type="text" class="t_pw" maxlength="15" />
						</td>
					</tr>
					<tr>
						<th>성 명</th>
							<td>
								<input name="t_name" type="text" class="t_name" maxlength="5" />&nbsp;&nbsp;&nbsp;
								생년월일
								<input name="t_birth" type="text" class="t_birth" maxlength="6" placeholder="ex)950814" />
							</td>
						</tr>
					<tr>
					<th>주소</th>
					<td>
						<select name ="t_area">
							<option value="선택안함">지역 선택</option>
							
							<option value="서 울">서 울</option>
							<option value="태 안">태 안</option>
							<option value="부 산">부 산</option>
							<option value="대 전">대 전</option>
							<option value="도 쿄">도 쿄</option>
						</select>
						&nbsp; <input style="vertical-align: -0.8px;" name="t_address" type="text" class="t_address" placeholder="나머지 주소" maxlength="25" />
					</td>
				</tr>
					<tr>
						<th>휴대폰 번호</th>
							<td>
								<input type = "radio" value="SKT" name = "t_telecom"/> SKT
								<input type = "radio" value="KTF" name = "t_telecom"/> KTF
								<input type = "radio" value="LG"  name = "t_telecom"/> LG  &nbsp;&nbsp;&nbsp;
								<input name="t_phone_1" type="text" class="t_phone" maxlength="3" /> -
								<input name="t_phone_2" type="text" class="t_phone" maxlength="4" /> -
								<input name="t_phone_3" type="text" class="t_phone" maxlength="4" />
							</td>
						</tr>
					<tr>
					<th>이메일</th>
					<td>
						<input name="t_email_1" type="text" class="t_email" maxlength="20" /> <b>@</b>
						<input name="t_email_2" type="text" class="t_email" maxlength="20" list="mail_list" />
						<datalist id="mail_list">
							<option value ="google.com">
							<option value ="naver.com">
							<option value ="daum.net">
							<option value ="email.com">
						</datalist>
						</td>
				</tr>
				<tr>
					<th>관심 분야</th>
					<td>
						<input type = "checkbox" value="y" name = "t_att_desk"/>DESKTOP
						<input type = "checkbox" value="y" name = "t_att_note"/> NOTEBOOK
						<input type = "checkbox" value="y" name = "t_att_print"/> PRINT	
						<input type = "checkbox" value="y" name = "t_att_beam"/> BEAM
					</td>
				</tr>
			</tbody>
		</table>
		<div>
				 
				<a href="javascript:save()" class="log_in" style="margin-left:250px" >회원 가입</a>
				<a href="/notice/notice_r.jsp" class="log_in" >취 소</a>
		
	</div>			
	</form>
	
	</div>	
   
	  
	<%@ include file="/common_footer.jsp" %>