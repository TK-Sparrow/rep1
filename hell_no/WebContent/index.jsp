<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View List</title>
<style>

body{
background-color:tomato;
text-align:center;
}
container,.table{
border:1px solid black;
}
.card1{
border-shadow: 10px 8px 8px 4px blue;
width:70%
trasition: 0.4s;
}
.card{
background:white;
margin:20px;
border-shadow: 1px 4px 8px 0 black;
trasition: 0.4s;
width:60%;
height:200px;
}
.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
width:35%;
  padding: 2px 16px;
}
</style>
</head>
<body>
<header>
<%@include file="header.jsp" %>
</header>
<br><%-- 
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%!
int temp=0;
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
/* Cookie a[]=request.getCookies();
for(int i=0;i<a.length;i++){
	if(a[i].getName().equals("uname")){
		temp=1;
		break;
	}
}
if(temp==0){
	response.sendRedirect("Login.jsp");
} */

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
 --%>
 
 
 
 <form>
 <input style="width:300px;height:30px;text-align:center" type="text" placeholder="search by user id">
 <input  type="submit" value="Search">
 <center>
 <table>
 <tr>
 <th style="padding:10px;">
 <h4 style="color:white">Location:</h4>
<select name="location" >
<option selected>all</option>
<option>chennai</option>
<option>hyderabad</option>
<option>pune</option>
<option>banglore</option>
</select>
 </th>
 <th style="padding:10px;">
 <h4 style="color:white">Experience:</h4>
<select name="Experience" >
<option selected>0</option>
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>4+</option>
</select>
 </th>
 <th style="padding:10px;">
 <h4 style="color:white">Tier:</h4>
<select name="Tier" >
<option selected>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
</select>
</th>
 </tr>
 </table>
 </center>
 
 </form>
 <br><br>
 <center>
 <div class="card1">
 
 <% for(int i=0;i<5;i++){
	 %>
 <div class="card">
 <table>
 	<tr class="table">
 	<th >
 	<img style="width:30%;height:180px" src="emp_icon.png">
 	</th>
 	<th class="container">
 	NAME <br><br>
 	I'D <br><br>
 	DESIGNATION <br><br>
 	LOCATION <br><br>
 	EXPERIENCE <br><br>
 	</th><th class="container">
 	 kannan<br><br>
 	 09877<br><br>
 	 Assocsiative engg<br><br>
 	 chennai<br><br>
 	 3 year<br><br>
 	</th>
 	</tr>
 </table>
 </div>
 <%
 } %>
 </div>
 </center>
</body>
</html>