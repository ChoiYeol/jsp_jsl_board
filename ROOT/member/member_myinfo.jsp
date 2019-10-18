<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="java.util.*,dao.Member_DAO,dto.Member_DTO,common.CommonUtil"%>
<%@ include file="/common_head.jsp" %>


<%
	request.setCharacterEncoding("UTF-8");
	Member_DAO dao = new Member_DAO();
	
	Member_DTO dto = dao.getMemberInfo(sessionId);		
	if(dto != null)
	{
%>
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
			<li><a href="notice_r.jsp"><img class="arrow" src="../images/arrow.gif"> 회원 정보 수정</a></li>
			<li><a href="notice_r.jsp"><img class="arrow" src="../images/arrow.gif"> 비번 수정</a></li>
	
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

		function update()
		{
				var form = document.member;
				
				// if(!checkEmpty(form.h_pw , "비밀번호를 입력")){ return; }
			
				if(form.h_pw.value != form.t_pw.value){
					alert("비밀번호가 맞지않습니다.");
					form.t_pw.focus();
					return; }
				
				
				form.method="post";
				form.action="member_proc.jsp";
				form.submit();
		}
		
		// function deleteMember()
		// {
		// var form = document.member;

				// if(!checkEmpty(form.h_pw  , "비밀번호를 입력")){ return; }
				// if( form.h_pw !=form.t_pw.value)){
					// alert("비밀번호가 맞지않습니다.");
					// form.t_pw.focus();
					// return; }
				
				// if(confirm("정말 탈퇴하겠습니까?"){
				
				// form.method="post";
				// form.action="member_proc.jsp";
				// form.submit();
				// }
		// }	
</script>	

	<form name="member">
	
	<input name="h_pw" type="hidden" value="<%=dto.getPw()%>"/>
	<input name="h_id" type="hidden" value="<%=dto.getId()%>"/>
	<input name="h_date" type="hidden" value="<%=dto.getReg_date()%>"/>
	<input type="hidden" name="t_work_gubun" value="update" >
	<div class="bord_list">

		<table class="bord_table">
			<colgroup>
				<col width="10%">
				<col width="*">
			</colgroup>
			<tbody>
			
					<tr>
						<td>아이디</td>
						<td  class="t_id" >
							<%=dto.getId()%> 
						</td>	
						
						<td>가입일</td>
						<td  class="t_id" >
							<%=dto.getReg_date()%> 
						</td>	
					</tr>
				
					<tr>
						<th>성 명</th>
							<td>
								<input name="t_name" value="<%=dto.getName()%>" type="text" class="t_name" maxlength="5" />&nbsp;&nbsp;&nbsp;
								생년월일
								<input name="t_birth" value="<%=dto.getBirth()%>" type="text" class="t_birth" maxlength="6" placeholder="ex)950814" />
							</td>
						</tr>
					<tr>
					<th>주소</th>
					<td>
					<%=dto.getArea()%>
						<select name ="t_area">
							<option value="태안" <%if(dto.getArea().equals("태안"))out.print("selected");%>>태 안</option>
							<option value="서울" <%if(dto.getArea().equals("서울"))out.print("selected");%>>서 울</option>
							<option value="부산" <%if(dto.getArea().equals("부산"))out.print("selected");%>>부 산</option>
							<option value="대전" <%if(dto.getArea().equals("대전"))out.print("selected");%>>대 전</option>
							<option value="도쿄" <%if(dto.getArea().equals("도쿄"))out.print("selected");%>>도 쿄</option>
						</select>
						
						&nbsp; <input style="vertical-align: -0.8px;" value="<%=dto.getAddress()%>" name="t_address" type="text" class="t_address" placeholder="나머지 주소" maxlength="25" />
					</td>
				</tr>
					<tr>
						<th>휴대폰 번호</th>
							<td>	
					
								<input type = "radio" value="SKT" name = "t_telecom" <%if(dto.getTelecom().equals("SKT"))out.print("checked");%> /> SKT
								<input type = "radio" value="KT" name = "t_telecom"  <%if(dto.getTelecom().equals("KT"))out.print("checked");%>  /> KT
								<input type = "radio" value="LG"  name = "t_telecom" <%if(dto.getTelecom().equals("LG"))out.print("checked");%>  /> LG  &nbsp;&nbsp;&nbsp;
								
								<input name="t_phone_1" value="<%=dto.getPhone_1()%>" type="text" class="t_phone" maxlength="3" /> -
							
								<input name="t_phone_2" value="<%=dto.getPhone_2()%>" type="text" class="t_phone" maxlength="4" /> -
								
								<input name="t_phone_3" value="<%=dto.getPhone_3()%>" type="text" class="t_phone" maxlength="4" />
							</td>
						</tr>
					<tr>
					<th>이메일</th>
					<td>
					
						<input name="t_email_1"  value="<%=dto.getEmail_1()%>" type="text" class="t_email" maxlength="20" /> <b>@</b>
					 
						<input name="t_email_2"  value="<%=dto.getEmail_2()%>" type="text" class="t_email" maxlength="20" list="mail_list" />
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
						 
						<input type = "checkbox" value="y" name = "t_att_desk"  <%if(dto.getAtt_desk().equals("y"))out.print("checked");%>/>DESKTOP
						<input type = "checkbox" value="y" name = "t_att_note"  <%if(dto.getAtt_note().equals("y"))out.print("checked");%>/> NOTEBOOK
						<input type = "checkbox" value="y" name = "t_att_print" <%if(dto.getAtt_print().equals("y"))out.print("checked");%>/> PRINT	
						<input type = "checkbox" value="y" name = "t_att_beam"  <%if(dto.getAtt_beam().equals("y"))out.print("checked");%>/> BEAM
					</td>
				</tr>

					<tr>
						<th>비밀번호</th>
						<td>
							
							<input name="t_pw" type="text" class="t_pw" maxlength="15" />&nbsp;
			
						</td>
					</tr>
				
			</tbody>
		</table>
		<div>
				 
				<a href="javascript:update()" class="log_in" style="margin-left:250px" >회원 수정</a>
				<a href="/notice/notice_r.jsp" class="log_in" >취 소</a>
		
	</div>			
	</form>
	
	</div>	
   
	  
	<%@ include file="/common_footer.jsp" %>
	<%} else{
		%>
			<script>
			alert(" 꺼 져");
 			location.href="/member/member_login.jsp";
			</script>
		<%
	
	}
		%>