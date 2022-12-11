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

    PresensiDAO presensiDAO = new PresensiDAO();
    UserDAO userDAO = new UserDAO();

    String start = request.getParameter("start");
    String end = request.getParameter("end");


    session.setAttribute("start", start);
    session.setAttribute("end", end);

    response.sendRedirect("../dashboard/report.jsp");

    %>

</body>
</html>