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
String MOV_NUMBER = request.getParameter("MOV_NUMBER"); 
MOV_NUMBER = new String(MOV_NUMBER .getBytes("8859_1"), "EUC-KR");

int GEN_NUMBER = Integer.parseInt(request.getParameter("GEN_NUMBER"));
int NAT_NUMBER = Integer.parseInt(request.getParameter("NAT_NUMBER"));
int MOV_AGE = Integer.parseInt(request.getParameter("MOV_AGE"));
String MOV_NAME = request.getParameter("MOV_NAME");
String MOV_DIRECTOR = request.getParameter("MOV_DIRECTOR");
String MOV_STORY = request.getParameter("MOV_STORY");
String MOV_IMAGE = request.getParameter("MOV_IMAGE");
int MOV_RUNNINGTIME = Integer.parseInt(request.getParameter("MOV_RUNNINGTIME"));
int MOV_RELEASE_Y = Integer.parseInt(request.getParameter("MOV_RELEASE_Y"));
int MOV_RELEASE_M = Integer.parseInt(request.getParameter("MOV_RELEASE_M"));
int MOV_RELEASE_D = Integer.parseInt(request.getParameter("MOV_RELEASE_D"));
int THE_NUMBER = Integer.parseInt(request.getParameter("THE_NUMBER"));

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:sqlserver://localhost:1433;DataBaseName=TeamProject"; 
String user = "sa";
String password = "7988";

try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	con = DriverManager.getConnection(url, user, password);
	String sql = "update MOVIE set GEN_NUMBER=?, NAT_NUMBER=?, MOV_AGE=?, MOV_NAME=?, MOV_RUNNINGTIME=?, MOV_DIRECTOR=?, MOV_STORY=?, MOV_RELEASE_Y=?, MOV_RELEASE_M=?, MOV_RELEASE_D=?, THE_NUMBER=?, MOV_IMAGE=? where MOV_NUMBER=? ";
	pstmt = con.prepareStatement(sql);
	
	pstmt.setInt(1,GEN_NUMBER);
	pstmt.setInt(2,NAT_NUMBER);
	pstmt.setInt(3,MOV_AGE);
	pstmt.setString(4,MOV_NAME);
	pstmt.setInt(5,MOV_RUNNINGTIME);
	pstmt.setString(6, MOV_DIRECTOR);
	pstmt.setString(7, MOV_STORY);
	pstmt.setInt(8, MOV_RELEASE_Y);
	pstmt.setInt(9, MOV_RELEASE_M);
	pstmt.setInt(10, MOV_RELEASE_D);
	pstmt.setInt(11, THE_NUMBER);
	pstmt.setString(12, MOV_IMAGE);
	pstmt.setString(13, MOV_NUMBER);

	int result = pstmt.executeUpdate();
	%>
	<script>
	alert("수정이 완료 되었습니다.");
	location.href="managermovie.jsp";
	</script>
	<%
}catch(Exception e){
	 e.printStackTrace();
}
%>
</body>
</html>