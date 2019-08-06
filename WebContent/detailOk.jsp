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
    width: 70%;
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
<script language=javascript>
function bt(id,after)
{
eval(id+'.filters.blendTrans.stop();');
eval(id+'.filters.blendTrans.Apply();');
eval(id+'.src="'+after+'";');
eval(id+'.filters.blendTrans.Play();');
}
</script>
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
String ID = request.getParameter("id");
int id = Integer.parseInt(ID);
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:sqlserver://localhost:1433;DataBaseName=TeamProject"; 
String user = "sa";
String password = "7988";

try{
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
    con = DriverManager.getConnection(url, user, password);
    String sql = "Select * from MOVIE where THE_NUMBER = " + id; 
    pstmt = con.prepareStatement(sql); 
    rs = pstmt.executeQuery();

    while(rs.next()) {
    	String MOV_NAME = rs.getString("MOV_NAME");
    	String MOV_DIRECTOR = rs.getString("MOV_DIRECTOR");
    	int GEN_NUMBER =rs.getInt("GEN_NUMBER");
   		String GEN_NAME = null;
    
   		if(GEN_NUMBER == 0) {
        	GEN_NAME = "SF";
        }
        if(GEN_NUMBER == 1) {
            GEN_NAME = "드라마";
        }
        if(GEN_NUMBER == 2) {
            GEN_NAME = "액션";
        }
        if(GEN_NUMBER == 3) {
            GEN_NAME = "미스터리";
        }
        if(GEN_NUMBER == 4) {
        	GEN_NAME = "판타지";
        }
        if(GEN_NUMBER == 5) {
            GEN_NAME = "코미디";
        }
        if(GEN_NUMBER == 6) {
        	GEN_NAME = "스릴러";
        }
        if(GEN_NUMBER == 7) {
        	GEN_NAME = "로맨스";
        }
        if(GEN_NUMBER == 8) {
        	GEN_NAME = "다큐맨터리";
        }
        if(GEN_NUMBER == 9) {
        	GEN_NAME = "가족";
        }
        if(GEN_NUMBER == 10) {
            GEN_NAME = "공포";
        }
        if(GEN_NUMBER == 11) {
            GEN_NAME = "모험";
        }
        
        int MOV_AGE = rs.getInt("MOV_AGE");
        String AGE_NAME = null;
        if(MOV_AGE == 0) {
        	AGE_NAME = "전체 관람가"; 
        }
        if(MOV_AGE == 1) {
            AGE_NAME = "7세이상 관람가";
        }
        if(MOV_AGE == 2) {
        	AGE_NAME = "12세이상 관람가";
        }
        if(MOV_AGE == 3) {
        	AGE_NAME = "15세이상 관람가";
        }
        if(MOV_AGE == 4) {
            AGE_NAME = "청소년 관람불가";
        }
        
        String MOV_RUNNINGTIME = rs.getString("MOV_RUNNINGTIME");
    	String MOV_STORY = rs.getString("MOV_STORY");
    	String MOV_IMAGE = rs.getString("MOV_IMAGE");
   		String MOV_IMAGE2 = "images/" + MOV_IMAGE + ".png";
%>

<center>
<br><br>
<table width="900">
<tr>
<td rowspan="5"><center><img src="<%=MOV_IMAGE2%>" width="150" height="210" alt="" ></center></td>
<td colspan="2" BGCOLOR = "#000000" width="300" height="100"><font color="#FFFFFF" size=7><B><center><b><%=MOV_NAME%></b></center></B></font></td>
</tr>
            
<tr>
<td>감독</td>
<td><%=MOV_DIRECTOR%></td>
</tr>

<tr>
<td>장르</td>
<td><%=GEN_NAME%></td>
</tr>
            
<tr>
<td>등급</td>
<td><%=AGE_NAME%></td>
</tr>

<tr>
<td>러닝타임</td>
<td><%=MOV_RUNNINGTIME%> 분</td>
</tr>
         
<tr>
<td colspan="3">줄거리</td>

</tr>

<tr>
<td colspan="3"><%=MOV_STORY%></td>

</tr>
   
</table>
<%} %>

<center>
<br><br>
<a href="reservation.jsp" class="testbutton" >예매하기</a>

<br><br>
</center>
<% 
}catch(Exception e){
 out.println(e);
 out.println("실패");
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