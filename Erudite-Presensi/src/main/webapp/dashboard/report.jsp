<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
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
    <link href="http://localhost/assets/plugins/pace/pace.css" rel="stylesheet" />

    <!-- Theme Styles -->
    <link href="http://localhost/assets/css/main.min.css" rel="stylesheet" />
    <link href="http://localhost/assets/css/custom.css" rel="stylesheet" />

    <link
      href="http://localhost/assets/plugins/datatables/datatables.min.css"
      rel="stylesheet"
    />

    <link
      href="http://localhost/assets/plugins/flatpickr/flatpickr.min.css"
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
  </head>
  <body>
    <div class="app align-content-stretch d-flex flex-wrap">
      <div class="app-sidebar">
        <div class="logo">
          <a href="index.jsp" class="logo-icon"
            ><span class="logo-text">Erudite</span></a
          >
          <div class="sidebar-user-switcher user-activity-online">
            <a href="#">
              <span class="user-info-text" style="height: 100%"
                >Raditya Firman Syaputra</span
              >
            </a>
          </div>
        </div>
        <div class="app-menu">
          <ul class="accordion-menu">
            <li class="sidebar-title">Features</li>
            <li>
              <a href="index.jsp"
                ><i class="material-icons-two-tone">dashboard</i>Dashboard</a
              >
            </li>
            <li>
              <a href="user.jsp"
                ><i class="material-icons-two-tone">inbox</i>Users
              </a>
            </li>
            <li class="active-page">
              <a href="report.jsp" class="active"
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
                    <h1>Laporan Absensi</h1>
                    <span>Silahkan pilih rentang tanggal absensi...</span>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-12">
                  <div class="card">
                    <div class="card-header">
                      <h5 class="card-title">Pilih rentang tanggal laporan</h5>
                    </div>
                    <form action="handler/report_absensi.jsp" method="POST">
                      <div class="card-body d-flex justify-content-between">
                        <input
                          class="form-control flatpickr1"
                          name="start"
                          type="text"
                          style="width: 45%"
                          placeholder="Select Date.."
                        />
                        <input
                          class="form-control flatpickr1"
                          type="text"
                          name="end"
                          style="width: 45%"
                          placeholder="Select Date.."
                        />
                      </div>
                      <div class="card-footer w-100 d-flex justify-content-end">
                        <button class="btn btn-primary">Cari</button>
                      </div>
                    </form>
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
                            <th>Nama</th>
                            <th>Masuk</th>
                            <th>Alfa</th>
                            <th>Ijin</th>
                            <th>Sakit</th>
                            <th>Terlambat</th>
                            <th>Persentase Kehadiran</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>1</td>
                            <td>Raditya Firman Syaputra</td>
                            <td>20</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>100%</td>
                          </tr>
                        </tbody>
                        <tfoot>
                          <tr>
                            <th>ID</th>
                            <th>Nama</th>
                            <th>Masuk</th>
                            <th>Alfa</th>
                            <th>Ijin</th>
                            <th>Sakit</th>
                            <th>Terlambat</th>
                            <th>Persentase Kehadiran</th>
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
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">
              Tambahkan Pengguna
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
                <label for="name" class="col-form-label">Nama:</label>
                <input
                  type="text"
                  class="form-control"
                  id="name"
                  name="name"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="email" class="col-form-label">Email:</label>
                <input
                  type="email"
                  class="form-control"
                  id="email"
                  name="email"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="password" class="col-form-label">Password:</label>
                <input
                  type="password"
                  class="form-control"
                  id="password"
                  name="password"
                  required
                />
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
              Tambahkan User
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
    <script src="http://localhost/assets/js/main.min.js"></script>
    <script src="http://localhost/assets/js/custom.js"></script>
    <script src="http://localhost/assets/js/pages/dashboard.js"></script>
    <script src="http://localhost/assets/js/pages/datatables.js"></script>
    <script src="http://localhost/assets/plugins/datatables/datatables.min.js"></script>
    <script src="http://localhost/assets/js/pages/datepickers.js"></script>
    <script src="http://localhost/assets/plugins/flatpickr/flatpickr.js"></script>

    <script>
      $(document).ready(function () {
        console.log("ready!");
      });
    </script>
  </body>
</html>
