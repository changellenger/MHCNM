<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%
    String checkId = null;
    checkId = (String)session.getAttribute("s_Id");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><%=checkId%>님 안녕하세요</title>
</head>

<%
request.setCharacterEncoding("euc-kr");
String CUS_ID = request.getParameter("CUS_ID");
CUS_ID = new String(CUS_ID.getBytes("8859_1"), "EUC-KR");

String CUS_NAME = request.getParameter("CUS_NAME");
String CUS_CODE = request.getParameter("CUS_CODE");
String CUS_PASSWORD = request.getParameter("CUS_PASSWORD");
int CUS_YEAR =0;
if(request.getParameter("CUS_YEAR")!=null){
	CUS_YEAR=Integer.parseInt(request.getParameter("CUS_YEAR"));
}

int CUS_MONTH =  Integer.parseInt(request.getParameter("CUS_MONTH"));
int CUS_DATE =  Integer.parseInt(request.getParameter("CUS_DATE"));
String CUS_ADDRESS = request.getParameter("CUS_ADDRESS");
String CUS_PHONE = request.getParameter("CUS_PHONE");

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:sqlserver://localhost:1433;DataBaseName=TeamProject"; 
String user = "sa";
String password = "7988";

System.out.println(CUS_ID);
System.out.println(CUS_PASSWORD);
System.out.println(CUS_YEAR);
System.out.println(CUS_MONTH);
System.out.println(CUS_DATE);
System.out.println(CUS_ADDRESS);
System.out.println(CUS_PHONE);

try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
 	con = DriverManager.getConnection(url, user, password);
 	String sql = "Update CUSTOMER set CUS_NAME=?, CUS_ID=?, CUS_PASSWORD=?, CUS_YEAR=?, CUS_MONTH=?, CUS_DATE=?, CUS_ADDRESS=?, CUS_PHONE=? where CUS_ID = '" + checkId + "'";
 			
 	pstmt = con.prepareStatement(sql); 
 	pstmt.setString(1,CUS_NAME);
 	pstmt.setString(2,CUS_ID);
	pstmt.setString(3,CUS_PASSWORD);
	pstmt.setInt(4,CUS_YEAR);
	pstmt.setInt(5,CUS_MONTH);
	pstmt.setInt(6,CUS_DATE);
	pstmt.setString(7, CUS_ADDRESS);
	pstmt.setString(8, CUS_PHONE);
	
	
	int result = pstmt.executeUpdate();
	%>
	<script>
	alert("수정이 완료 되었습니다.");
	location.href="myinformation.jsp";
	</script>
	<%
}catch(Exception e){
	e.printStackTrace();
	 
}
%>
</body>
</html>