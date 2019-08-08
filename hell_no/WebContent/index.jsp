<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View List</title>
</head>
<body>


<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%!
ResultSet rs;
String loc="all";
String sql;
public void retrive(){
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "user_id", "hello");
Statement st=con.createStatement();  
rs=st.executeQuery(sql);
}
catch(Exception e){
	System.out.println("error: "+e.toString());
}
}
%>
<form action="#">
Location:
<select name="location" >
<option selected>all</option>
<option>chennai</option>
<option>hyderabad</option>
<option>pune</option>
<option>banglore</option>
</select><br><br>
<input type="submit" >
</form>

<br>
<%
Cookie a[]=request.getCookies();
for(int i=0;i<a.length;i++){
	out.println(a[i].getName()+" : "+a[i].getValue()+"<br>");
}

loc=request.getParameter("location");

if(loc == null || loc.equals("all")){
	sql="select * from empdetails";
}
else{
sql="select * from empdetails where location='"+loc+"'";
} 
retrive();
	while(rs.next()) {
		%>
		
		<a href="test.jsp?uname=<%=rs.getString(1)%>"><%=rs.getString(1)%></a><br><br>
		<%
	
}
%>

</body>
</html>