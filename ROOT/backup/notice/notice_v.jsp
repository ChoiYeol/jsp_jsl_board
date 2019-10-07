<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp" %>
<%@ page import="dao.Notice_DAO,dto.Notice_DTO"%>
<%
	Notice_DAO dao = new Notice_DAO();
	String notice_no = request.getParameter("t_noticeNo");
	int nHit = dao.noticeHit(notice_no);
	Notice_DTO dto = dao.getNoticeView(notice_no);	
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

/* footer css */
#footer {clear:both;background:#42464d; padding-top:10px; padding-bottom:10px; margin-top:60px;}
#footer .address {font-style:normal; color:#ababb1; margin-bottom:20px;}
#footer .address .title {font-size:14px; margin-bottom:8px; color:#fff;}
#footer  .copyright {color:#fff;}
.paging{
	margin-top : 20px;
	text-align:center;
}
.paging .btn_write {

	background:#BDBDBD; 
	padding:10px 16px; 
	color:#fff; 
	
}

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
			<a href="notice_r.jsp" class="btn_write">목 록</a>
			<a href="notice_u.jsp?t_notice_No=<%=notice_no%>" class="btn_write">수 정</a>
			<a href="javascript:deleteNotice()" class="btn_write">삭 제</a>
		</div>
	  </div>			
			
	</div>		
     
      <div id="footer">
		<div class="container clearfix">
			<address class="address">
				<p class="title">본사</p>
				(우)12345 대전광역시 중구 계룡로 825 (용두동, 희영빌딩) 5층,6층/고객센터: 042-242-4412 	<br>사업자등록번호: 305-86-06709
			</address>
			<p class="copyright">Copyright &copy JSL 전자개발주식회사. All rights reserved.</p>
		</div>
      </div>
    </div>
  </body>
</html>