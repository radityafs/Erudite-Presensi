<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <% if(session.getAttribute("userId") == null){
  response.sendRedirect("../index.jsp"); } %>

  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Responsive Admin Dashboard Template" />
    <meta name="keywords" content="admin,dashboard" />
    <meta name="author" content="stacks" />
    <!-- The above 6 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Erudite</title>

    <!-- Styles -->
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;600;700;800&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
      rel="stylesheet"
    />
    <link
      href="http://localhost/assets/plugins/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="http://localhost/assets/plugins/perfectscroll/perfect-scrollbar.css"
      rel="stylesheet"
    />
    <link
      href="http://localhost/assets/plugins/select2/css/select2.min.css"
      rel="stylesheet"
    />
    <link
      href="http://localhost/assets/plugins/pace/pace.css"
      rel="stylesheet"
    />

    <!-- Theme Styles -->
    <link href="http://localhost/assets/css/main.min.css" rel="stylesheet" />
    <link href="http://localhost/assets/css/custom.css" rel="stylesheet" />

    <link
      href="http://localhost/assets/plugins/datatables/datatables.min.css"
      rel="stylesheet"
    />

    <link
      rel="icon"
      type="image/png"
      sizes="32x32"
      href="http://localhost/assets/images/neptune.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="http://localhost/assets/images/neptune.png"
    />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <%@ page import="com.erudite.model.*" %>
  <%@ page import="com.erudite.Utils.*" %>
  <%@ page import="com.erudite.DAO.*"%>
  <%@ page import="java.util.ArrayList" %>

  

  <body>
    <div class="app align-content-stretch d-flex flex-wrap">
      <div class="app-sidebar">
        <div class="logo">
          <a href="index.html" class="logo-icon"
            ><span class="logo-text">Erudite</span></a
          >
          <div class="sidebar-user-switcher user-activity-online">
            <a href="#">
              <span class="user-info-text" style="height: 100%"
                ><% out.print(session.getAttribute("userName")); %></span
              >
            </a>
          </div>
        </div>

        <div class="app-menu">
          <ul class="accordion-menu">
            <li class="sidebar-title">Features</li>
            <li class="active-page">
              <a href="index.jsp" class="active"
                ><i class="material-icons-two-tone">dashboard</i>Dashboard</a
              >
            </li>
            <li>
              <a href="user.jsp"
                ><i class="material-icons-two-tone">inbox</i>Users
              </a>
            </li>
            <li>
              <a href="report.jsp"
                ><i class="material-icons-two-tone">cloud_queue</i>Laporan
                Absensi</a
              >
            </li>
            <li class="active-page">
              <a href="../handler/handler_logout.jsp" class="active"><i
                 class="material-icons-two-tone">logout</i><span class="text-danger">Keluar</span></a>
            </li>
          </ul>
        </div>
      </div>
      <div class="app-container">
        <div class="search">
          <form>
            <input
              class="form-control"
              type="text"
              placeholder="Type here..."
              aria-label="Search"
            />
          </form>
          <a href="#" class="toggle-search"
            ><i class="material-icons">close</i></a
          >
        </div>
        <div class="app-header">
          <nav class="navbar navbar-light navbar-expand-lg">
            <div class="container-fluid">
              <div class="navbar-nav" id="navbarNav">
                <ul class="navbar-nav">
                  <li class="nav-item">
                    <a class="nav-link hide-sidebar-toggle-button" href="#"
                      ><i class="material-icons">first_page</i></a
                    >
                  </li>
                </ul>
              </div>
              <div class="d-flex"></div>
            </div>
          </nav>
        </div>

        <%
        UserDAO connectionUser = new UserDAO(); 
                int countUser = connectionUser.countUser(); 
                PresensiDAO connectionPresensi = new PresensiDAO(); 
                int countTotalPresensi = connectionPresensi.getPresensiToday().size();
                        
                mainUtils Utils = new mainUtils();
        %>


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
                <div class="col-xl-4">
                  <div class="card widget widget-stats">
                    <div class="card-body">
                      <div class="widget-stats-container d-flex">
                        <div
                          class="widget-stats-icon widget-stats-icon-primary"
                        >
                          <i class="material-icons-outlined">paid</i>
                        </div>
                        <div class="widget-stats-content flex-fill">
                          <span class="widget-stats-title">Total User</span>
                          <span class="widget-stats-amount"><% out.print(countUser); %></span>
                          <span class="widget-stats-info">Total Pengguna</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-xl-4">
                  <div class="card widget widget-stats">
                    <div class="card-body">
                      <div class="widget-stats-container d-flex">
                        <div
                          class="widget-stats-icon widget-stats-icon-warning"
                        >
                          <i class="material-icons-outlined">person</i>
                        </div>
                        <div class="widget-stats-content flex-fill">
                          <span class="widget-stats-title">Total Absensi</span>
                          <span class="widget-stats-amount"
                            ><% out.print(countTotalPresensi); %></span
                          >
                          <span class="widget-stats-info"
                            ><% out.print(countUser - countTotalPresensi); %>
                            Belum hari ini</span
                          >
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
                          <span class="widget-stats-title"
                            >Persentase Today</span
                          >
                          <span class="widget-stats-amount"><% out.print(String.format("%.2f", Utils.calculatePercentage(countTotalPresensi, countUser))); %>%</span>
                          <span class="widget-stats-info"
                            ><% out.print(countTotalPresensi); %> User / <%
                            out.print(countUser); %> User</span
                          >
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col">
                  <div class="page-description">
                    <h1>Log Absensi Hari ini</h1>
                    <span
                      >Berikut adalah riwayat user yang melakukan absensi hari
                      ini.</span
                    >
                    <div
                      style="display: flex; width: 100%; justify-content: end"
                    >
                      <button
                        type="button"
                        class="btn btn-primary"
                        data-bs-toggle="modal"
                        data-bs-target="#exampleModal"
                      >
                        Tambah Absensi
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <div class="card">
                    <div class="card-header"></div>
                    <div class="card-body">
                      <table
                        id="datatable1"
                        class="display"
                        style="width: 100%"
                      >
                        <thead>
                          <tr>
                          <th>ID</th>
                          <th>name</th>
                          <th>Waktu Masuk</th>
                          <th>Waktu Pulang</th>
                          <th>Description</th>
                          </tr>
                        </thead>
                        <tbody>
                            <% for (PresensiModel presensi : connectionPresensi.getPresensiToday()) { %>
                            <tr>
                            <td><% out.print(presensi.getId()); %></td>
                            <td><% out.print(presensi.getUser().getName()); %></td>
                            <td><% out.print(presensi.getWaktuMasuk()); %></td>
                            <td><% out.print(presensi.getWaktuPulang()); %></td>
                            <td><% out.print((presensi.getDescription() != null) ? presensi.getDescription() : Utils.getResponse(presensi)); %></td>
                            </tr>
                            <% } %>
                          </tr>
                        </tbody>
                        <tfoot>
                          <tr>
                          <th>ID</th>
                          <th>name</th>
                          <th>Waktu Masuk</th>
                          <th>Waktu Pulang</th>
                          <th>Description</th>
                          </tr>
                        </tfoot>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div
      class="modal fade"
      id="exampleModal"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">
              Tambahkan Absensi
            </h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
        <form action="../handler/handler_absensi_manual.jsp" method="POST">
          <div class="modal-body">
              <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Nama</label>
                <select
                  class="js-states form-control"
                  tabindex="-1"
                  style="display: none; width: 100%"
                  name="userId"
                >
                <%
                    ArrayList<UserModel> userList = connectionUser.userList();
   
                    for (int i = 0; i < userList.size(); i++) {

                        String id = String.valueOf(userList.get(i).getId());

                        ArrayList<PresensiModel> isPresensi = connectionPresensi.isAlreadyPresensiToday(id);
                        
                        if(isPresensi.size() == 0) {
                          out.print(String.format("<option value='%s'>%s</option>", userList.get(i).getId(), userList.get(i).getName()));
                        }
                    }
                %>
                </select>
              </div>
              <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Action</label>
                <select class="js-states form-control" tabindex="-1" style="display: none; width: 100%"
                name="state">
                  <option value="Ijin">IJIN</option>
                  <option value="Sakit">SAKIT</option>
                </select>
              </div>

          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Close
            </button>
            <button type="submit" class="btn btn-primary">
              Tambahkan Absensi
            </button>
          </div>
       </form>
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
    <script src="http://localhost/assets/js/pages/datatables.js"></script>
    <script src="http://localhost/assets/plugins/datatables/datatables.min.js"></script>
    <script src="http://localhost/assets/js/pages/select2.js"></script>
    <script src="http://localhost/assets/plugins/select2/js/select2.full.min.js"></script>

    <script>
      $(document).ready(function () {

        $(".js-states").select2({
          dropdownParent: $("#exampleModal"),
        });
      });
    </script>
  </body>
</html>
