<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.News_DAO,dto.News_DTO,common.CommonUtil"%>
<%
	request.setCharacterEncoding("UTF-8");
	News_DAO dao = new News_DAO();
	
	
	String work_gubun   = request.getParameter("t_work_gubun");
	String news_no, title , content , file_name_1 , reg_id, reg_date;
	String msg="";
	int result =0;
	
	
	 title 		= request.getParameter("t_title");
	 if(title !=null)title = title.replaceAll("\'", "\''");
	 content    = request.getParameter("t_content");
	 if(content !=null)content = title.replaceAll("\'", "\''");
	 file_name_1 = "";
	 reg_id 	="홍길동";
	 reg_date 	= CommonUtil.getToday();
	 
	if(work_gubun.equals("insert"))
	{
		news_no 	= dao.getNewsNo();
		News_DTO news_dto = new News_DTO(news_no,title,content, reg_id,reg_date,0);
		result = dao.insertNews(news_dto);
		msg = "삽입";
	}
	else if(work_gubun.equals("update"))
	{
		news_no 	= request.getParameter("t_news_no");
		//out.print(News_no + title+content+reg_id+reg_date);
		result = dao.updateNews(news_no,title,content,reg_id,reg_date);
	
			if(result> 0)
			{
				%> <script>location.replace("/news/news_r.jsp"); </script>
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
		
	 news_no = request.getParameter("t_news_no");
	 //News_DTO News_dto = new News_DTO(news_no,title,content,file_name_1, reg_id,reg_date,0);
	 //int result = dao.insertNews(news_dto);
		result = dao.deleteNews(news_no);
		msg = "삭제";
	}
	
	
	
//int result = dao.insertNews(news_no,title,content,reg_id,reg_date);

	
%>
<html>
	<head>
		<script>
			<% if(result > 0){ %>
				alert(" <% out.print(msg); %> 등록되었습니다~");
			<% } else {%>
				alert( " <%= msg%> 정상처리 되지 못했습니다.");
			<% } %>
			location.replace("/news/news_r.jsp");
		</script>
	</head>
</html>






























