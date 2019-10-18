
<%@ page import="common.CommonUtil"%>
<% 
	CommonUtil common = new CommonUtil();
	String sessionName = common.checkNull((String)session.getAttribute("session_name"));
	String sessionId = common.checkNull((String)session.getAttribute("session_id"));
	String sessionLevel = common.checkNull((String)session.getAttribute("session_level"));
	
	
%>