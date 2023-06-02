<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/app2","root","root");
	PreparedStatement stmt = conn.prepareStatement("select * from user2");
	ResultSet rs = stmt.executeQuery();
	out.println("showing details");
	if(rs.next()){
		out.println("<html><body>");
		out.println("\n" + rs.getString(1)+":"+rs.getString(2));
		out.println("</body></html>");
	}
	
	PreparedStatement stmt1 = conn.prepareStatement("select * from details1");
    ResultSet rs1 = stmt1.executeQuery();
    if(rs1.next()){

        out.println("<html><body>");
        out.println("\n"+rs1.getInt(1)+"-"+rs1.getInt(2));
        out.println("</body></html>");

    }
	else{
		out.println("Amount Deposition Failed");
		out.println("<html><body>");
		out.println("<a href='home.html'>Home</a>");
		out.println("</body></html>");
	}
	
}catch(ClassNotFoundException ex) {
	ex.printStackTrace();
}catch(SQLException ex) {
	ex.printStackTrace();
}
%>
</body>
</html>