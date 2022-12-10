<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

    <%@ page import="com.erudite.model.*" %>
    <%@ page import="com.erudite.DAO.*" %>
    <%@ page import="java.util.ArrayList" %>

<%
String userId = request.getParameter("userId");
String state = request.getParameter("state");

PresensiDAO presensiDAO = new PresensiDAO();

presensiDAO.insertAbsensiLogManual(userId, state);

response.sendRedirect("../dashboard/");
%>

</body>
</html>