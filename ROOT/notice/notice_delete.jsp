<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.Notice_DAO,dto.Notice_DTO,common.CommonUtil"%>
<%
	request.setCharacterEncoding("UTF-8");
	Notice_DAO dao = new Notice_DAO();
	
	String notice_no = request.getParameter("t_notice_no");

    int result = dao.deleteNotice(notice_no);
	//Notice_DTO notice_dto = new Notice_DTO(notice_no,title,content,file_name_1, reg_id,reg_date,0);
	//int result = dao.insertNotice(notice_dto);
	
	if(result> 0)
	{
		%> <script>location.href = "notice_r.jsp"; </script>
		<%
	}
	else{
		%> <script>alert("ㄴㄴ")</script>
		<%
	}
	
%>





























