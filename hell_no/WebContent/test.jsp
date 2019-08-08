<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %> 
<%!
ResultSet rs;
String n;
public void retrive(String name){
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "user_id", "hello");
Statement st=con.createStatement();
rs=st.executeQuery("select * from empdetails where id="+name+"");

}
catch(Exception e){
	System.out.println("error: "+e.toString());
}
}
%>
<%
n=request.getParameter("uname");
out.println(n+"<br>");
retrive(n);
{
	rs.next();
	//while(rs.next())
	{
		out.println("<br>Id :"+rs.getString(1));
		out.println("<br>name :"+rs.getString(2));
		out.println("<br>Exp :"+rs.getString(3));
		out.println("<br>Location :"+rs.getString(4));
	}
}
Cookie ck[]=request.getCookies();  
for(int i=0;i<ck.length;i++){  
 out.print("<br>"+ck[i].getName()+" "+ck[i].getValue());//printing name and value of cookie  
}  

%>
</body>
</html> 
