<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
</head>

<body>
<font face="돋움" color="#FFFFFF">
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
            <br>
            <Br>
            
            <form role="form" method="post" action="loginCheck.jsp">
                           <table>
                                <div class="form-group">
                                <tr>
               <td>ID</td>
                             <td>
                                    <input class="form-control" placeholder="아이디를 입력해주세요." name="ID" type="ID" autofocus>
                                    </td> 
                                    </tr>
                                </div>
                                <div class="form-group">
                                 
                                <tr>
               <td>Password</td>
                              <td>
                                    <input class="form-control" placeholder="비밀번호를 입력해주세요." name="password" type="password" value="">
                               </td>
                               </tr>
                                </div>
                                
                                
                            </table>
            
            <br><br>
               <input type="submit" class="testbutton" value="확인"></a>
               <input type="reset" class="testbutton" value="취소">
               </form>
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
<span>&copy; 2012. <a href="index.jsp">모현극장</a> all rights reserved</span> </div>
</div>
</div>
</font>

</body>
</html>

</body>
</html>