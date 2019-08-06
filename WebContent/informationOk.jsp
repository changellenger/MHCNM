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
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:sqlserver://localhost:1433;DataBaseName=TeamProject"; 
String user = "sa";
String password = "7988";

try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
    con = DriverManager.getConnection(url, user, password);
    String sql = "Select * from MOVIE"; 
    pstmt = con.prepareStatement(sql); 
    rs = pstmt.executeQuery();

    String[] MOV_NAME = new String[4];
    String[] MOV_DIRECTOR = new String[4];
    String[] GEN_NAME = new String[4];
    int[] THE_NUMBER = new int[4];
    int[] GEN_NUMBER = new int[4];
    String[] MOV_RUNNINGTIME =new String[4];
    int[] MOV_AGE = new int[4];
    String[] MOV_IMAGE = new String[4];
    String[] MOV_IMAGE2 = new String[4];
    String[] AGE_NAME = new String[4];

    for(int i=0;i<4 && rs.next();i++) {
    	MOV_NAME[i] = rs.getString("MOV_NAME");
        MOV_DIRECTOR[i] = rs.getString("MOV_DIRECTOR");
        GEN_NUMBER[i] = rs.getInt("GEN_NUMBER");
        GEN_NAME[i] = null;
        THE_NUMBER[i] = rs.getInt("THE_NUMBER");
       
        if(GEN_NUMBER[i] == 0) {
        	GEN_NAME[i] = "SF";
        }
        if(GEN_NUMBER[i] == 1) {
            GEN_NAME[i] = "드라마";
        }
        if(GEN_NUMBER[i] == 2) {
            GEN_NAME[i] = "액션";
        }
        if(GEN_NUMBER[i] == 3) {
            GEN_NAME[i] = "미스터리";
        }
        if(GEN_NUMBER[i] == 4) {
        	GEN_NAME[i] = "판타지";
        }
        if(GEN_NUMBER[i] == 5) {
            GEN_NAME[i] = "코미디";
        }
        if(GEN_NUMBER[i] == 6) {
        	GEN_NAME[i] = "스릴러";
        }
        if(GEN_NUMBER[i] == 7) {
        	GEN_NAME[i] = "로맨스";
        }
        if(GEN_NUMBER[i] == 8) {
        	GEN_NAME[i] = "다큐맨터리";
        }
        if(GEN_NUMBER[i] == 9) {
        	GEN_NAME[i] = "가족";
        }
        if(GEN_NUMBER[i] == 10) {
            GEN_NAME[i] = "공포";
        }
        if(GEN_NUMBER[i] == 11) {
            GEN_NAME[i] = "모험";
        }
        
        MOV_AGE[i] = rs.getInt("MOV_AGE");
        if(MOV_AGE[i] == 0) {
        	AGE_NAME[i] = "전체 관람가"; 
        }
        if(MOV_AGE[i] == 1) {
            AGE_NAME[i] = "7세이상 관람가";
        }
        if(MOV_AGE[i] == 2) {
        	AGE_NAME[i] = "12세이상 관람가";
        }
        if(MOV_AGE[i] == 3) {
        	AGE_NAME[i] = "15세이상 관람가";
        }
        if(MOV_AGE[i] == 4) {
            AGE_NAME[i] = "청소년 관람불가";
        }
        
		MOV_RUNNINGTIME[i] = rs.getString("MOV_RUNNINGTIME");
        MOV_IMAGE[i] = rs.getString("MOV_IMAGE");
        MOV_IMAGE2[i] = "images/"+MOV_IMAGE[i] + ".png";
    }
%>

<table border=0>
<tr>
<td>
	<table width="450" >
	<center>
	<tr>
    <td rowspan="6" >
    <form action="detailOk.jsp">
    <input type=image src="<%=MOV_IMAGE2[0]%>" width="130" height="210" alt="submit" value="0" name="id">
    </form>
    </td>
    <td colspan="2" BGCOLOR = "#000000" ><font color="#FFFFFF"><B><center><%=MOV_NAME[0]%></center></B></font></td>
    </tr>
            
    <tr>
    <td>Director</td>
    <td><%=MOV_DIRECTOR[0]%></td>   
    </tr>
            
    <tr>
    <td>Genre</td>
    <td><%=GEN_NAME[0]%></td>
    </tr>
            
    <tr>
    <td>Rate</td>
    <td><%=AGE_NAME[0]%></td>
    </tr>
         
    <tr>
    <td>RunningTime</td>
    <td><%=MOV_RUNNINGTIME[0]%> 분</td>
    </tr>
            
    <tr height="50">
    <td colspan="2">
    <center>
    <a href="reservation.jsp" class="testbutton" >예매하기</a>
    </center>
    </td>
    </tr>
    </center>
    </font>
    </table>
</td>
            
<td>
	<table width="450">
    <center>
    <tr>
    <td rowspan="6" >
    <form action="detailOk.jsp">
    <input type=image src="<%=MOV_IMAGE2[1]%>" width="130" height="210" alt="submit" value="1" name="id">
    </form>
    </td>
    
    <td colspan="2" BGCOLOR = "#000000"><font color="#FFFFFF" face="aTang"><B><center><%=MOV_NAME[1]%></center></B></font>
    </td>
    </tr>
            
    <tr>
    <td>Director</td>
    <td><%=MOV_DIRECTOR[1]%></td>
    </tr>
            
    <tr>
    <td>Genre</td>
    <td><%=GEN_NAME[1]%></td>
    </tr>
            
    <tr>
    <td>Rate</td>
    <td><%=AGE_NAME[1]%></td>
    </tr>
         
    <tr>
    <td>RunningTime</td>
    <td><%=MOV_RUNNINGTIME[1]%> 분</td>
    </tr>
            
    <tr height="50">
    <center>
    <td colspan="2">
    <center>
    <center>
    <a href="login.jsp" class="testbutton" >예매하기</a>
    </center></td>
    </tr>
    </center>
    </table>
</td>
</tr>
            
<tr>
<td>
	<table width="450">
    <center>
    <tr>
    <td rowspan="6" >
    <form action="detailOk.jsp">
    <input type=image src="<%=MOV_IMAGE2[2]%>" width="130" height="210" alt="submit" value="2" name="id">
    </form>
    </td>
    <td colspan="2" BGCOLOR = "#000000"><font color="#FFFFFF" face="aTang"><B><center><%=MOV_NAME[2]%></center></B>
    </td>
    </tr>
            
    <tr>
    <td>Director</td>
    <td><%=MOV_DIRECTOR[2]%></td>
    </tr>
            
    <tr>
    <td>Genre</td>
    <td><%=GEN_NAME[2]%></td>
    </tr>
            
    <tr>
    <td>Rate</td>
    <td><%=AGE_NAME[2]%></td>
    </tr>
         
    <tr>
    <td>RunningTime</td>
    <td><%=MOV_RUNNINGTIME[2]%> 분</td>
    </tr>
            
    <tr height="50">
    <td colspan="2">
    <center>
    <a href="login.jsp" class="testbutton">예매하기</a>
    </center>
    </td>
    </tr>
    </center>
    </table>
</td>

<td>
	<table width="450">
    <center>
    <tr>
    <td rowspan="6" >
    <form action="detailOk.jsp">
    <input type=image src="<%=MOV_IMAGE2[3]%>" width="130" height="210" alt="submit" value="3" name="id">
    </form>
    </td>
    <td colspan="2" BGCOLOR = "#000000"><font color="#FFFFFF" face="aTang"><B><center><%=MOV_NAME[3]%></center></B>
    </td>
    </tr>
            
    <tr>
    <td>Director</td>
    <td><%=MOV_DIRECTOR[3]%></td>
    </tr>
            
    <tr>
    <td>Genre</td>
    <td><%=GEN_NAME[3]%></td>
    </tr>
            
    <tr>
    <td>Rate</td>
    <td><%=AGE_NAME[3]%></td>
    </tr>
         
    <tr>
    <td>RunningTime</td>
    <td><%=MOV_RUNNINGTIME[3]%> 분</td>
    </tr>
            
    <tr height="50">
    <td colspan="2">
    <center>
    <a href="login.jsp" class="testbutton" >예매하기</a>
    </center>
    </td>
    </tr>
    </center>
    </table>
</td>
</tr>
</table>
</font> 

<%
} catch(Exception e){
 out.println(e);
 out.println("실패");
}
%>

</center>
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