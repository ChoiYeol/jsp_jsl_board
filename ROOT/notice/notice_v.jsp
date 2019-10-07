<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp" %>
<%@ page import="dao.Notice_DAO,dto.Notice_DTO"%>
<%
	Notice_DAO dao = new Notice_DAO();
	String notice_no = request.getParameter("t_noticeNo");
	int nHit = dao.noticeHit(notice_no);
	Notice_DTO dto = dao.getNoticeView(notice_no);	
%>

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
</style>			
	<script>
	function deleteNotice()
	{
		var yn = confirm("현재 파일을 삭제하시겠습니까?");
		if(yn)
		{
			var fm = document.notice;
			//fm.action = "notice_delete.jsp";
			fm.action = "notice_proc.jsp";
			fm.method ="post";
			fm.submit();
		}
	}
	</script>
<form name = "notice">
	<input name="t_notice_no" value="<%=notice_no%>"  type="hidden" >
	<input name="t_work_gubun" value="delete"  type="hidden" >
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
					<td><i class="fa fa-eye"> 조회수 : <%=dto.getHit()%></td>
				</tr>
				<tr>
					<th>내 용</th>
					<td colspan="2">
						<textarea class="board_textarea_H270_noBorder" readonly><%=dto.getContent()%></textarea>
					</td>
				</tr>
				<tr>
					<th>작 성 자</th>
					<td><%=dto.getReg_id()%></td>
					<td>등록일자 : <%=dto.getReg_date()%></td>
				</tr>
			</tbody>
		</table>
		<div class="paging">
				<a href="javascript:deleteNotice()" class="btn_write">삭 제</a>
				<a href="notice_u.jsp?t_notice_No=<%=notice_no%>" class="btn_write">수 정</a>
				<a href="notice_r.jsp" class="btn_write">목 록</a>
		</div>
	  </div>			
			
	</div>		
     
    <%@ include file="/common_footer.jsp" %>