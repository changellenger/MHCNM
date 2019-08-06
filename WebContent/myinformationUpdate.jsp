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
 	
 	String nums = request.getParameter("CUS_CODE");
	nums = new String(nums.getBytes("8859_1"), "EUC-KR");
 	String sql = "Select * from CUSTOMER where CUS_ID='" + checkId + "'";
 			
 	pstmt = con.prepareStatement(sql); 
 	rs = pstmt.executeQuery();
%>
<center>
<%
int CUS_CODE = 0;
String CUS_NAME = null;
String CUS_ID = null;
String CUS_PASSWORD = null;
int CUS_YEAR = 0;
int CUS_MONTH = 0;
int CUS_DATE = 0;
String CUS_ADDRESS = null;
String CUS_PHONE = null;

while(rs.next()) {
	CUS_CODE = rs.getInt("CUS_CODE");
	CUS_NAME = rs.getString("CUS_NAME");
	CUS_ID = rs.getString("CUS_ID");
	CUS_PASSWORD = rs.getString("CUS_PASSWORD");
	CUS_YEAR = rs.getInt("CUS_YEAR");
	CUS_MONTH = rs.getInt("CUS_MONTH");
	CUS_DATE = rs.getInt("CUS_DATE");
	CUS_ADDRESS = rs.getString("CUS_ADDRESS");
	CUS_PHONE = rs.getString("CUS_PHONE");
}
%>
</center>
<form action="myinformationUpdateOk.jsp" method="post">
<input type="hidden" name="CUS_CODE" value="<%=CUS_CODE%>">
<center>

<br><br>           
<table>
<tr>
<td>Name</td> 
<td><input type="text" name="CUS_NAME" value="<%=CUS_NAME%>"><br></td>
</tr>
               
<tr>
<td>ID</td>
<td><input type="text" name="CUS_ID" value="<%=CUS_ID%>"><br></td>
</tr>
               
<tr>
<td>PASSWORD</td>
<td><input type="password" name="CUS_PASSWORD" value="<%=CUS_PASSWORD%>"><br></td>
</tr>
               
<tr>
<td>Birth</td>
<td><select name="CUS_YEAR" style="width:60px;" />
<option value="">(년)</option>
<%for(int i=2014;i>=1900;i--) {%>
<option value=<%=i %>><%=i %></option><%}%>
</select>
               
<select name="CUS_MONTH" style="width:50px;" />
<option value="">(월)</option>
<%for(int i=1;i<=12;i++) {%>
<option value=<%=i %>><%=i %></option><%}%>
</select>
      
<select name="CUS_DATE" style="width:50px;" />
<option value="">(일)</option>
<%for(int i=1;i<=31;i++) {%>
<option value=<%=i %>><%=i %></option><%}%>
</select>
</td>
</tr>
               
<tr>
<td>Address</td>
<td><input type="text" name="CUS_ADDRESS" value="<%=CUS_ADDRESS%>"><br></td>
</tr>
               
<tr>
<td>Phone Number</td>
<td><input type="text" name="CUS_PHONE" value="<%=CUS_PHONE%>"><br></td>
</tr>
</table>

<center>
<br><br>
<input type="submit"  class="testbutton" value="수정하기">
<input type="reset" class="testbutton" value="취소">
</center>
</form>
            
<%
} catch(Exception e) {
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