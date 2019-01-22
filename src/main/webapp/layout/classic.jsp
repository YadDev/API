
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>

<title><tiles:insertAttribute name="title" /></title>

<spring:url value="/resources/bootstrap/css/bootstrap.min.css"
	var="mainCss" />
<link rel="stylesheet" href="${mainCss}" />


<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

<spring:url value="/resources/dist/css/AdminLTE.min.css" var="lte" />
<link rel="stylesheet" href="${lte}" />
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<spring:url value="/resources/dist/css/skins/_all-skins.min.css"
	var="lte1" />
<link rel="stylesheet" href="${lte1}" />
<spring:url value="/resources/plugin/jQuery/jquery-2.2.3.min.js"
	var="js1" />
<script src="${js1}"></script>
<spring:url value="/resources/plugin/jQueryUI/jquery-ui.min.js"
	var="jQueryUI" />
<script src="${jQueryUI}"></script>

<spring:url
	value="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"
	var="dt1" />
<script src="${dt1}"></script>

<script type="text/javascript">
	// $window.onload = function() {
	// 	var time = $filter('date')(new Date(), 'dd-MMMM-yyyy HH:mm');
	// 	var displayTime = document.getElementById("displayTime");
	// 	displayTime.innerHTML = time;
	// }
</script>

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">

			<!-- Logo -->
			<a href="doMore" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>Anand</b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>Anand</b> Dairy</span>
			</a>

			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">

						<li class="dropdown tasks-menu"></li>
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <%
 	String users = session.getAttribute("userRole").toString();
 	String terminal = session.getAttribute("terminalNM").toString();
 	String profileName = session.getAttribute("profileName").toString();
 	String avatar = null;

 	String userName = null;
 	if (users.equalsIgnoreCase("2")) {
 		avatar = "logo.jpg";
 		userName = profileName;
 	} else if (users.equalsIgnoreCase("1")) {
 		avatar = "user1-128x128.jpg";
 		userName = profileName;
 	} else {
 		avatar = "user8-128x128.jpg";
 		userName = profileName;
 	}
 %> <img src="/resources/dist/img/<%=avatar%>" class="user-image"
								alt="User Image"> <span class="hidden-xs"><%=userName%></span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img
									src="/resources/dist/img/<%=avatar%>" class="img-circle"
									alt="User Image">

									<p>
										<%=userName%>
										<small id="displayTime"></small>
									</p></li>

								<li class="user-footer">
									<div class="pull-left">
										<a href="#" class="btn btn-default btn-flat">Profile</a>
									</div>
									<div class="pull-right">
										<a href="logout" class="btn btn-default btn-flat">Sign out</a>
									</div>
								</li>
							</ul></li>

					</ul>
				</div>

			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->

				<div class="user-panel">
					<div class="pull-left image">
						<img src="/resources/dist/img/<%=avatar%>" class="img-circle"
							alt="User Image">
					</div>
					<div class="pull-left info">
						<p><%=userName%></p>
						<a href="doMore"><i class="fa fa-circle text-success"></i>
							Online</a>
					</div>
				</div>

				<!-- sidebar menu: : style can be found in sidebar.less -->

				<!-- Tab For Anand Meeting Point Service  Start Here-->
				<ul class="sidebar-menu">
					<%
						if (users.equalsIgnoreCase("3")) {
					%>
					<li class="treeview"><a href="#"> <i class="fa fa-table"></i>
							<span>Meeting Point</span> <span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="sales"><i class="fa fa-circle-o"></i>
									Settlement</a></li>
							<li><a href="dealerList"><i class="fa fa-circle-o"></i>
									Sales Report</a></li>
						</ul></li>
					<!-- Anand Meeting Point End Here -->
					<%
						} else {
					%>

					<li class="treeview"><a href="#"> <i class="fa fa-table"></i>
							<span>Daily Entry</span> <span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="customerList"><i class="fa fa-circle-o"></i>
									Daily Customer Entry</a></li>
							<li><a href="dealerList"><i class="fa fa-circle-o"></i>
									Dealer Entry</a></li>
						</ul></li>
					<%
						if (users.equalsIgnoreCase("1")) {
					%>
					<li class="treeview"><a href="#"> <i class="fa fa-table"></i>
							<span>Employee Management</span> <span
							class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href=employee><i class="fa fa-circle-o"></i>
									Employee</a></li>

						</ul></li>
					<%
						}
					%>
					<li class="treeview"><a href="#"> <i class="fa fa-table"></i>
							<span>Add New Entity</span> <span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="customerPage"><i class="fa fa-circle-o"></i>Customer</a></li>
							<li><a href="dealerPage"><i class="fa fa-circle-o"></i>Dealer</a></li>

						</ul></li>

					<li class="treeview"><a href="#"> <i class="fa fa-table"></i>
							<span>Daily Reports</span> <span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="dailyEntryReports"><i
									class="fa fa-circle-o"></i>Show Daily Reports</a></li>

						</ul></li>


					<li class="treeview"><a href="#"> <i class="fa fa-folder"></i>
							<span>Purchase</span> <span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="dailyPurchase"><i class="fa fa-circle-o"></i>
									Daily Purchase</a></li>
							<li><a href="purchaseReport"><i class="fa fa-circle-o"></i>
									Report</a></li>
							<li><a href="login"><i class="fa fa-circle-o"></i> Login</a></li>
							<li><a href="pages/examples/register.html"><i
									class="fa fa-circle-o"></i> Register</a></li>
							<li><a href="pages/examples/lockscreen.html"><i
									class="fa fa-circle-o"></i> Lockscreen</a></li>
							<li><a href="pages/examples/404.html"><i
									class="fa fa-circle-o"></i> 404 Error</a></li>
							<li><a href="pages/examples/500.html"><i
									class="fa fa-circle-o"></i> 500 Error</a></li>
							<li><a href="pages/examples/blank.html"><i
									class="fa fa-circle-o"></i> Blank Page</a></li>
							<li><a href="pages/examples/pace.html"><i
									class="fa fa-circle-o"></i> Pace Page</a></li>
						</ul></li>



					<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
					<li><a href="#"><i class="fa fa-circle-o text-yellow"></i>
							<span>Warning</span></a></li>
					<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
				</ul>
				<%
					}
				%>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					<tiles:insertAttribute name="current" />
				</h1>
				<ol class="breadcrumb">
					<li><a href="doMore"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active"><tiles:insertAttribute name="current" /></li>
				</ol>
			</section>

			<!-- Main content -->

			<section class="content" style="overflow-y: auto; height: 510px;">
				<tiles:insertAttribute name="body" />
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 1.0.0
			</div>
			<strong>Copyright &copy; 2017-2018 <a
				href="http://anandenterprizes.com">Anand Enterprises</a>.
			</strong> All rights reserved.
		</footer>

		<div class="control-sidebar-bg"></div>

	</div>
	<spring:url value="/resources/bootstrap/js/bootstrap.min.js" var="js2" />
	<script src="${js2}"></script>
	<!-- FastClick -->
	<spring:url value="/resources/plugin/fastclick/fastclick.js" var="js3" />
	<script src="${js3}"></script>
	<!-- AdminLTE App -->
	<spring:url value="/resources/dist/js/app.min.js" var="js4" />
	<script src="${js4}"></script>
	<!-- Sparkline -->
	<spring:url value="/resources/plugin/sparkline/jquery.sparkline.min.js"
		var="js5" />
	<script src="${js5}"></script>

	<!-- AdminLTE for demo purposes -->
	<spring:url value="/resources/dist/js/demo.js" var="js7" />
	<script src="${js7}"></script>


	<spring:url
		value="/resources/plugin/datatables/dataTables.bootstrap.min.js"
		var="dt2" />
	<script src="${dt2}"></script>

	<script type="text/javascript">
		
	</script>
</body>
</html>