<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<spring:url
	value="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css"
	var="datatables" />
<spring:url
	value="https://cdn.datatables.net/responsive/2.2.0/css/responsive.bootstrap.min.css"
	var="datatables1" />

<script type="text/javascript"
	src="https://cdn.datatables.net/responsive/2.2.0/js/dataTables.responsive.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/responsive/2.2.0/js/responsive.bootstrap.min.js"></script>
<link rel="stylesheet" href="${datatables}" />
<link rel="stylesheet" href="${datatables1}" />
<script type="text/javascript">
	$(document).ready(function() {
		alert("Hii");
		var cnt = 0;
		var selValue;
		var schedule = [];
		var countRecords = 0;
		var t = $('#example').DataTable({
			"responsive" : true,
			"ajax" : 'springPaginationDataTables',
			columns : [

			{
				data : 'busStopCode'
			}, {
				data : 'busStopName'
			}, {
				data : 'busStopAdd'
			}, {
				data : 'busStopState'
			}, {
				data : 'busStopStatus'
			}

			],

			"createdRow" : function(row, data, dataIndex) {

				$(row).attr("id", "tblRow_" + (cnt++));

			},
			order : [ [ 1, 'asc' ] ],
			buttons : [ 'excel', 'print' ],
			destroy : true,
			dom : 'Bfrtip'
		});

	});
</script>

<!-- </head> -->
<body>

	<div class="row" style="height: 60%; width: 100%">
		<!-- 	   <div class="col-md-1"> -->
		<!-- 	   </div> -->
		<div class="col-md-12">

			<div class="box box-info">
				<div class="box-header with-border">
					<h3 class="box-title">Bus Stop</h3>

					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool"
							data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button type="button" class="btn btn-box-tool"
							data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="table-responsive">
						<form:form action="" method="GET">
							<table width="100%" style="border: 3px;">
								<tr>
									<td>
										<table id="example" class="display responsive no-wrap"
											cellspacing="0" width="60%">
											<thead>
												<tr>
													<th>Bus Stop Code</th>
													<th>Bus Stop Name</th>
													<th>Bus Stop Address</th>
													<th>Bus Stop State</th>
													<th>Bus Stop Status</th>

												</tr>
											</thead>
										</table>
									</td>
								</tr>
							</table>

						</form:form>
					</div>
					<!-- /.table-responsive -->
				</div>

			</div>
		</div>
		<!-- 	<div class="col-md-1"> -->
		<!--    	</div> -->
	</div>
</body>
</html>
