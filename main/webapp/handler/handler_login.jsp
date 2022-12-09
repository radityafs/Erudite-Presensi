<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import="com.erudite.model.UserModel" %>
<%@ page import="com.erudite.DAO.UserDAO" %>
<%@ page import="java.util.ArrayList" %>

<% 
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	
	UserModel User = new UserModel();
	
	User.setEmail(email);
	User.setPassword(password);
	
	UserDAO connectionUser = new UserDAO();
	
	ArrayList<UserModel> userData = connectionUser.login(User);
	
	if(userData.size() < 1){
		session.setAttribute("error","Email / Password yang anda masukan salah...");
		response.sendRedirect("../");
	}else{
		
		UserModel UserLogged = userData.get(0);
		
		session.setAttribute("userId",UserLogged.getId());
		session.setAttribute("userEmail",UserLogged.getEmail());
		session.setAttribute("userName",UserLogged.getName());
		session.setAttribute("userRole",UserLogged.getRole());
		
		out.print(UserLogged.getRole());
		
		if(UserLogged.getRole().equals("ADMIN")){
			response.sendRedirect("../dashboard/index.jsp");
		}else{
			response.sendRedirect("../user.jsp");
		}
		

	}
	

%>

	

</body>
</html>