<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��������</title>
</head>

<body>
<font face="����" color="#FFFFFF">
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
<a href="index.jsp"><img src= "images/mohyeon.png" alt=""></a>
<ul class="navigation">
<div id="topMenu" >
<ul>
<li class="topMenuLi">
<a class="menuLink" href="information.jsp">INFORMATION</a>
</li>
   
<li class="topMenuLi">
<a class="menuLink">RESERVATION</a>
<ul class="submenu">
<li><a href="login.jsp" class="submenuLink">MOVIE</a>
<a href="login.jsp" class="submenuLink">DATE</a></li>
</ul>
</li>
   
<li class="topMenuLi">
<a class="menuLink" href="login.jsp">LOGIN</a>
</li>
      
<li class="topMenuLi">
<a class="menuLink" href="join.jsp">JOIN</a>
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
    String sql = "Select * from MOVIE order by THE_NUMBER"; 
    pstmt = con.prepareStatement(sql); 
    rs = pstmt.executeQuery();
    String[] MOV_IMAGE = new String[4];
   String[] MOV_IMAGE2 = new String[4];
   String[] MOV_IMAGE3 = new String[4];
   int[] THE_NUMBER = new int[4];
   
   for(int i=0;i<4 && rs.next();i++)
   {
       MOV_IMAGE[i] = rs.getString("MOV_IMAGE");
       MOV_IMAGE2[i] = "images/"+MOV_IMAGE[i]+".png";
       MOV_IMAGE3[i] = "images/"+MOV_IMAGE[i]+"curve.png";
       System.out.println(MOV_IMAGE2[i] + " " + MOV_IMAGE3[i]);
   }
         
       %>
       <li>
<a href="information.jsp"><img src="<%=MOV_IMAGE3[0]%>" onmouseover="this.src='<%=MOV_IMAGE2[0]%>';" onmouseout="this.src='<%=MOV_IMAGE3[0]%>';" alt=""></a>
</li>

<li>
<a href="information.jsp"><img src="<%=MOV_IMAGE3[1]%>" onmouseover="this.src='<%=MOV_IMAGE2[1]%>';" onmouseout="this.src='<%=MOV_IMAGE3[1]%>';" alt=""></a>
</li>

<li>
<a href="information.jsp"><img src="<%=MOV_IMAGE3[2]%>" onmouseover="this.src='<%=MOV_IMAGE2[2]%>';" onmouseout="this.src='<%=MOV_IMAGE3[2]%>';" alt=""></a>
</li>

<li>
<a href="information.jsp"><img src="<%=MOV_IMAGE3[3]%>" onmouseover="this.src='<%=MOV_IMAGE2[3]%>';" onmouseout="this.src='<%=MOV_IMAGE3[3]%>';" alt=""></a>
</li>
       <%


}
catch(Exception e){
     out.println(e);
     out.println("����");
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
<span>&copy; 2012. <a href="index.jsp">��������</a> all rights reserved</span> </div>
</div>
</div>
</font>

</body>
</html>

</body>
</html>