<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common_head.jsp" %>
<%@ page import="java.util.*,dao.Qanda_DAO,dto.Qanda_DTO,common.CommonUtil"%>
<%
	request.setCharacterEncoding("UTF-8");
	Qanda_DAO dao = new Qanda_DAO();
	
	String selValue = request.getParameter("t_sel");
	String txtValue = request.getParameter("t_search");
	
	if(selValue == null) {
		selValue ="title";
		txtValue ="";
	}	
	ArrayList<Qanda_DTO> dtos = dao.getQandaList();	
	
	
	//Pageing ********************
	String tdCount ="5";				

	String r_page = CommonUtil.checkNull(request.getParameter("r_page"));		
	int			current_page;					// 현재페이지 번호
	int			total_page;						// 총페이지 수
	int			total_count;					// 총레코드 수
	int			for_count;						
	int			list_setup_count = 2;			// 한번에 출력될 List 수
	int			p_no;
	int			v_count;
	int			a_count;
	String		url				= null;	

	// 조회된 건수 구하기  total_count : 설정
	if(dtos == null) total_count =0;
	else total_count = dtos.size(); //튜블이 존재할 경우 튜플의 수를 토탈 카운트에 입력


	// 페이지번호가 없으면 1페이지로 간주
	if(r_page.equals("")) current_page = 1;
	else current_page = Integer.parseInt(r_page);
		
	for_count		= list_setup_count;
	p_no			= list_setup_count;				// 페이지수가 10
	total_page = total_count / list_setup_count;		// 전체페이지수 계산 (if 23개 게시물이면 2)
   
	if(current_page == 1) {
		v_count		= 0;
		a_count		= list_setup_count;
		for_count	= 0;
	} else{
		v_count		= 0;
		a_count		= p_no * current_page;
		for_count	= a_count - list_setup_count;
	}
	if(total_page * list_setup_count != total_count)   total_page = total_page +1;
	
	
%>



    <%@ include file="/common_sidebar.jsp" %>
	
      <div id="content">
			<ul>
				<!-- <li class="btn_home"> -->
					<!-- <a href="index.html"><i class="fa fa-home btn_plus"></i></a> -->
				<!-- </li> -->
				<li class="btn_home">
					<a href="/index.html">
						<img src="../images/home3.png" class="home_icon">
					</a>
					<a href="/index.html">&nbsp;HOME</a> | &nbsp;커뮤니티 | Qanda
				</li>
			</ul>
<script>			
	function formSearch(){
		var fm = document.Qanda;
		fm.action ="Qanda_r.jsp";
		fm.method ="post";
		fm.submit();		
	}	
</script>	

<style>
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
			<form name="Qanda">
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
			<%		if ( total_count > 0 ){
					for(int k = 0 ; k < total_count ; k++ )	{
					if(v_count == for_count){ 		
			%> 	
				<tr>
					<td class="title">
						<a href="qanda_v.jsp?t_Qanda_no=<%=dtos.get(k).getQna_no()%>"><%=dtos.get(k).getQna_no()%></a>
					</td>
					<td>
						<a href="qanda_v.jsp?t_Qanda_no=<%=dtos.get(k).getQna_no()%>"><%=dtos.get(k).getTitle()%></a>
					</td>
					<td>
					<%=dtos.get(k).getReg_id()%>
					</td>
					<td>
					<%=dtos.get(k).getQna_date()%>
					</td>
					<td>
					<%=dtos.get(k).getChecked_answer()%>
					</td>
					
				</tr>
			
			<%
						v_count = v_count + 1;
						for_count = for_count + 1;
						}else { 
							v_count = v_count + 1;
						}
						if(v_count == a_count)break; 
					}
				}else{	
			%>
   <TR align="center" bgcolor="white" >
       <TD colspan="<%=tdCount%>" >등록된 내용이 없습니다.</TD>
   </TR>
<%	} %> 						
			</tbody>
		</table>
		<div class="paging">
		
			<%
			url = "qanda_r.jsp?t_sel="+selValue+"&t_search="+txtValue;		 // 페이징될때도 셀렉트의 값 넘김
			out.println(CommonUtil.pageList(current_page, total_page, url));
			%>	

			<% if(!sessionLevel.equals("manager")){ %> 
			<a href="qanda_w.jsp" class="btn_write">글쓰기</a>
			<%	} %> 
		</div>
		</div>			
				
      </div>
	  
<%@ include file="/common_footer.jsp" %>
	  
	  
   