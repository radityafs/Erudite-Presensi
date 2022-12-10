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
  <%@ page import="com.erudite.Utils.*" %>
  <%@ page import="com.erudite.DAO.*"%>
  <%@ page import="java.util.ArrayList" %>

<%
PresensiModel presensi = new PresensiModel();

presensi.setWaktuMasuk("2022-12-10 07:19:09");
presensi.setWaktuPulang("2022-12-10 16:15:00");

mainUtils Utils = new mainUtils();


String result = Utils.getResponse(presensi);
out.print(result);
%>
</body>
</html>