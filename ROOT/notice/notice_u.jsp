﻿<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp" %>
<%@ page import="dao.Notice_DAO,dto.Notice_DTO"%>
<%
	Notice_DAO dao = new Notice_DAO();
	String notice_no = request.getParameter("t_notice_No");
	Notice_DTO dto = dao.getNoticeView(notice_no);	
%>
 <style> 
	

 </style> 
 

 
      <div id="menu">
		<ul>
			<li><a href="notice_r.jsp"><img class="arrow" src="../images/arrow.gif"> NOTICE</a></li>
			<li><a href=""><img class="arrow" src="../images/arrow.gif"> NEWS</a></li>
			<li><a href=""><img class="arrow" src="../images/arrow.gif"> 자유게시판</a></li>
			<li><a href=""><img class="arrow" src="../images/arrow.gif"> Q & A</a></li>

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
					&nbsp;HOME | &nbsp;커뮤니티 | NOTICE
				</li>
			</ul>
		
<style>



.bord_list { padding-top:20px;}
.bord_table {width:100%;}

.bord_table td {
	border-top:1px solid #e0e0e0; 
	border-bottom:1px solid #e0e0e0; 
	padding:10px; 
	text-align:left;
}
.bord_table .t_title{
//	vertical-align:top;
	width : 600px;
	height : 15px;
	font-size : 11px;	
	color :#848484; 
	border:1px solid #ccc;	
}
.board_textarea_H270{
	width:590px;
	height:270px;
	resize: none;
	padding:5px;
	font-size:12px;
	border:1px solid #ccc;
	text-align:left;
	color :#848484; 
}
</style>

<script>
function Update()
{
		var fm = document.noticeUpdate;
		//fm.action ="notice_update.jsp";
		if(fm.t_title.value =="")
		{
			alert("제목을 입력해주세요");
			fm.t_title.focus();
			return;
		}
		if(fm.t_content.value =="")
		{
			alert("제목을 입력해주세요");
			fm.t_content.focus();
			return;
		}
		fm.action ="notice_proc.jsp";
		fm.method ="post";
		fm.submit();
}
</script>
	<form name="noticeUpdate">	
	<input name="t_notice_no" value="<%=notice_no%>"  type="hidden" >
	<input name="t_work_gubun" value="update"  type="hidden" >
	<div class="bord_list">
		<table class="bord_table">
			<colgroup>
				<col width="10%">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>작성자</th>
					<td> 홍길동</td>
				</tr>
				<tr>
					<th>제 목</th>
					<td>
						<input name="t_title" value="<%=dto.getTitle()%>" type="text" class="t_title" maxlength="30" />
					</td>
				</tr>
				<tr>
					<th>내 용</th>
					<td>
						<textarea name="t_content" class="board_textarea_H270" ><%=dto.getContent()%></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="paging">
			<a href="notice_r.jsp" class="btn_write">목 록</a>
			<a href="javascript:Update()" class="btn_write">수정 저장</a>
		</div>
	</div>			
	</form>
	
	</div>	
   
	  
	<%@ include file="/common_footer.jsp" %>