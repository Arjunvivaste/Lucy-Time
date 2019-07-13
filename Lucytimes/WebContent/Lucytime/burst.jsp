<!-- loginAction.jsp -->

<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*"%>

<%
	Statement st=null;
	Connection con=null;
	ResultSet rs=null;

 
   // JDBC driver name and database URL
   	  final String DB_URL  = "jdbc:mysql://localhost:3306/redrock";
	 //  Database credentials
      final String DB_USER = "Lucy";
      final String DB_PASS = "Frankfurt";
	
	String EmailID = request.getParameter("EmailID");
	String Password = request.getParameter("Password");

	try{
 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/redrock","Lucy","frankfurt");
	st = con.createStatement();

	String QueryString = "select EmailID,Password from registration where EmailID='"+EmailID+"' and Password = '"+Password+"'";
	rs = st.executeQuery(QueryString);
	if(rs.next()){
		
		String site = new String("index.html");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
	}
	else
	{
		String site = new String("log.html");
    	response.setStatus(response.SC_MOVED_TEMPORARILY);
   		response.setHeader("Location", site);
	}
	}
	
	catch (Exception e){
  	out.print(e);
	}
	finally{
	st.close();
	rs.close();
	con.close();
	}
	
%>