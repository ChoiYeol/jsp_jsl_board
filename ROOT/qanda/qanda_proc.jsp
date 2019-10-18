<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.Qanda_DAO,dto.Qanda_DTO,common.CommonUtil"%>
	
<%@ include file = "/common_session_info.jsp"%>


<%
	request.setCharacterEncoding("UTF-8");
	Qanda_DAO dao = new Qanda_DAO();
	
		//  out.println("<script>alert('1');</script>");
	String work_gubun 	   = request.getParameter("t_work_gubun");
	
	String qanda_no	=null;
	String title  		   = request.getParameter("t_title");
	String content 		   = request.getParameter("t_content");
	String reg_id  		   = sessionId;
	
	String qna_date  	   = CommonUtil.getToday();
	
	String reply   		   = request.getParameter("t_reply_content");
	String reply_id  	   = request.getParameter("t_reply_id");
	String reply_date      = CommonUtil.getToday();
	
	String checked_answer  = request.getParameter("h_ca");
	
	String msg="";
	int result =0;
	
	//				out.println("<script>alert('오류발생1!!');</script>");
	
	 if(title !=null)title = title.replaceAll("\'", "\''");
	 if(content !=null)content = content.replaceAll("\'", "\''");
	 
	 
 
	if(work_gubun.equals("insert"))
	{
		
		qanda_no 	= dao.getQandaNo();
		result = dao.insertQanda(qanda_no,title, content ,reg_id, qna_date );
		msg = "질문이 등록";
	}
	else if(work_gubun.equals("update")) //아직안됨
	{
		if(checked_answer.equals("답변완료"))
		{	msg = "답변 완료! 수정";	}
		else{
			
		qanda_no 	= request.getParameter("t_Qanda_no");
	 
		result = dao.updateQanda(qanda_no,title,content,reg_id,qna_date);
		msg = "수정이 완료";
		}
		
	
	
	}
	else if(work_gubun.equals("delete"))
	{
		if(checked_answer.equals("답변완료"))
		{
			msg = "답변 완료! 삭제 ";
			
		}else{
	 
		qanda_no = request.getParameter("t_Qanda_no");

		//Qanda_DTO Qanda_dto = new Qanda_DTO(Qanda_no,title,content,file_name_1, reg_id,reg_date,0);
		//int result = dao.insertQanda(Qanda_dto);
		result = dao.deleteQanda(qanda_no);
		msg = "삭제가 완료";
			
		}
	}
	else if(work_gubun.equals("replyInsert"))
	{
			qanda_no = request.getParameter("t_Qanda_no");
			checked_answer ="y";
			
			result = dao.reflyInsertQanda(qanda_no, reply , reply_id , reply_date , checked_answer);
			msg ="매니저 답변하기가 완료";
	}
  
//int result = dao.insertQanda(Qanda_no,title,content,reg_id,reg_date);

%>

<html>
	<head>
		<script>
			<% if(result > 0){ %>
				alert(" <% out.print(msg); %>  되었습니다.");
			<% } else {%>
				alert( "<%= msg%> 되지않았습니다.");
			<% } %>
			
					location.replace("qanda_r.jsp");
			
		</script>
	</head>
</html>






























