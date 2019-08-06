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
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:sqlserver://localhost:1433;DataBaseName=TeamProject"; 
String user = "sa";
String password = "7988";
try{
	 
%>
 
 <br><br>
 <form action="addmovieInsert.jsp" method="post" >
 <table>
 <tr>
 <td>Title</td>
 <td colspan=5><input type="text" name="MOV_NAME" placeholder="영화제목을 입력해주세요."></td>
 </tr>
 
 <tr>
 <td>Director</td>
 <td colspan=5><input type="text" name="MOV_DIRECTOR" placeholder="영화감독을 입력해주세요."></td>
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
 <td>Timetable</td>
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
 <td colspan=5><input type="text" name="MOV_RUNNINGTIME" placeholder="러닝타임을 입력해주세요.">
 </td>
 </tr>
 
 <tr>
 <td>Story</td>
 <td colspan=5><input type="text" name="MOV_STORY" rows="10" cols="90" placeholder="영화줄거리를 입력해주세요.">
 </td>
 </tr>
 
 <tr>
 <td>Image</td>
 <td colspan=5><input type="text" name="MOV_IMAGE" placeholder="사진을 등록해주세요.">
 </td>
 </tr>
 
 </table>
 
 <br>
 <br>
 
 <center>
 <br><br>
 <input type="submit"  class="testbutton" value="확인">
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
</html>