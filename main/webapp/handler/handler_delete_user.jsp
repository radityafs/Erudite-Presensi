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
    
	String userId=request.getParameter("id");
	
	UserDAO connectionUser = new UserDAO();
	connectionUser.deleteUser(userId);
	
	response.sendRedirect("../dashboard/user.jsp");
	
	
    
    %>
  </body>
</html>
