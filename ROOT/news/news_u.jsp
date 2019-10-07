<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp" %>
<%@ page import="dao.News_DAO,dto.News_DTO"%>
<%
	News_DAO dao = new News_DAO();
	String news_no = request.getParameter("t_news_No");
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
		var fm = document.newsUpdate;
		//fm.action ="News_update.jsp";
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
		fm.action ="news_proc.jsp";
		fm.method ="post";
		fm.submit();
}
</script>
	<form name="newsUpdate">	
	<input name="t_news_no" value="<%=news_no%>"  type="hidden" >
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
			<a href="/news/news_r.jsp" class="btn_write">목 록</a>
			<a href="javascript:Update()" class="btn_write">수정 저장</a>
		</div>
	</div>			
	</form>
	
	</div>	
   
	  
	<%@ include file="/common_footer.jsp" %>