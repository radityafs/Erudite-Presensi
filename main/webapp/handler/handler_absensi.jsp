<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Insert title here</title>
  </head>
  <body>
    <%@ page import="com.erudite.model.*" %>
    <%@ page import="com.erudite.DAO.*" %>
    <%@ page import="java.util.ArrayList" %>
    <%
   
	String userId = session.getAttribute("userId").toString();
	PresensiDAO connectionPresensi = new PresensiDAO();
	
	ArrayList<PresensiModel> presensi = connectionPresensi.isAlreadyPresensiToday(userId);
	
	if(presensi.size() == 0){
		connectionPresensi.insertLogPresensi(userId);
	}else{
		connectionPresensi.updateWaktuPulang(userId);
	}

	session.setAttribute("success", "Presensi Berhasil");

	response.sendRedirect("../user.jsp");
	
    
    %>
  </body>
</html>
