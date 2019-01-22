<!DOCTYPE html>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="style/bootstrap.min.css">
<link rel="stylesheet" href="style/style.css">
<title>STTM Login</title>
</head>

<body class="login-page-body">

	<div class="container h-100">
		<div class="row align-items-center h-100">
			<div class="col-12 form-container">
				<div class="row">
					<div class="col-6 logo-section text-center">

						<img src="assets/images/sttm-logo.png" alt="" srcset=""
							class="img-fluid">
						<h5 class="text-white">ETIM and Pass system for</h5>
						<h1 class="text-white">State Transport Ticketing Management</h1>

					</div>
					<div class="col-6">
						<div class="row align-items-center h-100">
							<div class="col">
									<c:url var="login" value="loginAuth" />
									<form:form id="loginform" modelAttribute="login" method="post" action="${login}">
									<div class="form-group">
										<label for="username">User Name</label>
										<!-- 										<input -->
										<!-- 											type="email" class="form-control" id="username" name="username" -->
										<!-- 											aria-describedby="emailHelp" placeholder="User Name"> -->
										<form:input path="userName" class="form-control"
											placeholder="UserName" />

									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Password</label>
										<!-- 										 <input -->
										<!-- 											type="password" class="form-control" -->
										<!-- 											id="password" name="password" placeholder="Password"> -->
										<form:password path="password" class="form-control"
											placeholder="Password" />
									</div>
									<button type="submit" class="btn btn-primary btn-block">Login</button>
									<div class="text-center">
										<a href="">Forgot Password?</a>
									</div>
									</form:form>
							</div>

						</div>

					</div>
				</div>

			</div>



		</div>
	</div>
</body>

</html>