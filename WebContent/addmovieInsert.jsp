<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>영화추가</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");

String MOV_NAME = request.getParameter("MOV_NAME");
String MOV_DIRECTOR = request.getParameter("MOV_DIRECTOR");
int MOV_RELEASE_Y = Integer.parseInt(request.getParameter("MOV_RELEASE_Y"));
int MOV_RELEASE_M = Integer.parseInt(request.getParameter("MOV_RELEASE_M"));
int MOV_RELEASE_D = Integer.parseInt(request.getParameter("MOV_RELEASE_D"));
int GEN_NUMBER = Integer.parseInt(request.getParameter("GEN_NUMBER"));
int MOV_AGE = Integer.parseInt(request.getParameter("MOV_AGE"));
int NAT_NUMBER = Integer.parseInt(request.getParameter("NAT_NUMBER"));
int THE_NUMBER = Integer.parseInt(request.getParameter("THE_NUMBER"));
int MOV_RUNNINGTIME = Integer.parseInt(request.getParameter("MOV_RUNNINGTIME"));
String MOV_STORY = request.getParameter("MOV_STORY");
String MOV_IMAGE = request.getParameter("MOV_IMAGE");

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:sqlserver://localhost:1433;DataBaseName=TeamProject"; 
String user = "sa";
String password = "7988";

try{
	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	 con = DriverManager.getConnection(url, user, password);
	 String sql="Insert into MOVIE values(?,?,?,?,?,?,?,?,?,?,?,?)";
	 pstmt=con.prepareStatement(sql);
	 
	 pstmt.setInt(1, GEN_NUMBER);
	 pstmt.setInt(2, NAT_NUMBER);
	 pstmt.setInt(3, MOV_AGE);
	 pstmt.setString(4, MOV_NAME);
	 pstmt.setInt(5, MOV_RUNNINGTIME);
	 pstmt.setString(6, MOV_DIRECTOR);
	 pstmt.setString(7, MOV_STORY);
	 pstmt.setInt(8, MOV_RELEASE_Y);
	 pstmt.setInt(9, MOV_RELEASE_M);
	 pstmt.setInt(10, MOV_RELEASE_D);
	 pstmt.setInt(11, THE_NUMBER);
	 pstmt.setString(12, MOV_IMAGE);
	 
	 int result = pstmt.executeUpdate();
%>
<script>
alert("영화가 추가 되었습니다.");
location.href="managerindex.jsp";
</script>

<%			 
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>