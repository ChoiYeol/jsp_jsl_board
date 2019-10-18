<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.Qanda_DAO,dto.Qanda_DTO"%>

<%@ include file="/common_head.jsp" %>
 

<%
	Qanda_DAO dao = new Qanda_DAO();
	String qna_no = request.getParameter("t_Qanda_no");
	Qanda_DTO dto = dao.getQandaView(qna_no);	

%>
 

  <%@ include file="/common_sidebar.jsp" %>
  
      <div id="content">
			<ul>
				<!-- <li class="btn_home"> -->
					<!-- <a href="index.html"><i class="fa fa-home btn_plus"></i></a> -->
				<!-- </li> -->
				<li class="btn_home">
					<a href="index.html">
						<img src="../images/home3.png" class="home_icon">
					</a>
					&nbsp;HOME | &nbsp;커뮤니티 | qna
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
function UpdateReply()
{
 
		var fm = document.qandaReplyUpdate;
	 
		if(fm.t_reply_content.value =="")
		{
			alert("내용을 입력해주세요");
			fm.t_reply_content.focus();
			return;
		}
		fm.action ="qanda_proc.jsp";
		fm.method ="post";
		fm.submit(); 
		

}
</script>
	<form name="qandaReplyUpdate">	
	<input name="t_Qanda_no" value="<%=qna_no%>"  type="hidden" >
	<input name="t_work_gubun" value="replyInsert"  type="hidden" >
	<input name="t_reply_id"  value="<%=dto.getReg_id()%>"  type="hidden" />
	
	<div class="bord_list">
		<table class="bord_table">
			<colgroup>
				<col width="10%">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>작성자</th>
					<td><%=sessionName%></td>
				</tr>
				<tr>
					<th>제 목</th>
					<td>
					<%=dto.getTitle()%>
					</td>
				</tr>
				<tr>
					<th>내 용</th>
					<td>
						<%=dto.getContent()%>
					</td>
				</tr>
				
					<tr>
					<th>답변</th>
					<td>

					</td>
				</tr>
				<tr>
					<th>답변내 용</th>
					<td>
						<textarea name="t_reply_content" class="board_textarea_H270" ></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="paging">
			<a href="qanda_v.jsp?t_Qanda_no=<%=qna_no%>" class="btn_write">목 록</a>
			<a href="javascript:UpdateReply()" class="btn_write">답글 달기</a>
		 
		</div>
	</div>			
	</form>
	
	</div>	
   
	  
	<%@ include file="/common_footer.jsp" %>