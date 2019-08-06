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
<body>
<% 
String RES_NUMBER = request.getParameter("RES_NUMBER");
String RES_SEAT_DATE = request.getParameter("date");
System.out.println("seat date pass!");
System.out.println(RES_SEAT_DATE);
String RES_TAB_NUMBER = request.getParameter("timet");
int RES_THE_NUMBER = Integer.parseInt(request.getParameter("movie"));
String RES_MOV_NAME = " ";
int RES_MONEY = 8000; 

String chkbox[] = request.getParameterValues("cbox");
String the_number= request.getParameter("movie");
String tab_number= request.getParameter("timet");
System.out.println(the_number +","+ tab_number );

Connection con = null;
PreparedStatement pstmt2 = null;
PreparedStatement pstmt1 = null;
ResultSet rs = null;

String url = "jdbc:sqlserver://localhost:1433;DataBaseName=TeamProject"; 
String user = "sa";
String password = "7988";


try{
	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	 con = DriverManager.getConnection(url, user, password);
	 System.out.println(checkId);
	 
	 for(int i=0;i<chkbox.length;i++){
	 String sql1 = "Update SEAT set SEAT_POSSIBLE=?, CUS_ID=? WHERE SEAT_NUMBER='"+chkbox[i]+"' AND THE_NUMBER='"+the_number+"' AND TAB_NUMBER='"+tab_number+"' AND SEAT_DATE='"+RES_SEAT_DATE+"'";
	 String sql2 = "Insert into RESERVATION values(?,?,?,?,?,?,?)";
	
	 System.out.println(sql1);
	 if(RES_THE_NUMBER == 1) {
			RES_MOV_NAME = "인터스텔라";
		}

		if(RES_THE_NUMBER == 2) {
			RES_MOV_NAME = "패션왕";
		}
	 
	 pstmt1= con.prepareStatement(sql1);
	 pstmt2= con.prepareStatement(sql2);
	 
	 pstmt1.setInt(1,0);
	 pstmt1.setString(2,checkId);
	
	 
	 pstmt2.setString(1, checkId);
	 pstmt2.setString(2, RES_SEAT_DATE);
	 pstmt2.setString(3, RES_TAB_NUMBER);
	 pstmt2.setInt(4, RES_THE_NUMBER);
	 pstmt2.setString(5, RES_MOV_NAME);
	 pstmt2.setString(6, chkbox[i]);
	 pstmt2.setInt(7, RES_MONEY);
	 
	 int result = pstmt1.executeUpdate();
	 int result2 = pstmt2.executeUpdate();
	
	 }
%>
<script>
alert("자리가 예약 되었습니다.");

location.href="myticket.jsp";
</script>

<%			 
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>