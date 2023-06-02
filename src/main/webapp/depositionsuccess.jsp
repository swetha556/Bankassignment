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
int account_number = Integer.parseInt(request.getParameter("account_number"));
int amount = Integer.parseInt(request.getParameter("amount"));
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/app2","root","root");
	PreparedStatement stmt = conn.prepareStatement("insert into details1 values(?,?)");
	stmt.setInt(1, account_number);
	stmt.setInt(2, amount);
	int i=stmt.executeUpdate();
	if(i>0){
		out.println("Details entered successfully");
		out.println("<html><body>");
		out.println("<a href='showdetails.jsp'>show records</a>");
		out.println("</body></html>");
	}
	else{
		out.println("login Failed");
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