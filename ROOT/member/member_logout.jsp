﻿<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file = "/common_session_info.jsp"%>
<%
	session.invalidate();
%>
<html>
	<head>
		<script>
				alert("<%=sessionName%>님이 로그아웃 되었습니다.");
				location.href = "/index.jsp";
		</script>
	</head>
</html>