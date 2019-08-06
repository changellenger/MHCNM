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
<!DOCTYPE html>
<head>
   <meta  charset="utf-8">
   <link href="css/style.css" rel="stylesheet" type="text/css">
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
<a href="managerindex.jsp"><img src= "images/mohyeon.png" alt=""></a>
<ul class="navigation">
<div id="topMenu" >
<ul>
<li class="topMenuLi">
<a class="menuLink" href="presentcondition.jsp">PRESENTCONDITION</a>
</li>
	
<li class="topMenuLi">
<a class="menuLink" href="managermovie.jsp">CHANGEMOVIE</a>
</li>
	
<li class="topMenuLi">
<a class="menuLink" href="contact.jsp">CONTACT</a>
</li>
		
<li class="topMenuLi">
<a class="menuLink" href="index.jsp">LOGOUT</a>
</li>
</ul>
</div>
</ul>
</div>
</div>

<div id="body">
<div id="content">
<div class="section">
<br>
<br>
<br>
<br>

<%
String nums = request.getParameter("THE_NUMBER");
nums = new String(nums.getBytes("8859_1"), "EUC-KR");

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:sqlserver://localhost:1433;DataBaseName=TeamProject"; 
String user = "sa";
String password = "7988";

try{
 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
 con = DriverManager.getConnection(url, user, password);
 String sql = "Select * from MOVIE where THE_NUMBER='" + nums + "'"; 
 pstmt = con.prepareStatement(sql); 
 rs = pstmt.executeQuery();
%>
<center>
<%
int MOV_NUMBER = 0;
int GEN_NUMBER = 0;
int NAT_NUMBER = 0;
int MOV_AGE = 0;
String MOV_NAME = null;
int MOV_RUNNINGTIME = 0;
String MOV_DIRECTOR = null;
String MOV_STORY = null;
int MOV_RELEASE_Y = 0;
int MOV_RELEASE_M = 0;
int MOV_RELEASE_D = 0;
int THE_NUMBER = 0;
String MOV_IMAGE = null;

 while(rs.next()) {
	 MOV_NUMBER = rs.getInt("MOV_NUMBER");
	 GEN_NUMBER = rs.getInt("GEN_NUMBER");
	 NAT_NUMBER = rs.getInt("NAT_NUMBER");
	 MOV_AGE = rs.getInt("MOV_AGE");
	 MOV_NAME = rs.getString("MOV_NAME");
	 MOV_RUNNINGTIME = rs.getInt("MOV_RUNNINGTIME");
	 MOV_DIRECTOR = rs.getString("MOV_DIRECTOR");
	 MOV_STORY = rs.getString("MOV_STORY");
	 MOV_RELEASE_Y = rs.getInt("MOV_RELEASE_Y");
	 MOV_RELEASE_M = rs.getInt("MOV_RELEASE_M");
	 MOV_RELEASE_D = rs.getInt("MOV_RELEASE_D");
	 THE_NUMBER = rs.getInt("THE_NUMBER");
	 MOV_IMAGE = rs.getString("MOV_IMAGE");
 }
%>
</center>
<br><br>
<form action="managermovieUpdateOk.jsp" method="post">
<input type="hidden" name="MOV_NUMBER" value="<%=MOV_NUMBER%>">

 <table>
 <tr>
 <td>Title</td>
 <td colspan=5><input type="text" name="MOV_NAME" value="<%=MOV_NAME%>"></td>
 </tr>
 
 <tr>
 <td>Director</td>
 <td colspan=5><input type="text" name="MOV_DIRECTOR" value="<%=MOV_DIRECTOR%>"></td>
 </tr>
 
 <tr>
 <td>Release Date</td>
 <td colspan=5><select name="MOV_RELEASE_Y" style="width:60px;" />
 <option value="">(년)</option>
 <%for(int i=2014;i>=1900;i--){%>
 <option value=<%=i %>><%=i %></option><%}%>
 </select>
					
 <select name="MOV_RELEASE_M" style="width:50px;" />
 <option value="">(월)</option>
 <%for(int i=1;i<=12;i++){%>
 <option value=<%=i %>><%=i %></option><%}%>
 </select>
      
 <select name="MOV_RELEASE_D" style="width:50px;" />
 <option value="">(일)</option>
 <%for(int i=1;i<=31;i++){%>
 <option value=<%=i %>><%=i %></option><%}%>
 </select>
 </td>
 </tr>
 
 <tr>
 <td>Genre</td>
 <td><select name="GEN_NUMBER" style="width:100px;">
 <option value="">(장르)</option>
 <option value=0>SF</option>
 <option value=1>드라마</option>
 <option value=2>액션</option>
 <option value=3>미스터리</option>
 <option value=4>판타지</option>
 <option value=5>코미디</option>
 <option value=6>스릴러</option>
 <option value=7>로맨스</option>
 <option value=8>다큐멘터리</option>
 <option value=9>가족</option>
 <option value=10>공포</option>
 <option value=11>모험</option>
 </select>
 </td>
 
 <td>Rate</td><td><select name="MOV_AGE" style="width:140px;">
 <option value="">(등급)</option>
 <option value=0>전체 관람가</option>
 <option value=1>7세이상 관람가</option>
 <option value=2>12세이상 관람가</option>
 <option value=3>15세이상 관람가</option>
 <option value=4>청소년 관람불가</option>	
 </select>
 </td>
 		
 <td>Nation</td>
 <td><select name="NAT_NUMBER" style="width:100px;">
 <option value="">(국가)</option>
 <option value=0>대한민국</option>
 <option value=1>미국</option>
 <option value=2>영국</option>
 <option value=3>일본</option>
 <option value=4>중국</option>
 <option value=5>인도</option>
 <option value=6>프랑스</option>
 <option value=7>독일</option>
 <option value=8>캐나다</option>
 </select>
 </td>
 </tr>
 
 <tr>
 <td>Time table</td>
 <td><select name="THE_NUMBER" style="width:100px;">
 <option value="">(상영관)</option>
 <option value=0>1관</option>
 <option value=1>2관</option>
 <option value=2>3관</option>
 <option value=3>4관</option>
 </select>
 </td>
 </tr>
 
 <tr>
 <td>Running Time</td>
 <td colspan=5><input type="text" name="MOV_RUNNINGTIME" value="<%=MOV_RUNNINGTIME%>">
 </td>
 </tr>
 
 <tr>
 <td>Story</td>
 <td colspan=5>
 <div style="overflow: scroll; width:500px; height: 200px; padding: 10px; ">
 <input type="text" name="MOV_STORY" value="<%=MOV_STORY%>" style="height:200px; width:500px">
 </div>
  </td>
 </tr>
 
 
 <tr>
 <td>Image</td>
 <td colspan=5><input type="text" name="MOV_IMAGE" value="<%=MOV_IMAGE%>">
 </td>
 </tr>
 </table>
 
 <br>
 <br>
 
 <center>
 <br><br>
 <input type="submit"  class="testbutton" value="수정하기">
 <input type="reset" class="testbutton" value="취소">	
 </center>
 </form>

<%
} catch(Exception e){
	e.printStackTrace();
}
%>
  
 </div>
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
            <span>&copy; 2012. <a href="managerindex.jsp">모현극장</a> all rights reserved</span> </div>
      </div>
   </div>
   </font>
</body>
</html>
</body>
</html>