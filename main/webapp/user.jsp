<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Responsive Admin Dashboard Template">
    <meta name="keywords" content="admin,dashboard">
    <meta name="author" content="stacks">
    <!-- The above 6 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Neptune - Responsive Admin Dashboard Template</title>

    <!-- Styles -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;600;700;800&display=swap"
        rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
    <link href="http://localhost/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://localhost/assets/plugins/perfectscroll/perfect-scrollbar.css" rel="stylesheet">
    <link href="http://localhost/assets/plugins/pace/pace.css" rel="stylesheet">


    <!-- Theme Styles -->
    <link href="http://localhost/assets/css/main.min.css" rel="stylesheet">
    <link href="http://localhost/assets/css/custom.css" rel="stylesheet">

    <link rel="icon" type="image/png" sizes="32x32" href="http://localhost/assets/images/neptune.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="http://localhost/assets/images/neptune.png" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<%@ page import="com.erudite.model.*" %>
<%@ page import="com.erudite.DAO.*"%>
<%@ page import="com.erudite.Utils.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.*" %>

<% 
//check session userId and userRole
if(session.getAttribute("userId") == null || session.getAttribute("userRole") == null){
    response.sendRedirect("index.jsp");
}else{
    if(session.getAttribute("userRole").equals("admin")){
        response.sendRedirect("dashboard/index.jsp");
    }
}


UserDAO connectionUser = new UserDAO(); 
PresensiDAO connectionPresensi = new PresensiDAO(); 
mainUtils Utils = new mainUtils();

int userId = Integer.parseInt(session.getAttribute("userId").toString());

String start = "2021-01-01";
String end = LocalDate.now().toString();

int countPresensi = connectionPresensi.getCountPresensiIdByDate(start, end);
ArrayList<PresensiModel> presensiUser = connectionPresensi.getPresensiByDateAndId(start, end, userId);

int countMasuk = 0;
int countAlfa = 0;
int countIjin = 0;
int countSakit = 0;
int countTerlambat = 0;

for(int j = 0; j < presensiUser.size(); j++){
  if(presensiUser.get(j).getDescription() != null && presensiUser.get(j).getWaktuMasuk() == null){
    if(presensiUser.get(j).getDescription().equals("Ijin")){
      countIjin++;
    }else if(presensiUser.get(j).getDescription().equals("Sakit")){
      countSakit++;
    }
  }
  if(presensiUser.get(j).getWaktuMasuk() != null){
    countMasuk++;
    if(Utils.getResponse(presensiUser.get(j)).equals("Terlambat")){
      countTerlambat++;
    }
  }
  countAlfa = countPresensi - (countMasuk + countIjin + countSakit);
}

%>
<body>
    <div class="app align-content-stretch d-flex flex-wrap">
        <div class="app-sidebar">
            <div class="logo">
                <a href="index.html" class="logo-icon"><span class="logo-text">Neptune</span></a>
                <div class="sidebar-user-switcher user-activity-online">
                    <a href="#">
                        <img src="http://localhost/assets/images/avatars/avatar.png">
                        <span class="activity-indicator"></span>
                        <span class="user-info-text"><% out.print(session.getAttribute("userName")); %><br><span class="user-state-info">On a call</span></span>
                    </a>
                </div>
            </div>
            <div class="app-menu">
                <ul class="accordion-menu">
                    <li class="sidebar-title">
                        Apps
                    </li>
                    <li class="active-page">
                        <a href="#" class="active"><i
                                class="material-icons-two-tone">dashboard</i>Dashboard</a>
                    </li>
                    <li class="active-page">
                        <a href="handler/handler_logout.jsp" class="active"><i
                                class="material-icons-two-tone">logout</i><span class="text-danger">Keluar</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="app-container">
            <div class="search">
                <form>
                    <input class="form-control" type="text" placeholder="Type here..." aria-label="Search">
                </form>
                <a href="#" class="toggle-search"><i class="material-icons">close</i></a>
            </div>
            <div class="app-header">
                <nav class="navbar navbar-light navbar-expand-lg">
                    <div class="container-fluid">
                        <div class="navbar-nav" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link hide-sidebar-toggle-button" href="#"><i
                                            class="material-icons">first_page</i></a>
                                </li>
                            </ul>

                        </div>
                        <div class="d-flex">
                        </div>
                    </div>
                </nav>
            </div>
            <div class="app-content">
                <div class="content-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="page-description">
                                    <h1>Dashboard</h1>
                                </div>
                            </div>
                        </div>
                                               <div class="row">
                            <div class="card">
                                <div class="card-header">
                                    <h2>Featured</h2>
                                </div>
                                <div class="card-body">
                                    <h1 class="card-subtitle mb-2" id="clock">20:19:54</h1>
                                    <h5 class="card-subtitle mb-2 text-muted" id="date">Selasa, 29 Februari</h5>

                                    <div class='w-full d-flex justify-content-end'>
                                 
                                    <% 
                                    	String userIdS = session.getAttribute("userId").toString();
                                   		ArrayList<PresensiModel> isAlreadyAbsensi = connectionPresensi.isAlreadyPresensiToday(userIdS);
                                        
                                        if(isAlreadyAbsensi.size() == 0) {
                                                out.print("<a class='btn btn-primary' href='handler/handler_absensi.jsp'><i class='material-icons'>add</i> Absen Masuk</a>");
                                        }else{
                                            if(isAlreadyAbsensi.get(0).getWaktuPulang() == null) {
                                                out.print("<a class='btn btn-primary' href='handler/handler_absensi.jsp'><i class='material-icons'>add</i> Absen Pulang</a>");
                                            }
                                        }

                                        
                                    
                                    %>

                                       </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-4">
                                <div class="card widget widget-stats">
                                    <div class="card-body">
                                        <div class="widget-stats-container d-flex">
                                            <div class="widget-stats-icon widget-stats-icon-primary">
                                                <i class="material-icons-outlined">paid</i>
                                            </div>
                                            <div class="widget-stats-content flex-fill">
                                                <span class="widget-stats-title">Hadir</span>
                                                <span class="widget-stats-amount">
                                                <%= countMasuk %>
                                                </span>
                                                <span class="widget-stats-info">
                                                <%= countTerlambat %> Terlambat
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4">
                                <div class="card widget widget-stats">
                                    <div class="card-body">
                                        <div class="widget-stats-container d-flex">
                                            <div class="widget-stats-icon widget-stats-icon-warning">
                                                <i class="material-icons-outlined">person</i>
                                            </div>
                                            <div class="widget-stats-content flex-fill">
                                                <span class="widget-stats-title">Izin</span>
                                                <span class="widget-stats-amount">
                                                <%= countSakit + countIjin %>
                                                </span>
                                                <span class="widget-stats-info">
                                                <%= countSakit %> Sakit / <%= countIjin %> Ijin
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4">
                                <div class="card widget widget-stats">
                                    <div class="card-body">
                                        <div class="widget-stats-container d-flex">
                                            <div class="widget-stats-icon widget-stats-icon-danger">
                                                <i class="material-icons-outlined">file_download</i>
                                            </div>
                                            <div class="widget-stats-content flex-fill">
                                                <span class="widget-stats-title">Persentase</span>
                                                <span class="widget-stats-amount">
                                                <%= Utils.calculatePercentage(countMasuk, countPresensi) %> %
                                                </span>
                                                <span class="widget-stats-info">
                                                <%= countMasuk %> Hadir / <%= countPresensi %> Total
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
 
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Javascripts -->
    <script src="http://localhost/assets/plugins/jquery/jquery-3.5.1.min.js"></script>
    <script src="http://localhost/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="http://localhost/assets/plugins/perfectscroll/perfect-scrollbar.min.js"></script>
    <script src="http://localhost/assets/plugins/pace/pace.min.js"></script>
    <script src="http://localhost/assets/plugins/apexcharts/apexcharts.min.js"></script>
    <script src="http://localhost/assets/js/main.min.js"></script>
    <script src="http://localhost/assets/js/custom.js"></script>
    <script src="http://localhost/assets/js/pages/dashboard.js"></script>
    <script src="https://momentjs.com/downloads/moment.min.js"></script>
    <script>
        $(document).ready(function() {

            const updateClock = () => {
                const clock = document.getElementById('clock');
                const date = document.getElementById('date');

                const time = moment().format('HH:mm:ss');
                const dateToday = moment().format('dddd, DD MMMM YYYY');

                clock.textContent = time;
                date.textContent = dateToday;
            }

            updateClock();

            setInterval(() => {
                updateClock();
            }, 1000);
        });
    </script>
</body>

</html>