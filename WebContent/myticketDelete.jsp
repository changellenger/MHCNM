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
<%System.out.println("try2");
request.setCharacterEncoding("euc-kr");
int RES_NUMBER = Integer.parseInt(request.getParameter("RES_NUMBER"));
Connection con = null;
PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;
ResultSet rs = null;

String url = "jdbc:sqlserver://localhost:1433;DataBaseName=TeamProject"; 
String user = "sa";
String password = "7988";
	
String b= request.getParameter("SEAT_NUM");
String c= request.getParameter("RES_THE_NUMBER");
String d= request.getParameter("RES_TAB_NUMBER");
String f= request.getParameter("RES_SEAT_DATE");



try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	con = DriverManager.getConnection(url, user, password);
		String sql = "Update SEAT set SEAT_POSSIBLE=?, CUS_ID=? where CUS_ID='"+checkId+"' and SEAT_NUMBER ='"+b+"' AND THE_NUMBER ='"+c+"' AND SEAT_POSSIBLE ='0' AND TAB_NUMBER ='"+d+"' AND SEAT_DATE ='"+f+"' ";
		pstmt = con.prepareStatement(sql);
		System.out.println(sql);
		pstmt.setInt(1, 1);
		pstmt.setString(2, "NULL");
		int result = pstmt.executeUpdate();
		
		String sql2 = "Delete from RESERVATION where RES_NUMBER='" +RES_NUMBER+ "'";
		pstmt2 = con.prepareStatement(sql2);
		int result2 = pstmt2.executeUpdate();
	
	
	%>
	<script>
	alert("삭제가 완료 되었습니다.");
	location.href="myticket.jsp";
	</script>
	<%
}catch(Exception e){
	 
}
%>
</body>
</html>