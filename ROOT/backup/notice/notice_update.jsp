<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.Notice_DAO,dto.Notice_DTO,common.CommonUtil"%>
<%
	request.setCharacterEncoding("UTF-8");
	Notice_DAO dao = new Notice_DAO();
	
	String notice_no 	= request.getParameter("t_notice_no");
	String title 		= request.getParameter("t_title");
	String content 		= request.getParameter("t_content");
	String file_name_1  = "";
	String reg_id 		="홍길동";
	String reg_date 	= CommonUtil.getToday(); //원래는 처음등록과 수정등록 둘다 있어야한다.
	
	//out.print(notice_no + title+content+reg_id+reg_date);
    int result = dao.updateNotice(notice_no,title,content,reg_id,reg_date);
	
	if(result> 0)
	{
		%> <script>location.href = "notice_r.jsp"; </script>
		<%
	}
	else{
		%> <script>alert("나나")</script>
		<%
	}
%>





























