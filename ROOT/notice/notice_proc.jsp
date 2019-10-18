<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.Notice_DAO,dto.Notice_DTO,common.CommonUtil"%>
	
<%@ include file = "/common_session_info.jsp"%>
<%@ include file = "/common/sessionCheckManager.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	Notice_DAO dao = new Notice_DAO();
	
	
	String work_gubun   = request.getParameter("t_work_gubun");
	String notice_no, title , content , file_name_1 , reg_id, reg_date;
	String msg="";
	int result =0;
	
	
	 title 		= request.getParameter("t_title");
	 if(title !=null)title = title.replaceAll("\'", "\''");
	 content    = request.getParameter("t_content");
	 if(content !=null)content = title.replaceAll("\'", "\''");
	 file_name_1 = "";
	 reg_id 	=sessionId;
	 reg_date 	= CommonUtil.getToday();
	 
	if(work_gubun.equals("insert"))
	{
		notice_no 	= dao.getNoticeNo();
		Notice_DTO notice_dto = new Notice_DTO(notice_no,title,content,file_name_1,
										reg_id,reg_date,0);
		result = dao.insertNotice(notice_dto);
		msg = "삽입";
	}
	else if(work_gubun.equals("update"))
	{
		notice_no 	= request.getParameter("t_notice_no");
		//out.print(notice_no + title+content+reg_id+reg_date);
		result = dao.updateNotice(notice_no,title,content,reg_id,reg_date);
	
			if(result> 0)
			{
				%> <script>location.replace("notice_r.jsp"); </script>
				<%
			}
			else{
				%> <script>alert("나나")</script>
				<%
			}
		msg = "수정";
	}
	else if(work_gubun.equals("delete"))
	{
		
	 notice_no = request.getParameter("t_notice_no");
	 //Notice_DTO notice_dto = new Notice_DTO(notice_no,title,content,file_name_1, reg_id,reg_date,0);
	 //int result = dao.insertNotice(notice_dto);
		result = dao.deleteNotice(notice_no);
		msg = "삭제";
	}
	
	
	
//int result = dao.insertNotice(notice_no,title,content,reg_id,reg_date);

	
%>
<html>
	<head>
		<script>
			<% if(result > 0){ %>
				alert(" <% out.print(msg); %> 등록되었습니다~");
			<% } else {%>
				alert( " <%= msg%> 정상처리 되지 못했습니다.");
			<% } %>
			location.replace("notice_r.jsp");
		</script>
	</head>
</html>






























