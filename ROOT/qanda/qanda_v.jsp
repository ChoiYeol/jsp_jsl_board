<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp" %>
<%@ page import="dao.Qanda_DAO,dto.Qanda_DTO"%>
<%
	Qanda_DAO dao = new Qanda_DAO();
	String Qanda_no = request.getParameter("t_Qanda_no"); 
 
	Qanda_DTO dto = dao.getQandaView(Qanda_no);	
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
					&nbsp;HOME | &nbsp;커뮤니티 | Qanda
				</li>
			</ul>
		
<style>



.bord_list { padding-top:20px;}
.bord_table {width:100%;}

.bord_table td {
	border-top:1px solid #e0e0e0; 
	border-bottom:1px solid #e0e0e0; 
	padding:10px; 
	text-align:left;}
.board_textarea_H270_noBorder{
	width:100%;
	height:270px;
	resize: none;
	padding:5px;
	font-size:11px;
	border:0px solid #fff;
	text-align:left;
	color :#848484; 
}

	#footer {
	 
			
			margin-top:800px;
			}
</style>			
	<script>
	function deleteQanda()
	{
		var yn = confirm("현재 파일을 삭제하시겠습니까?");
		if(yn)
		{
			var fm = document.Qanda;
			//fm.action = "Qanda_delete.jsp";
			fm.action = "qanda_proc.jsp";
			fm.method ="post";
			fm.submit();
		}
	}
	</script>
<form name = "Qanda">
	<input name="t_Qanda_no" value="<%=Qanda_no%>"  type="hidden" >
	<input name="t_work_gubun" value="delete"  type="hidden" >
	<input name="h_ca" value="<%=dto.getChecked_answer()%>"  type="hidden" >
</form>
	</script>
		
	  <div class="bord_list">
		<table class="bord_table">
			<colgroup>
				<col width="10%">
				<col width="*">
				<col width="20%">
			</colgroup>
			<tbody>
				<tr>
				
					<th>제 목</th>
					<td><%=dto.getTitle()%></td>
					 
				</tr>
				<tr>
					<th>내 용</th>
					<td colspan="2">
					 <%=dto.getContent()%>
					</td>
				</tr>
				<tr>
					<th>작 성 자</th>
					<td><%=dto.getReg_id()%></td>
					<td>등록일자 : <%=dto.getQna_date()%></td>
				</tr>
				<% if(dto.getChecked_answer().equals("답변완료")) {%>
				
					<tr>
				
					<th>운영자</th> 
					<td>[ <%=dto.getReply_id()%> ] 님의 답변입니다.</td>
					</tr>
				<tr>
					<th>답변 내용</th>
					<td><%=dto.getReply()%></td>
					<td>등록일자 : <%=dto.getReply_date()%></td>
				</tr>
				
					</tbody>
					</table>
				<div class="paging">

				<a href="qanda_r.jsp" class="btn_write">목 록</a>
			
				</div>
				<% } else{ %>
				
					</tbody>
			</table>
			<div class="paging">
			<% if(!sessionLevel.equals("manager") && dto.getReg_id().equals(sessionId) ) { %>
				<a href="javascript:deleteQanda()" class="btn_write">삭 제</a>
				<a href="qanda_u.jsp?t_Qanda_no=<%=Qanda_no%>" class="btn_write">수 정</a>
				
			<% } %>
	
			<a href="qanda_r.jsp" class="btn_write">목 록</a>
			
			<% if(sessionLevel.equals("manager")){ %> 
			<a href="reply_qanda_w.jsp?t_Qanda_no=<%=Qanda_no%>" class="btn_write">글쓰기</a>
			<%	} %> 
		</div>
				
			<% }%>
	  </div>			
			
	</div>		
     
    <%@ include file="/common_footer.jsp" %>