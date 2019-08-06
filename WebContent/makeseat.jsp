<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:sqlserver://localhost:1433;DataBaseName=TeamProject"; 
String user = "sa";
String password = "7988";



try {
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
    con = DriverManager.getConnection(url, user, password);
    String sql = "Insert into SEAT values(?,?,?,?,?,?)";
    pstmt = con.prepareStatement(sql);
    
    System.out.println("TRY!");
    for(int j=0;j<10;j++){
			for(int i=0;i<10;i++){
				String jj = Integer.toString(j);
				String ii = Integer.toString(i);
	 pstmt.setString(1, jj+ii);
	
	 pstmt.setInt(2,1);
	 pstmt.setInt(3, 1);
	 pstmt.setString(4, "1");
	 pstmt.setString(5, "2014-12-30");
	 pstmt.setString(6, "NULL");
	 int result = pstmt.executeUpdate();
			}
    }
    
    
    for(int j=0;j<10;j++){
		for(int i=0;i<10;i++){
			String jj = Integer.toString(j);
			String ii = Integer.toString(i);
 pstmt.setString(1, jj+ii);
 pstmt.setInt(2,2);
 pstmt.setInt(3, 1);
 pstmt.setString(4, "1");
 pstmt.setString(5, "2014-12-30");
 pstmt.setString(6, "NULL");
 int result = pstmt.executeUpdate();
		}
} 
    for(int j=0;j<10;j++){
	for(int i=0;i<10;i++){
		String jj = Integer.toString(j);
		String ii = Integer.toString(i);
pstmt.setString(1, jj+ii);
pstmt.setInt(2,1);
pstmt.setInt(3, 1);
pstmt.setString(4, "2");
pstmt.setString(5, "2014-12-30");
pstmt.setString(6, "NULL");
int result = pstmt.executeUpdate();
	}
} 
for(int j=0;j<10;j++){
	for(int i=0;i<10;i++){
		String jj = Integer.toString(j);
		String ii = Integer.toString(i);
pstmt.setString(1, jj+ii);
pstmt.setInt(2,2);
pstmt.setInt(3, 1);
pstmt.setString(4, "2");
pstmt.setString(5, "2014-12-30");
pstmt.setString(6, "NULL");
int result = pstmt.executeUpdate();
	}
}

// 시간 2

for(int j=0;j<10;j++){
	for(int i=0;i<10;i++){
		String jj = Integer.toString(j);
		String ii = Integer.toString(i);
pstmt.setString(1, jj+ii);
pstmt.setInt(2,1);
pstmt.setInt(3, 1);
pstmt.setString(4, "1");
pstmt.setString(5, "2014-12-31");
pstmt.setString(6, "NULL");
int result = pstmt.executeUpdate();

	}
}


for(int j=0;j<10;j++){
for(int i=0;i<10;i++){
	String jj = Integer.toString(j);
	String ii = Integer.toString(i);
pstmt.setString(1, jj+ii);
pstmt.setInt(2,2);
pstmt.setInt(3, 1);
pstmt.setString(4, "1");
pstmt.setString(5, "2014-12-31");
pstmt.setString(6, "NULL");
int result = pstmt.executeUpdate();
}
} 
for(int j=0;j<10;j++){
for(int i=0;i<10;i++){
String jj = Integer.toString(j);
String ii = Integer.toString(i);
pstmt.setString(1, jj+ii);
pstmt.setInt(2,1);
pstmt.setInt(3, 1);
pstmt.setString(4, "2");
pstmt.setString(5, "2014-12-31");
pstmt.setString(6, "NULL");
int result = pstmt.executeUpdate();
}
} 
for(int j=0;j<10;j++){
for(int i=0;i<10;i++){
String jj = Integer.toString(j);
String ii = Integer.toString(i);
pstmt.setString(1, jj+ii);
pstmt.setInt(2,2);
pstmt.setInt(3, 1);
pstmt.setString(4, "2");
pstmt.setString(5, "2014-12-31");
pstmt.setString(6, "NULL");
int result = pstmt.executeUpdate();

}
}

	
%>
    

    <%
    } catch(Exception e){
     out.println(e);
     out.println("실패");
    }
    %>
    
</body>
</html>