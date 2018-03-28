<%@page contentType="text/html" pageEncoding="UTF-8" import="org.elluck91.munchies.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V14</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/loginboot.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<!--  Form will be used to send data to the back-end service -->
				<form class="login100-form validate-form flex-sb flex-w" action="../RegisterAPI" method="POST">
					<span class="login100-form-title p-b-32">
						Account Login
					</span>
						<span class="txt1 p-b-11">
							Your Name
						</span>
						<div class="wrap-input100 validate-input m-b-36" data-validate = "Name is required">
							<input class="input100" type="text" name="name" >
							<span class="focus-input100"></span>
						</div>
						<span class="txt1 p-b-11">
							Your Email
						</span>
						<div class="wrap-input100 validate-input m-b-36" data-validate = "Email is required">
							<input class="input100" type="text" name="email" >
							<span class="focus-input100"></span>
						</div>
						<span class="txt1 p-b-11">
							Username
						</span>
						<div class="wrap-input100 validate-input m-b-36" data-validate = "Username is required">
							<input class="input100" type="text" name="username" >
							<span class="focus-input100"></span>
						</div>
						<span class="txt1 p-b-11">
							Password
						</span>
						<div class="wrap-input100 validate-input m-b-12" data-validate = "Password is required">
							<span class="btn-show-pass">
								<i class="fa fa-eye"></i>
							</span>
							<input class="input100" type="password" name="pass" >
							<span class="focus-input100"></span>
						</div>
						<span class="txt1 p-b-11">
							Confirm Password
						</span>
						<div class="wrap-input100 validate-input m-b-36" data-validate = "Password confirmation is required">
							<input class="input100" type="text" name="confirm pass" >
							<span class="focus-input100"></span>
						</div>
						<div class="flex-sb-m w-full p-b-48">
							<div>
								<a href="../login/login.html" class="txt3">
									Already have an account?
								</a>
							</div>
							<div>
								<a href="../index.html" class="txt3">
									Sign in as guest
								</a>
							</div>
						</div>
	
						<div class="container-login100-form-btn">
							<button name="Register" class="login100-form-btn" type="submit">
								Register
							</button>
						</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
<!--  
	<script type="text/javascript">
		document.getElementById("myLogin").onclick = function(){
			location.href ="index.html";
		};
	</script>
-->

<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>
