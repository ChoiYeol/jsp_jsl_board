<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp" %>
<%@ page import="dao.News_DAO,dto.News_DTO"%>
<%
	News_DAO dao = new News_DAO();
	String news_no = request.getParameter("t_newsNo");
	int nHit = dao.NewsHit(news_no);
	News_DTO dto = dao.getNewsView(news_no);	
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
			<li><a href="/notice/notice_r.jsp"><img class="arrow" src="../images/arrow.gif"> NOTICE</a></li>
			<li><a href="/news/news_r.jsp"><img class="arrow" src="../images/arrow.gif"> NEWS</a></li>
			<li><a href="/freeboard/freeboard_r.jsp"><img class="arrow" src="/images/arrow.gif"> 자유게시판</a></li>
			<li><a href="/qanda/qanda_r.jsp"><img class="arrow" src="/images/arrow.gif"> Q & A</a></li>
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
					&nbsp;HOME | &nbsp;커뮤니티 | News
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
	function deleteNews()
	{
		var yn = confirm("현재 파일을 삭제하시겠습니까?");
		if(yn)
		{
			var fm = document.news;
			//fm.action = "news_delete.jsp";
			fm.action = "news_proc.jsp";
			fm.method ="post";
			fm.submit();
		}
	}
	</script>
<form name = "news">
	<input name="t_news_no" value="<%=news_no%>"  type="hidden" >
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
			<a href="/news/news_r.jsp" class="btn_write">목 록</a>
			<a href="/news/news_u.jsp?t_news_No=<%=news_no%>" class="btn_write">수 정</a>
			<a href="javascript:deleteNews()" class="btn_write">삭 제</a>
		</div>
	  </div>			
			
	</div>		
     
      <%@ include file="/common_footer.jsp" %>