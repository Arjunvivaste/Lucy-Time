
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>regjsp</title>
</head>
<body>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%



String EmailID=request.getParameter("Email ID");
session.putValue("Email ID",EmailID);
String Firstname=request.getParameter("First name");
String LastName=request.getParameter("Last Name");
String Password=request.getParameter("Password");
String Mobilenumber=request.getParameter("Mobile number");
String Address=request.getParameter("Address");
String DOB=request.getParameter("Date of birth");


Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/redrock","Lucy","frankfurt");
Statement st=con.createStatement();
ResultSet rs;
String sql="insert into registration values('"+Firstname+"','"+LastName+"','"+Password+"','"+EmailID+"','"+Address+"','"+Mobilenumber+"','"+DOB+"')";
st.executeUpdate(sql);


out.println("Registered");

%>
<a href="Login.html">Login</a><br/><br/>
<a href="index.html">Home</a>

</body>
</html>

