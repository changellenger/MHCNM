<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%
    String checkId = null;
    checkId = (String)session.getAttribute("s_Id");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><%=checkId%>님 안녕하세요</title>
</head>
<body>
<font face="돋움">
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

<script>
	function gettext(date){
		var gettext = document.getElementById("date")
		alert(gettext.value);
	}
	
</script>
<script>function imgCbox(N, tabstop)
 					{
 				        var objs, cboxes, Img, Span, A;

 				        objs = document.getElementsByTagName("INPUT");
 				        if (N == undefined) return false;
 				        if (tabstop == undefined) tabstop = true;

 				        for (var i=0; i < objs.length; i++) {
 				                if (objs[i].type != "checkbox" || objs[i].name != N) continue;
 				                
 				                if (imgCbox.Objs[N] == undefined) {
 				                        imgCbox.Objs[N] = [];
 				                        imgCbox.Imgs[N] = [];
 				                        imgCbox.ImgObjs[N] = [];
 				                }
 				                
 				                var len = imgCbox.Objs[N].length;
 				                imgCbox.Objs[N][len] = objs[i];
 				                imgCbox.Imgs[N][len] = {};

 				                // for image cache
 				                (Img = new Image()).src = objs[i].getAttribute("onsrc");
 				                imgCbox.Imgs[N][len]["on"] = Img;

 				                (Img = new Image()).src = objs[i].getAttribute("offsrc");
 				                imgCbox.Imgs[N][len]["off"] = Img;

 				                // image element
 				                Img = document.createElement("IMG");
 				                Img.src = objs[i].checked?objs[i].getAttribute("onsrc"):objs[i].getAttribute("offsrc");
 				                Img.style.borderWidth = "0px";
 				                Img.onclick = new Function("imgCbox.onclick('"+N+"','"+len+"')");
 				                imgCbox.ImgObjs[N][len] = Img;

 				                // anchor element for tab stop
 				                A = document.createElement("A");
 				                if (tabstop) {
 				                        A.href = "javascript:;";
 				                        A.onkeypress = new Function("evt", "if(evt==undefined)evt=event;if(evt.keyCode==32||evt.keyCode==0){ imgCbox.onclick('"+N+"','"+len+"'); }");
 				                }
 				                A.style.borderWidth = "0px";
 				                A.appendChild(Img);

 				                // insert object
 				                Span = objs[i].parentNode;
 				                Span.style.display = "none";
 				                Span.parentNode.insertBefore(A, Span);
 				        }
 				}
 				imgCbox.onclick = function(N, idx) {
 				        var C = imgCbox.Objs[N][idx];
 				        var I = imgCbox.ImgObjs[N][idx];

 				        C.checked = !C.checked;
 				        I.src = imgCbox.Imgs[N][idx][C.checked?"on":"off"].src;
 				        
 				        // fire event
 				        if (C.onclick != undefined || C.onclick != null) C.onclick();
 				}
 				imgCbox.Objs = {};
 				imgCbox.Imgs = {};
 				imgCbox.ImgObjs = {};
 				</script>
<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<head>
	<title>모현극장</title>
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
<a href="index.jsp"><img src= "images/mohyeon.png"></a>
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
		<div id="body">
			<div class="featured" style=" margin: 50px 0px 0px 300px;">
			<p><input type="image" src="images/screen.jpg"  name="screen"  width="450" height="30"></p><br /><br />
 						<form action="seatupdate.jsp">
 						
 						<%
 						
 						
 						Connection con = null;
 						PreparedStatement pstmt = null;
 						ResultSet rs = null;

 						String url = "jdbc:sqlserver://localhost:1433;DataBaseName=TeamProject"; 
 						String user = "sa";
 						String password = "7988";

 						String moviee[] = request.getParameterValues("moviemovie");
 						String date = request.getParameter("date2");
 						String timett[] = request.getParameterValues("timet");
 						String movie=null;
 						String timet=null;
 						
 						if (moviee != null && moviee.length != 0) {
 							for (int i = 0; i < moviee.length; i++) {
 							movie =moviee[i];
 							timet =timett[i]; 
 							
 								}
 							}
 						%>
 						<input type="hidden" value="<%=date %>" name="date">
 						<input type="hidden" value="<%=movie %>" name="movie">
						<input type="hidden" value="<%=timet %>" name="timet">
						 		
 						<%
 						  System.out.println("sitres:"+ movie +","+  timet );
 						try {
 						    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
 						    con = DriverManager.getConnection(url, user, password);
 						    String sql = "Select * from SEAT WHERE THE_NUMBER='"+movie+"' AND TAB_NUMBER='"+timet+"' ";
 						    System.out.println(sql);
 						    pstmt = con.prepareStatement(sql); 
 						    rs = pstmt.executeQuery();
 						   int[] possible = new int[801];
 						   int p=0;
 						   while(rs.next()){
 							  possible[p] = rs.getInt("SEAT_POSSIBLE");
 							  p++;
 						   }
 						%>
 							<%
				 			int k =0;
 							for(int j=0;j<10;j++){%><p><% 
	 					 	for(int i=0;i<10;i++){%>
   					<%if(possible[k]==1){
   					%><span><input type="checkbox" name="cbox" value="<%=j %><%=i %>" offsrc="images/<%=i+1%>.png" onsrc="images/red.png" /> </span>
 					<%
 						k++;
   					}else{%>
   						<span><input type="checkbox" name="booked" value="<%=j %><%=i %>" offsrc="images/gray.png" onsrc="images/gray.png" /> </span>
 					<%	k++;
 					  }
					}
				%></p>
				<%}
 					System.out.println(date);
 					System.out.println("=======SITERS 끝======");
 						} catch(Exception e){
 						 out.println(e);
 						 out.println("실패");
 						}
 					%>	
 					<script>imgCbox("cbox");</script>
 					<script>imgCbox("booked");</script>
 					<script>gettext("date2");</script>
 					  <input type="submit" class=testbutton value="확인">
 					  <script>
 					 
 					</script>
 					</form>
			</div>
		</div>
		</div>
	</body>
	</font>
</body>
</html>