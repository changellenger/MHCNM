<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ȭ����</title>
</head>

<body>
<font face="����" color="#FFFFFF">
<style>
  table {
    width: 40%;
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
	 String sql = "Select * from CUSTOMER";
	 pstmt = con.prepareStatement(sql);
	 rs = pstmt.executeQuery();
%>

</center>
<form action="joinCUSTOMER.jsp" method="post" >
<center>
<br><br>
<table>
	<tr>
	<td>Name</td>
	<td><input type="text" name="CUS_NAME" placeholder="�̸��� �Է����ּ���."><br></td>
	</tr>
	
	<tr>
	<td>ID</td>
	<td><input type="text" name="CUS_ID" placeholder="���̵� �Է����ּ���."><br></td>
	<tr>
	
	<tr>
	<td>Password</td>
	<td><input type="password" name="CUS_PASSWORD" placeholder="��й�ȣ�� �Է����ּ���."><br></td>
	</tr>
	
	<tr>
	<td>Birth</td>
	<td><select name="CUS_YEAR" style="width:60px;" />
		<option value="">(��)</option>
 		<%for(int i=2014;i>=1900;i--){%>
   		<option value=<%=i %>><%=i %></option><%}%>
 		</select>
					
		<select name="CUS_MONTH" style="width:50px;" />
		<option value="">(��)</option>
 		<%for(int i=1;i<=12;i++){%>
   		<option value=<%=i %>><%=i %></option><%}%>
 		</select>
      
		<select name="CUS_DATE" style="width:50px;" />
		<option value="">(��)</option>
 		<%for(int i=1;i<=31;i++){%>
   		<option value=<%=i %>><%=i %></option><%}%>
 		</select>
 		</td>
 		</tr>
					
		<tr>
		<td>Address</td>
		<td><input type="text" name="CUS_ADDRESS" placeholder="�ּҸ� �Է����ּ���."><br></td>
		</tr>
					
		<tr>
		<td>Phone</td>
		<td><input type="text" name="CUS_PHONE" placeholder="(-)�� �����ϰ� �Է����ּ���."><br></td>
		</tr>
		</table>

<br><br>										
<input type="submit"  class="testbutton" value="Ȯ��">
<input type="reset" class="testbutton" value="���">			

</form>
</center>
<br><br>

<%
}
catch(Exception e){
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
<span>&copy; 2012. <a href="index.jsp">��������</a> all rights reserved</span> </div>
</div>
</div>
</font>
</body>
</html>
</body>
</html>