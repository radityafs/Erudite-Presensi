<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <%
    String start = request.getParameter("start");
    String end = request.getParameter("end");


    session.setAttribute("start", start);
    session.setAttribute("end", end);

    response.sendRedirect("../dashboard/report.jsp");

    %>

</body>
</html>