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
	System.out.println("try");
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    System.out.println("try1");
    con = DriverManager.getConnection(url, user, password);
    System.out.println("try2");
    String sql = "Insert into SEAT values(?,?,?,?,?)";
    System.out.println("try3");
    pstmt = con.prepareStatement(sql); 
    System.out.println("try4");
    
    for(int j=0;j<10;j++){
			for(int i=0;i<10;i++){
				String jj = Integer.toString(j);
				String ii = Integer.toString(i);
		System.out.println(jj+ii);
	 pstmt.setString(1, jj+ii);
	 pstmt.setInt(2,1);
	 pstmt.setInt(3, 1);
	 pstmt.setString(4, "1");
	 pstmt.setString(5, "1972");
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
 pstmt.setString(5, "1972");
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
pstmt.setString(5, "1972");
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
pstmt.setString(5, "1972");
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
pstmt.setString(5, "1971");
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
pstmt.setString(5, "1971");
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
pstmt.setString(5, "1971");
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
pstmt.setString(5, "1971");
int result = pstmt.executeUpdate();

}
}
%>
    <%
    } catch(Exception e){
     out.println(e);
     out.println("  다음 기회에...");
    }
    %>
    
</body>
</html>