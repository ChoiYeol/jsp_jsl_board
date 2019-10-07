<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>

<%@ include file="/common_head.jsp" %>
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
	function save(){
		var fm = document.notice;
		
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

	<form name="notice">		
	<input type="hidden" name="t_work_gubun" value="insert" >
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
						<input name="t_title" type="text" class="t_title" maxlength="30" />
					</td>
				</tr>
				<tr>
					<th>내 용</th>
					<td>
						<textarea name="t_content" class="board_textarea_H270" ></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="paging">
			<a href="notice_r.jsp" class="btn_write">목 록</a>
			<a href="notice_proc.jsp?t_title=가가나나&t_value=bbb" class="btn_write">get</a>
			<a href="javascript:save()" class="btn_write">등 록</a>
		</div>
	</div>			
	</form>
	
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