<%
		if(!sessionLevel.equals("manager"))
		{
%>
	
			<script>
				alert("관리자가 아니면 접근 할 수 없습니다.");
				location.href = "/index.jsp";
			</script>
<% } %>