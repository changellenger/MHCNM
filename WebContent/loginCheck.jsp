<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
    String CUS_ID = request.getParameter("ID");
    String CUS_PASSWORD = request.getParameter("password");
   
    /* String sql = "Select * from CUSTOMER where CUS_ID = "+CUS_ID+" and CUS_PASSWORD = "+CUS_PASSWORD; 
    pstmt = con.prepareStatement(sql); 
    rs = pstmt.executeQuery(); */
    
    String CheckID =null;
    String CheckPW =null;

    String sql = "Select CUS_ID, CUS_PASSWORD from CUSTOMER where CUS_ID = '" + CUS_ID + "'";
    pstmt = con.prepareStatement(sql);
    rs = pstmt.executeQuery(); 
   
    String one = "manager";
    String two = "111";
    
    while(rs.next()) {
       CheckID = rs.getString("CUS_ID");
        CheckPW = rs.getString("CUS_PASSWORD");
     
        if(CUS_ID.equals(CheckID) && CUS_PASSWORD.equals(CheckPW)) {
           if(CUS_ID.equals(one) && CUS_PASSWORD.equals(two)) {
              session.setAttribute("s_Id", CUS_ID);
                   %>
                   <jsp:forward page="managerindex.jsp" />
                   <%
                   }
           else {
              session.setAttribute("s_Id", CUS_ID);
              %>
              <jsp:forward page="loginOk.jsp" />
              <%
              }   
        }
        
        else
        {
           %>
           <script>
           alert("아이디와 비밀번호를 확인해주세요");
           location.href="login.jsp";
           </script>
         
          <%break;
        }
    }
    
}

catch(Exception e){
   e.printStackTrace();
}
%>