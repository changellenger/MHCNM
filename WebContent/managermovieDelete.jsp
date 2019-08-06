<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%
    String checkId = null;
    checkId = (String)session.getAttribute("s_Id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><%=checkId%>님 안녕하세요</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");
String THE_NUMBER = request.getParameter("THE_NUMBER"); 
THE_NUMBER = new String(THE_NUMBER.getBytes("8859_1"), "EUC-KR");

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:sqlserver://localhost:1433;DataBaseName=TeamProject"; 
String user = "sa";
String password = "7988";

try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	con = DriverManager.getConnection(url, user, password);
	String sql = "Delete from MOVIE where THE_NUMBER='" + THE_NUMBER + "'";
	pstmt = con.prepareStatement(sql);
	
	int result = pstmt.executeUpdate();
	%>
	<script>
	alert("삭제가 완료 되었습니다.");
	location.href="managermovie.jsp";
	</script>
	<%
}catch(Exception e){
	 
}
%>
</body>
</html>