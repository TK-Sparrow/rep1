<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log In</title>

<style>
header{
  text-align:center;
  height:100px;
  background: url("building.jpg");
  background-attachment: scroll;
}
header,footer{
width:100%;
color:red;
font-size:30px;
}
#log{
  text-align:center;
  width: 200px;
  border: 10px solid black;
  padding: 30px;
  margin: 20px;
  display: inline-block;
}
</style>

</head>
<body  style="text-align:center">
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%!
String name="";
String pass="";
int temp=1;
          public int validate(String name, String pass) {
            System.out.println(name);  
            try {
            	if(name.equals("") || pass.equals("")){
            		temp=3;
            	}
            	else{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "user_id", "hello");
					Statement st=con.createStatement();
					ResultSet rs=st.executeQuery("select * from udetail where name='"+name+"'");
					if(rs.next()==false){
						System.out.println("User Name not found");
						temp=2;
					}
					else{
						while(rs.next()) {
							if(rs.getString(2).equals(pass)){
								temp=0;
								break;
							}
						}
						if(temp==1){
							
							System.out.println("login  Failed");
							
						}
						else{
							System.out.println("Login successfull");
						}
						
					}
            	}
			}
			catch (Exception e) {
				System.out.println(e.toString());
			}
            return temp;
         }
 %>
 <%        
    name = request.getParameter("uname");
 	pass=request.getParameter("pass");
 	int n=4;
    if(name != null && pass !=null){
        n=validate(name,pass);
    }
    if(n==0){
    	%>
        <script type="text/javascript">alert("successfull");</script>
        <%
        Cookie ck=new Cookie("uname",name);
        response.addCookie(ck);
        response.sendRedirect("index.jsp");
    }
    else if(n==2){
    	%>
        <script type="text/javascript">alert("user name not found");</script>
        <%
    }
    else if(n==1){
    	%>
        <script type="text/javascript">alert("Login failed");</script>
        <%
    }
    else if(n==3){
    	%>
        <script type="text/javascript">alert("Fill all the details");</script>
        <%
    }
 %>
<header> <center>Virtusa</center> </header>
<div id="log">
<h1>LOG IN</h1>
<form action="#" method="post">
<input type="text" minlength=6 style="text-align:center;margin:5px" placeholder="Username" name="uname" value=<% if(name!=null){ %><%= name%><%} %>><br>
<input type="password" minlength=2 style="text-align:center;margin:5px" placeholder="Password" name="pass" value=<% if(pass!=null){ %><%= pass%><%} %>><br>
<input type="submit" style="text-align:center;margin:5px" style="text-align:center;margin:5px" value="login" >
</form>
</div>
<footer></footer>
</body>
</html>

