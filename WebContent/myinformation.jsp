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
<font face="돋움" color="#FFFFFF">
<style>
  table {
    width: 50%;
    border-collapse: collapse;
  }
  th, td {
    border-top: 1px solid #bcbcbc;
    border-bottom: 1px solid #bcbcbc;
    padding: 5px 10px;
  }
</style>

<!DOCTYPE html>
<head>
<meta  charset="utf-8">
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="page">
<div id="header">
<div>
<style tape="text/css">
 a:link { color: red; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: none;}
</style>
<a href="loginOk.jsp"><img src= "images/mohyeon.png" alt=""></a>
<ul class="navigation">
<div id="topMenu" >
<ul>
<li class="topMenuLi">
<a class="menuLink" href="informationOk.jsp">INFORMATION</a>
</li>
<li class="topMenuLi">
<a class="menuLink">RESERVATION</a>
<ul class="submenu">
<li><a href="reservation.jsp" class="submenuLink">MOVIE</a>
<a href="reservation.jsp" class="submenuLink">DATE</a></li>
</ul>
</li>
	
<li class="topMenuLi">
<a class="menuLink">MYPAGE</a>
<ul class="submenu">
<li><a href="myticket.jsp" class="submenuLink">MYTICKET</a>
<a href="myinformation.jsp" class="submenuLink">MYINFORMATION</a></li>
</ul>
</li>
		
<li class="topMenuLi">
<a class="menuLink" href="index.jsp">LOGOUT</a>
</li>
</ul>

</div>
</ul>
</div>
</div>

<br><br>
<div id="body">
<div class="featured">
<ul>
<center>
        
<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:sqlserver://localhost:1433;DataBaseName=TeamProject"; 
String user = "sa";
String password = "7988";

try{
	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
	 con = DriverManager.getConnection(url, user, password);
	 
	 String CUS_CODE = request.getParameter("CUS_CODE");
	 String sql = "Select * from CUSTOMER where CUS_ID = '" + checkId + "'"; 
	 pstmt = con.prepareStatement(sql); 
	 rs = pstmt.executeQuery();
	 
	 while(rs.next()) {
		 String CUS_NAME = rs.getString("CUS_NAME");
		 String CUS_ID = rs.getString("CUS_ID");
		 String CUS_PASSWORD = rs.getString("CUS_PASSWORD");
		 int CUS_YEAR = rs.getInt("CUS_YEAR");
		 int CUS_MONTH = rs.getInt("CUS_MONTH");
		 int CUS_DATE = rs.getInt("CUS_DATE");
		 String CUS_ADDRESS = rs.getString("CUS_ADDRESS");
		 String CUS_PHONE = rs.getString("CUS_PHONE");
%>
			 
<center>
            
<table>
<br><br>
<tr>
<td>Name</td> 
<td><%=CUS_NAME%><br></td>
</tr>
               
<tr>
<td>ID</td>
<td><%=CUS_ID%><br></td>
</tr>
               
<tr>
<td>PASSWORD</td>
<td><%=CUS_PASSWORD%><br></td>
</tr>
               
<tr>
<td>Birth</td>
<td><%=CUS_YEAR%> 년 <%=CUS_MONTH%> 월 <%=CUS_DATE%> 일</td>
</tr>
               
<tr>
<td>Address</td>
<td><%=CUS_ADDRESS%><br></td>
</tr>
               
<tr>
<td>Phone Number</td>
<td><%=CUS_PHONE%><br></td>
</tr>
</table>

<br><br>
<a href="myinformationUpdate.jsp?CUS_CODE=<%=checkId%>" class="testbutton" style="margin:0px 20px 0px 20px" >수정하기</a>
<br><br>
</center>

<%
}
}
catch(Exception e) {
	e.printStackTrace();
}
%>

</ul>
</div>
</div>
<div id="footer">
<div>
<ul class="connect">
<li>
<a href="https://www.google.co.kr/?gws_rd=ssl" class="googleplus">&nbsp;</a>
</li>
			
<li>
<a href="http://www.naver.com/" class="email">&nbsp;</a>
</li>

<li>
<a href="https://www.facebook.com//" class="facebook">&nbsp;</a>
</li>

<li>
<a href="https://twitter.com/" class="twitter">&nbsp;</a>
</li>
</ul>
<span>&copy; 2012. <a href="loginOk.jsp">모현극장</a> all rights reserved</span> </div>
</div>
</div>
</font>

</body>
</html>

</body>
</html>