<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>

<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>


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
 				imgCbox.ImgObjs = {};</script>
 				
 		
<script>

jQuery(function($){

    $.datepicker.regional['ko'] = {closeText: '닫기',prevText: '이전달',nextText: '다음달',currentText: '오늘',monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],dayNames: ['일','월','화','수','목','금','토'],dayNamesShort: ['일','월','화','수','목','금','토'],dayNamesMin: ['일','월','화','수','목','금','토'],weekHeader: 'Wk',dateFormat: 'yy-mm-dd',firstDay: 0,isRTL: false,showMonthAfterYear: true,yearSuffix: ''};

    $.datepicker.setDefaults($.datepicker.regional['ko']);

    $('#date2').datepicker(
    		{showOn: 'both',
    			buttonText: "Calendar",
    			changeMonth: true,
    			changeYear: true,
    			showButtonPanel:true,
    			yearRange: 'c-99:c+99',
    			constrainInput: true,
    			maxDate: '+1y',
    			beforeShowDay: noBefore  });

    function noBefore(date){
	    if (date < new Date())
	        return [false];
	    return [true];
	}
});</script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>영화예매</title>
</head>

<script>
function changeDate(frm){
	frm.method="post";
	frm.submit();
}
</script>
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
	<!DOCTYPE html>
	<!-- Website template by freewebsitetemplates.com -->
	<head>
		<meta  charset="utf-8">
		<link href="css/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<div id="page">
		<div id="header">
			<div>
			<a href="managerindex.jsp"><img src= "images/mohyeon.png"></a>
               <ul class="navigation">
            <div id="topMenu" >
      <ul>   
      <li class="topMenuLi">
               <a class="menuLink" href="managerreservation2.jsp">PRESENTCONDITION</a>
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
		
		
		<form action="presentcondition.jsp" >
				
				
				<!-- 영화선택 -->
			
				<div 
					style="border-top:1px solid;
					margin: 30px 10px 0px 330px;
					 border-bottom:1px solid; 
					 border-left:1px solid;
					  border-right:1px solid; 
					  padding:10px;
					  width:18%;float:left; ">
					<table>
					<tr>
					<img src="images/movie.png" width=100% height="40" alt="">
					</tr>
					</table>
					
					<p><span><input type="checkbox" name="moviemovie" value="1" offsrc="images/realinter.png" onsrc="images/realinter2.png"   /> </span></p>
					<p><span><input type="checkbox" name="moviemovie" value="2" offsrc="images/realcastle.png" onsrc="images/realcastle2.png" /> </span></p>
					<p><span><input type="checkbox" name="moviemovie" value="3" offsrc="images/realfury.png" onsrc="images/realfury2.png"  /> </span></p>
					<p><span><input type="checkbox" name="moviemovie" value="4" offsrc="images/realfasion.png" onsrc="images/realfasion2.png"  /> </span></p>
					
				</div>
				<script>imgCbox("moviemovie");</script>
  

		<!-- 날짜선택 -->

			
			<div  style="border-top:1px solid; border-bottom:1px solid; border-left:1px solid; border-right:1px solid; padding:10px; width:18%; float:left;
				margin: 30px 10px 0px 0px;">
				<tr>
				<img src="images/date.jpg" width=100% height="40" alt="">
				<p><input type="text" name="date2" id="date2" value="" style="border:1px solid" onchange="changeDate(time)")><br /></p>
				<p>　</p>
				<p>　</p>
				<p>　 </p>
				<p>　</p>
				<p>　</p>
				</tr>
			</div>
		<!-- 시간선택 -->
					<div  style="border-top:1px solid;
					 border-bottom:1px solid;
					  border-left:1px solid;
					   border-right:1px solid;
					    padding:10px; width:17%; float:left;
						margin: 30px 10px 0px 0px;">
						<tr>
						<img src="images/time.png" width=100% height="40" alt="">
						<span><input type="checkbox" name="timet" value="1" offsrc="images/0800.png" onsrc="images/a0800.png"   /> </span>
						<span><input type="checkbox" name="timet" value="2" offsrc="images/1130.png" onsrc="images/a1130.png"  /> </span>
						<span><input type="checkbox" name="timet" value="3" offsrc="images/1500.png" onsrc="images/a1500.png" /> </span>
						<span><input type="checkbox" name="timet" value="4" offsrc="images/1830.png" onsrc="images/a1830.png" /> </span>
						<span><input type="checkbox" name="timet" value="5" offsrc="images/2200.png" onsrc="images/a2200.png"  /> </span>
						<script>imgCbox("timet");</script>
						</tr>
						
						<center>
						<button class="testbutton" >확인</button></center>
						</form>
						</div>
		
		</body>
	</html>
	</body>
	</html>