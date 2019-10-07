<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp" %>
<%@ page import="java.util.*,dao.Notice_DAO,dto.Notice_DTO"%>
<%
	request.setCharacterEncoding("UTF-8");
	Notice_DAO dao = new Notice_DAO();
	String selValue = request.getParameter("t_sel");
	String txtValue = request.getParameter("t_search");
	if(selValue == null) {
		selValue ="title";
		txtValue ="";
	}	
	ArrayList<Notice_DTO> dtos = 
				dao.getNoticeList(selValue,txtValue);	
	

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
	.select_Box {
		text-align : right;
	}

	.select_Box .sel_box{
		width : 50px;
		height : 20.5px;
		font-size : 10px;
		color :#848484; 
	}
	.select_Box .sel_text{
		vertical-align:top;
		width : 80px;
		height : 14.5px;
		font-size : 11px;
	}
	.select_Box .sel_button{
		vertical-align:top;
		width : 60px;
		height : 20.5px;
		font-size : 11px;
		color :#848484; 
	}	
 </style> 

      <div id="menu">
		<ul>
			<li><a href="notice_r.jsp"><img class="arrow" src="../images/arrow.gif"> NOTICE</a></li>
			<li><a href=""><img class="arrow" src="/images/arrow.gif"> NEWS</a></li>
			<li><a href=""><img class="arrow" src="/images/arrow.gif"> 자유게시판</a></li>
			<li><a href=""><img class="arrow" src="/images/arrow.gif"> Q & A</a></li>

		</ul>
      </div>
      <div id="content">
			<ul>
				<!-- <li class="btn_home"> -->
					<!-- <a href="index.html"><i class="fa fa-home btn_plus"></i></a> -->
				<!-- </li> -->
				<li class="btn_home">
					<a href="/index.html">
						<img src="../images/home3.png" class="home_icon">
					</a>
					<a href="/index.html">&nbsp;HOME</a> | &nbsp;커뮤니티 | NOTICE
				</li>
			</ul>
<script>			
	function formSearch(){
		var fm = document.notice;
		fm.action ="notice_r.jsp";
		fm.method ="post";
		fm.submit();		
	}	
</script>	
			<form name="notice">
			<p class="select_Box">
				<select name="t_sel" class="sel_box" >
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="t_search" maxlength="20" class="sel_text" />
				<input type="button" onClick="javascript:formSearch()" value="검&nbsp;&nbsp;색" class="sel_button" >
			</p>			
			</form>
<style>
	.bord_list { padding-top:10px;}
	.bord_table {width:100%;}
	.bord_list th {
		border-top:1px solid #848484;
		border-bottom:1px solid #848484; 
		padding: 10px;
	}
	.bord_table td {
		border-bottom:1px solid #e0e0e0; 
		padding:10px; 
		text-align:center;}
	.bord_table td.title {text-align:left;}

	/* footer css */

	#footer {clear:both;background:#42464d; padding-top:10px; padding-bottom:10px; margin-top:60px;}
	#footer .address {font-style:normal; color:#ababb1; margin-bottom:20px;}
	#footer .address .title {font-size:14px; margin-bottom:8px; color:#fff;}
	#footer  .copyright {color:#fff;}

	.paging {
		padding-top:30px; 
		text-align:center;
	}
	.paging a{
		padding:10px; 
		border:1px solid #e0e0e0;
	}
	.paging a.active {
		background:#007dc6; 
		color:#fff;
	}

	.paging .btn_write {
		background:#BDBDBD; 
		padding:10px 16px; 
		color:#fff; 
		float:right;
	}

</style>			
			
	  <div class="bord_list">
		<table class="bord_table">
			<colgroup>
				<col width="10%">
				<col width="*">
				<col width="10%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
<%
			for(int k=0; k < dtos.size() ; k++){
%>	
				<tr>
					<td><a href="notice_v.jsp?t_noticeNo=<%=dtos.get(k).getNotice_no()%>"><%=dtos.get(k).getNotice_no()%></a></td>
					<td class="title">
						<a href="notice_v.jsp?t_noticeNo=<%=dtos.get(k).getNotice_no()%>"><%=dtos.get(k).getTitle()%></a></td>
					<td><%=dtos.get(k).getReg_id()%></td>
					<td><%=dtos.get(k).getReg_date()%></td>
					<td><%=dtos.get(k).getHit()%></td>
				</tr>
<%
			}
%>				
			</tbody>
		</table>
		<div class="paging">
			<a href=""><i class="fa fa-angle-double-left"></i></a>
			<a href=""><i class="fa fa-angle-left"></i></a>
			<a href="" class="active">1</a>
			<a href="">2</a>
			<a href="">3</a>
			<a href="">4</a>
			<a href="">5</a>
			<a href=""><i class="fa fa-angle-right"></i></a>
			<a href=""><i class="fa fa-angle-double-right"></i></a>
			<a href="notice_w.jsp" class="btn_write">글쓰기</a>
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