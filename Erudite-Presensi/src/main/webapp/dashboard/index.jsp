<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<% 
if(session.getAttribute("userId") == null){
	response.sendRedirect("../index.jsp");
}
%>


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
    <link href="http://localhost/assets/plugins/pace/pace.css" rel="stylesheet" />

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
<%@ page import="com.erudite.DAO.*" %>
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
        <% 
        	
    	UserDAO connectionUser = new UserDAO();
        
        int countUser = connectionUser.countUser();
        
        presensiDAO connectionPresensi = new presensiDAO();
        
        %>
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
                          <span class="widget-stats-amount">300</span>
                          <span class="widget-stats-info"
                            >700 Belum hari ini</span
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
                          <span class="widget-stats-title">Persentase</span>
                          <span class="widget-stats-amount">30%</span>
                          <span class="widget-stats-info"
                            >300 User / 1000 User</span
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
                            <th>Name</th>
                            <th>Waktu</th>
                            <th>Action</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>1</td>
                            <td>John Doe</td>
                            <td>2021-05-01 10:00:00</td>
                            <td>
                              <form
                                action="handler/changeAbsensi"
                                style="
                                  display: flex;
                                  justify-content: space-between;
                                "
                              >
                                <input type="hidden" name="id" value="POST" />
                                <select
                                  style="
                                    display: inline;
                                    width: 50%;
                                    min-width: 100px;
                                  "
                                  class="form-control"
                                  method=""
                                >
                                  <option value="Datang">Datang</option>
                                  <option value="Pulang">Terlambat</option>
                                  <option value="Terlambat">Pulang</option>
                                </select>

                                <button
                                  style="width: 30%; min-width: 100px"
                                  type="submit"
                                  class="btn btn-warning"
                                >
                                  Ganti
                                </button>
                              </form>
                            </td>
                          </tr>
                        </tbody>
                        <tfoot>
                          <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Waktu</th>
                            <th>Action</th>
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
          <div class="modal-body">
            <form action="handler/add_user.jsp">
              <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Nama</label>
                <select
                  class="js-example-basic-multiple-limit js-states form-control"
                  multiple="multiple"
                  tabindex="-1"
                  style="display: none; width: 100%"
                >
                  <option value="AL">Alabama</option>
                  <option value="WY">Wyoming</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label"
                  >Action</label
                >
                <select
                  class="js-states form-control"
                  tabindex="-1"
                  style="display: none; width: 100%"
                >
                  <option value="ALFA">ALFA</option>
                  <option value="IJIN">IJIN</option>
                  <option value="SAKIT">SAKIT</option>
                </select>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Close
            </button>
            <button type="button" class="btn btn-primary">
              Tambahkan Absensi
            </button>
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
    <script src="http://localhost/assets/js/pages/datatables.js"></script>
    <script src="http://localhost/assets/plugins/datatables/datatables.min.js"></script>
    <script src="http://localhost/assets/js/pages/select2.js"></script>
    <script src="http://localhost/assets/plugins/select2/js/select2.full.min.js"></script>

    <script>
      $(document).ready(function () {
        $(".js-example-basic-multiple-limit").select2({
          maximumSelectionLength: 10,
          dropdownParent: $("#exampleModal"),
        });

        $(".js-states").select2({
          dropdownParent: $("#exampleModal"),
        });
      });
    </script>
  </body>
</html>
