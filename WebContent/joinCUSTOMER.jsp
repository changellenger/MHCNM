<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");

String CUS_NAME = request.getParameter("CUS_NAME");
String CUS_ID = request.getParameter("CUS_ID");
String CUS_PASSWORD = request.getParameter("CUS_PASSWORD");
int CUS_YEAR = Integer.parseInt(request.getParameter("CUS_YEAR"));
int CUS_MONTH = Integer.parseInt(request.getParameter("CUS_MONTH"));
int CUS_DATE = Integer.parseInt(request.getParameter("CUS_DATE"));
String CUS_ADDRESS = request.getParameter("CUS_ADDRESS");
String CUS_PHONE = request.getParameter("CUS_PHONE");

Connection con = null;
Connection conn = null;
PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;
ResultSet rs = null;

String url = "jdbc:sqlserver://localhost:1433;DataBaseName=TeamProject"; 
String user = "sa";
String password = "7988";

try{
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    con = DriverManager.getConnection(url, user, password);
    conn = DriverManager.getConnection(url, user, password);
    
    String sql2="select CUS_ID from CUSTOMER where CUS_ID = '"+CUS_ID+"'";
    pstmt2=conn.prepareStatement(sql2);
    rs = pstmt2.executeQuery();
    int i=0;
    while(rs.next())
    {
    	i=1;
    	%>
        <script>
        alert("이미 사용중인 아이디 입니다.");
        location.href="join.jsp";
        </script>
        <%  
        break;
    }
    if(i==0){
          String sql="Insert into CUSTOMER values(?,?,?,?,?,?,?,?)";
          pstmt=con.prepareStatement(sql);
          pstmt.setString(1, CUS_NAME);
          pstmt.setString(2, CUS_ID);
          pstmt.setString(3, CUS_PASSWORD);
          pstmt.setInt(4, CUS_YEAR);
          pstmt.setInt(5, CUS_MONTH);
          pstmt.setInt(6, CUS_DATE);
          pstmt.setString(7, CUS_ADDRESS);
          pstmt.setString(8, CUS_PHONE);

          int result = pstmt.executeUpdate();
      %>
      <script>
      alert("회원가입이 완료 되었습니다.");
      location.href="login.jsp";
      </script>
      <%   
      
    }
   // ----------
    
           
}catch(Exception e){
   e.printStackTrace();
}
%>
</body>
</html>