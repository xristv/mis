<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title><sitemesh:write property='title'/> | MIS Admin Panel</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

            <link href="resources/theme/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
            <link href="resources/theme/plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
            <link href="resources/theme/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
            <link href="resources/theme/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
            <link href="resources/theme/plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
            <link href="resources/theme/plugins/dropzone/dropzone.css" rel="stylesheet" type="text/css" />
            <link href="resources/css/custom.css" rel="stylesheet" type="text/css" />

            <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
            <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
            <!--[if lt IE 9]>
                <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
                <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->

    </head>
    <body class="sidebar-mini skin-blue">
        <div class="wrapper">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                       <!-- <img src="resources/theme/dist/img/logo.png' />" /> -->
                       <h4>MIS Admin Panel</h4>
                    </div>
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="header">WELCOME <c:out value="${sessionScope.username}" /> <span class="pull-right">LOGOUT</span></li>
                        <li class="active treeview">
                            <a href="<c:url value='/'/>">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span> 
                            </a>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-calendar"></i>
                                <span>My Bookings</span>  <i class="fa fa-angle-right pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="<c:url value='/bookings/new'/>"><i class="fa fa-circle-o"></i> New Booking</a></li>
                                <li><a href="<c:url value='/bookings/'/>"><i class="fa fa-circle-o"></i> View All Bookings</a></li>
                                <li><a href="#"><i class="fa fa-circle-o"></i> Statistics</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-users"></i> <span>Customers</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-calendar"></i> <span>Calendar</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-folder"></i> <span>Other stuff</span>
                            </a>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>
            <div class="content-wrapper">
                <sitemesh:write property='body'/>
            </div>
        </div>

        <!-- Footer Scripts -->
        <script src="resources/theme/plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <script src="resources/theme/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="resources/theme/dist/js/app.min.js" type="text/javascript"></script>
        <script src="resources/theme/plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
        <script src="resources/theme/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
        <script src="resources/theme/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
        <script src="resources/theme/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="resources/theme/plugins/chartjs/Chart.min.js" type="text/javascript"></script>
        <script src="resources/theme/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
        <script src="resources/theme/plugins/dropzone/dropzone.js" type="text/javascript"></script>

        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="resources/theme/dist/js/pages/dashboard2.js" type="text/javascript"></script>

    </body>
</html>