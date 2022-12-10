<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Insert title here</title>
  </head>
  <body>
    <%@ page import="com.erudite.model.UserModel" %>
    <%@ page import="com.erudite.DAO.UserDAO" %>
    <%@ page import="java.util.ArrayList" %>
    <%
    
	String name=request.getParameter("name");
    String email=request.getParameter("email");
	String password=request.getParameter("password");
	
	
	UserModel User = new UserModel();
	
	User.setEmail(email);
	User.setPassword(password);
	User.setName(name);
	User.setRole("USER");
	
	UserDAO connectionUser = new UserDAO();
	
	connectionUser.registerUser(User);
	
	
	response.sendRedirect("../dashboard/user.jsp");
	
	
    
    %>
  </body>
</html>
