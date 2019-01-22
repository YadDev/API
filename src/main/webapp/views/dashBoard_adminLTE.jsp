
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<title><tiles:insertAttribute name="title" /></title>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />


<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

<link rel="stylesheet" href="dist/css/AdminLTE.min.css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->

<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css" />

<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>

<script src="plugins/jQueryUI/jquery-ui.min.js"></script>


<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>

<script type="text/javascript">
	
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
						<li class="dropdown user user-menu">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
							<img src="dist/img/avatar.png" class="user-image"
								alt="User Image"> <span class="hidden-xs">Devendra</span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img
									src="dist/img/avatar.png" class="img-circle"
									alt="User Image">
									<p>Devendra<small id="displayTime"></small>
									</p></li>	

								<li class="user-footer">
									<div class="pull-left">
										Last Login: 
										<%	
										SimpleDateFormat sdf=new SimpleDateFormat("DD-MM-YY HH:mm:ss");
										out.println(sdf.format(new Date()));
										%>
									</div>
									<div class="pull-right">
										<a href="logout">Sign out</a>
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


				<!-- sidebar menu: : style can be found in sidebar.less -->

				<!-- Tab For Anand Meeting Point Service  Start Here-->
				<ul class="sidebar-menu">

					<c:if test="${not empty menuList}">
						<c:forEach var="menu" items="${menuList}" varStatus="status">
							<li class="treeview"><a href="#"> <i class="fa fa-table"></i>
									<span>${menu.pageName}</span> <span
									class="pull-right-container"> <i
										class="fa fa-angle-left pull-right"></i>
								</span>
							</a>
								<c:if test="${menu.pageName == 'Functional Master'}">
								
								<ul class="treeview-menu">
									<li><a href="busStopPage"><i class="fa fa-circle-o"></i>
											Bus Stop</a></li>
									
								</ul></c:if></li>
								
						</c:forEach>
					</c:if>
<!-- 					<li class="treeview"><a href="#"> <i class="fa fa-table"></i> -->
<!-- 							<span>Employee Management</span> <span -->
<!-- 							class="pull-right-container"> <i -->
<!-- 								class="fa fa-angle-left pull-right"></i> -->
<!-- 						</span> -->
<!-- 					</a> -->
<!-- 						<ul class="treeview-menu"> -->
<!-- 							<li><a href=employee><i class="fa fa-circle-o"></i> -->
<!-- 									Employee</a></li> -->

<!-- 						</ul></li> -->
<!-- 						<li class="treeview"><a href="#"> <i class="fa fa-table"></i> -->
<!-- 							<span>Product Master</span> <span -->
<!-- 							class="pull-right-container"> <i -->
<!-- 								class="fa fa-angle-left pull-right"></i> -->
<!-- 						</span> -->
<!-- 					</a> -->
<!-- 						<ul class="treeview-menu"> -->
<!-- 							<li><a href="productMaster"><i class="fa fa-circle-o"></i>Products</a></li> -->
<!-- 						</ul></li> -->
					
<!-- 					<li class="treeview"><a href="#"> <i class="fa fa-table"></i> -->
<!-- 							<span>Add New Entity</span> <span class="pull-right-container"> -->
<!-- 								<i class="fa fa-angle-left pull-right"></i> -->
<!-- 						</span> -->
<!-- 					</a> -->
<!-- 						<ul class="treeview-menu"> -->
<!-- 							<li><a href="customerPage"><i class="fa fa-circle-o"></i>Customer</a></li> -->
<!-- 							<li><a href="dealerPage"><i class="fa fa-circle-o"></i>Dealer</a></li> -->

<!-- 						</ul></li> -->

<!-- 					<li class="treeview"><a href="#"> <i class="fa fa-table"></i> -->
<!-- 							<span>Daily Reports</span> <span class="pull-right-container"> -->
<!-- 								<i class="fa fa-angle-left pull-right"></i> -->
<!-- 						</span> -->
<!-- 					</a> -->
<!-- 						<ul class="treeview-menu"> -->
<!-- 							<li><a href="dailyEntryReports"><i -->
<!-- 									class="fa fa-circle-o"></i>Show Daily Reports</a></li> -->

<!-- 						</ul></li> -->


<!-- 					<li class="treeview"><a href="#"> <i class="fa fa-folder"></i> -->
<!-- 							<span>Purchase</span> <span class="pull-right-container"> -->
<!-- 								<i class="fa fa-angle-left pull-right"></i> -->
<!-- 						</span> -->
<!-- 					</a> -->
<!-- 						<ul class="treeview-menu"> -->
<!-- 							<li><a href="dailyPurchase"><i class="fa fa-circle-o"></i> -->
<!-- 									Daily Purchase</a></li> -->
<!-- 						</ul></li> -->
				</ul>
			
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

	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/app.min.js"></script>
	<!-- Sparkline -->
	
	<script src="plugins/sparkline/jquery.sparkline.min.js"></script>

	<!-- AdminLTE for demo purposes -->
	
	<script src="dist/js/demo.js"></script>


	<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>

	<script type="text/javascript">
		
	</script>
</body>
</html>