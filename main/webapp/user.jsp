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
<%@ page import="java.util.ArrayList" %>

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
                        <a href="index.html" class="active"><i
                                class="material-icons-two-tone">dashboard</i>Dashboard</a>
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
                                <%-- <li class="nav-item dropdown hidden-on-mobile">
                                    <a class="nav-link dropdown-toggle" href="#" id="addDropdownLink" role="button"
                                        data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="material-icons">add</i>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="addDropdownLink">
                                        <li><a class="dropdown-item" href="#">New Workspace</a></li>
                                        <li><a class="dropdown-item" href="#">New Board</a></li>
                                        <li><a class="dropdown-item" href="#">Create Project</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown hidden-on-mobile">
                                    <a class="nav-link dropdown-toggle" href="#" id="exploreDropdownLink" role="button"
                                        data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="material-icons-outlined">explore</i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-lg large-items-menu"
                                        aria-labelledby="exploreDropdownLink">
                                        <li>
                                            <h6 class="dropdown-header">Repositories</h6>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="#">
                                                <h5 class="dropdown-item-title">
                                                    Neptune iOS
                                                    <span class="badge badge-warning">1.0.2</span>
                                                    <span class="hidden-helper-text">switch<i
                                                            class="material-icons">keyboard_arrow_right</i></span>
                                                </h5>
                                                <span class="dropdown-item-description">Lorem Ipsum is simply dummy text
                                                    of the printing and typesetting industry.</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="#">
                                                <h5 class="dropdown-item-title">
                                                    Neptune Android
                                                    <span class="badge badge-info">dev</span>
                                                    <span class="hidden-helper-text">switch<i
                                                            class="material-icons">keyboard_arrow_right</i></span>
                                                </h5>
                                                <span class="dropdown-item-description">Lorem Ipsum is simply dummy text
                                                    of the printing and typesetting industry.</span>
                                            </a>
                                        </li>
                                        <li class="dropdown-btn-item d-grid">
                                            <button class="btn btn-primary">Create new repository</button>
                                        </li>
                                    </ul>
                                </li> --%>
                            </ul>

                        </div>
                        <div class="d-flex">
                            <%-- <ul class="navbar-nav">
                                <li class="nav-item hidden-on-mobile">
                                    <a class="nav-link active" href="#">Applications</a>
                                </li>
                                <li class="nav-item hidden-on-mobile">
                                    <a class="nav-link" href="#">Reports</a>
                                </li>
                                <li class="nav-item hidden-on-mobile">
                                    <a class="nav-link" href="#">Projects</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link toggle-search" href="#"><i class="material-icons">search</i></a>
                                </li>
                                <li class="nav-item hidden-on-mobile">
                                    <a class="nav-link language-dropdown-toggle" href="#" id="languageDropDown"
                                        data-bs-toggle="dropdown"><img src="http://localhost/assets/images/flags/us.png"
                                            alt=""></a>
                                    <ul class="dropdown-menu dropdown-menu-end language-dropdown"
                                        aria-labelledby="languageDropDown">
                                        <li><a class="dropdown-item" href="#"><img
                                                    src="http://localhost/assets/images/flags/germany.png" alt="">German</a></li>
                                        <li><a class="dropdown-item" href="#"><img
                                                    src="http://localhost/assets/images/flags/italy.png" alt="">Italian</a></li>
                                        <li><a class="dropdown-item" href="#"><img
                                                    src="http://localhost/assets/images/flags/china.png" alt="">Chinese</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item hidden-on-mobile">
                                    <a class="nav-link nav-notifications-toggle" id="notificationsDropDown" href="#"
                                        data-bs-toggle="dropdown">4</a>
                                    <div class="dropdown-menu dropdown-menu-end notifications-dropdown"
                                        aria-labelledby="notificationsDropDown">
                                        <h6 class="dropdown-header">Notifications</h6>
                                        <div class="notifications-dropdown-list">
                                            <a href="#">
                                                <div class="notifications-dropdown-item">
                                                    <div class="notifications-dropdown-item-image">
                                                        <span class="notifications-badge bg-info text-white">
                                                            <i class="material-icons-outlined">campaign</i>
                                                        </span>
                                                    </div>
                                                    <div class="notifications-dropdown-item-text">
                                                        <p class="bold-notifications-text">Donec tempus nisi sed erat
                                                            vestibulum, eu suscipit ex laoreet</p>
                                                        <small>19:00</small>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#">
                                                <div class="notifications-dropdown-item">
                                                    <div class="notifications-dropdown-item-image">
                                                        <span class="notifications-badge bg-danger text-white">
                                                            <i class="material-icons-outlined">bolt</i>
                                                        </span>
                                                    </div>
                                                    <div class="notifications-dropdown-item-text">
                                                        <p class="bold-notifications-text">Quisque ligula dui, tincidunt
                                                            nec pharetra eu, fringilla quis mauris</p>
                                                        <small>18:00</small>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#">
                                                <div class="notifications-dropdown-item">
                                                    <div class="notifications-dropdown-item-image">
                                                        <span class="notifications-badge bg-success text-white">
                                                            <i class="material-icons-outlined">alternate_email</i>
                                                        </span>
                                                    </div>
                                                    <div class="notifications-dropdown-item-text">
                                                        <p>Nulla id libero mattis justo euismod congue in et metus</p>
                                                        <small>yesterday</small>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#">
                                                <div class="notifications-dropdown-item">
                                                    <div class="notifications-dropdown-item-image">
                                                        <span class="notifications-badge">
                                                            <img src="http://localhost/assets/images/avatars/avatar.png" alt="">
                                                        </span>
                                                    </div>
                                                    <div class="notifications-dropdown-item-text">
                                                        <p>Praesent sodales lobortis velit ac pellentesque</p>
                                                        <small>yesterday</small>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#">
                                                <div class="notifications-dropdown-item">
                                                    <div class="notifications-dropdown-item-image">
                                                        <span class="notifications-badge">
                                                            <img src="http://localhost/assets/images/avatars/avatar.png" alt="">
                                                        </span>
                                                    </div>
                                                    <div class="notifications-dropdown-item-text">
                                                        <p>Praesent lacinia ante eget tristique mattis. Nam sollicitudin
                                                            velit sit amet auctor porta</p>
                                                        <small>yesterday</small>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                            </ul> --%>
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
                                    Featured
                                </div>
                                <div class="card-body">
                                    <h1 class="card-subtitle mb-2" id="clock">20:19:54</h1>
                                    <h5 class="card-subtitle mb-2 text-muted" id="date">Selasa, 29 Februari</h5>

                                    <div class='w-full d-flex justify-content-end'>
                                 
                                    <% 
                                    	String userId = session.getAttribute("userId").toString();
                                   		ArrayList<PresensiModel> isAlreadyAbsensi = connectionPresensi.isAlreadyPresensiToday(userId);
                                        
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
                                                <span class="widget-stats-title">Alpha</span>
                                                <span class="widget-stats-amount">$38,211</span>
                                                <span class="widget-stats-info">471 Orders Total</span>
                                            </div>
                                            <div class="widget-stats-indicator widget-stats-indicator-negative align-self-start">
                                                <i class="material-icons">keyboard_arrow_down</i> 4%
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
                                                <span class="widget-stats-title">Terlambat</span>
                                                <span class="widget-stats-amount">23,491</span>
                                                <span class="widget-stats-info">790 unique this month</span>
                                            </div>
                                            <div class="widget-stats-indicator widget-stats-indicator-positive align-self-start">
                                                <i class="material-icons">keyboard_arrow_up</i> 12%
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
                                                <span class="widget-stats-title">Presenstase Kehadiran</span>
                                                <span class="widget-stats-amount">140,390</span>
                                                <span class="widget-stats-info">87 items downloaded</span>
                                            </div>
                                            <div class="widget-stats-indicator widget-stats-indicator-positive align-self-start">
                                                <i class="material-icons">keyboard_arrow_up</i> 7%
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
                const dateToday = moment().format('dddd, DD MMMM');

                console.log(time);
                console.log(dateToday)

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