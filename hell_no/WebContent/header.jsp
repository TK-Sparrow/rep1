<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
* {box-sizing: border-box;}

body { 
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.header {
  overflow: hidden;
  background-color: #f1f1f1;
  padding: 20px 10px;
}

.header a {
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px; 
  line-height: 25px;
  border-radius: 4px;
}

.header a.logo {
  font-size: 25px;
  font-weight: bold;
}

.header .logout:hover {
  background-color: #ddd;
  color: black;
}
.header-right {
  float: right;
}


</style>
</head>
<body >
<%!
String name;

%>
<% 
int temp=0;
Cookie aa[]=request.getCookies();
for(int i=0;i<aa.length;i++){
	if(aa[i].getName().equals("uname")){
		name=aa[i].getValue();
		temp=1;
		break;
	}
}
if(temp==0){
	response.sendRedirect("Login.jsp");
}

%>

<div class="header">
  <a  class="logo">VIRTUSA</a>
 
  <div class="header-right">   
	<a ><%= name %></a>
    <a href="Login.jsp" class="logout">Log Out</a>
  </div>
</div>
</body>
</html>