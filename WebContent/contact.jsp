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
<div class="featured">
<ul>
<br><br>
<center>
<table >
<tr>
<td>Ahn Chang</td>
<td>ahn3@nate.com</td>
</tr>
            
<tr>
<td>Park Jihyun</td>
<td>pjh3753@naver.com</td>
</tr>
            
<tr>
<td>Ahn Sohyeon</td>
<td>sohyun3260@naver.com</td>
</tr>
            
<tr>
<td>Han Seohyeon</td>
<td>shhan94@naver.com</td>
</tr>
</table>
</ul>
</center>
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