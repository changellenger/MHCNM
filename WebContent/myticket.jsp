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
    width: 100%;
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

<table>
<br><br>
<tr>

<td>날짜</td>
<td>상영시간</td>
<td>상영관</td>
<td>영화</td>
<td>좌석</td>
<td>금액</td>
<td>　　</td>
</tr>

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
	 
	 
	 String sql = "Select * from RESERVATION where CUS_ID = '" + checkId + "'"; 
	 pstmt = con.prepareStatement(sql); 
	 rs = pstmt.executeQuery();
	
	 %>
	 <form action="myticketDelete.jsp">
	 <%
	 while(rs.next()){
		 int RES_NUMBER = rs.getInt("RES_NUMBER");
		 String CUS_ID = rs.getString("CUS_ID");
		 String RES_SEAT_DATE = rs.getString("RES_SEAT_DATE");
		 String RES_TAB_NUMBER = rs.getString("RES_TAB_NUMBER");
		 int RES_THE_NUMBER = rs.getInt("RES_THE_NUMBER");
		 String RES_MOV_NAME = rs.getString("RES_MOV_NAME");
		 String RES_SEAT_NUMBER = rs.getString("RES_SEAT_NUMBER");
		 int SEAT = Integer.parseInt(RES_SEAT_NUMBER);
		 %>
		 
		 <input type="hidden" value="<%=RES_NUMBER %>" name="RES_NUMBER">
		 <input type="hidden" value="<%=RES_SEAT_NUMBER %>" name="SEAT_NUM">
		 <input type="hidden" value="<%=RES_THE_NUMBER %>" name="RES_THE_NUMBER">
		 <input type="hidden" value="<%=RES_TAB_NUMBER %>" name="RES_TAB_NUMBER">
		 <input type="hidden" value="<%=RES_SEAT_DATE %>" name="RES_SEAT_DATE"> 
		 
		 <%
		 String SEAT_NUM = null;
		 if(SEAT<=9 && SEAT>=0)
		 {
			 SEAT= SEAT+1;
			 SEAT_NUM = "A"+Integer.toString(SEAT);
		 }
		 if(SEAT<=19 && SEAT>=10)
		 {
			 SEAT= SEAT+1-10;
			 SEAT_NUM = "B"+Integer.toString(SEAT);
		 }
		 if(SEAT<=29 && SEAT>=20)
		 {
			 SEAT= SEAT+1-20;
			 SEAT_NUM = "C"+Integer.toString(SEAT);
		 }
		 if(SEAT<=39 && SEAT>=30)
		 {
			 SEAT= SEAT+1-30;
			 SEAT_NUM = "D"+Integer.toString(SEAT);
		 }
		 if(SEAT<=49 && SEAT>=40)
		 {
			 SEAT= SEAT+1-40;
			 SEAT_NUM = "E"+Integer.toString(SEAT);
		 }
		 if(SEAT<=59 && SEAT>=50)
		 {
			 SEAT= SEAT+1-50;
			 SEAT_NUM = "F"+Integer.toString(SEAT);
		 }
		 if(SEAT<=69 && SEAT>=60)
		 {
			 SEAT= SEAT+1-60;
			 SEAT_NUM = "G"+Integer.toString(SEAT);
		 }
		 if(SEAT<=79 && SEAT>=70)
		 {
			 SEAT= SEAT+1-70;
			 SEAT_NUM = "H"+Integer.toString(SEAT);
		 }
		 if(SEAT<=89 && SEAT>=80)
		 {
			 SEAT= SEAT+1-80;
			 SEAT_NUM = "I"+Integer.toString(SEAT);
		 }
		 if(SEAT<=99 && SEAT>=90)
		 {
			 SEAT= SEAT+1-90;
			 SEAT_NUM = "J"+Integer.toString(SEAT);
		 }
		 
		 int RES_MONEY = rs.getInt("RES_MONEY");
		 
		
		 
		 if(RES_TAB_NUMBER.equals("1")) {
			 RES_TAB_NUMBER = "08:00";
		 }
		 if(RES_TAB_NUMBER.equals("2")) {
			 RES_TAB_NUMBER= "11:30";
		 }
%>
    

<tr>
<td><%=RES_SEAT_DATE %></td>
<td><%=RES_TAB_NUMBER%></td>
<td><%=RES_THE_NUMBER%> 관</td>
<td><%=RES_MOV_NAME%></td>
<td><%=SEAT_NUM%></td>
<td><%=RES_MONEY%> 원</td>
<td><input type="submit" value="삭제"  class="testbutton" ></td>
</tr>
<% 
}
%> </form>
</table>
<br><br>


<a href="loginOk.jsp" class="testbutton" >확인</a>
<br><br>
</center>
<%
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