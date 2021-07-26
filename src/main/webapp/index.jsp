<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}
/* Full-width input fields */
input[type=text], [type=email], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}
/* Set a style for all buttons */
button {
	background-color: #04AA6D;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}
button:hover {
	opacity: 0.8;
}
/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}
/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}
img.avatar {
	width: 40%;
	border-radius: 50%;
}
.container {
	padding: 16px;
}
span.psw {
	float: right;
	padding-top: 16px;
}
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}
/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
}
/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}
.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}
/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}
@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}
to {
	-webkit-transform: scale(1)
}
}
@
keyframes animatezoom {
	from {transform: scale(0)
}
to {
	transform: scale(1)
}
}
/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
</head>
<script>
	function matchPassword() {
		var pw1 = document.getElementById("psw").value;
		var pw2 = document.getElementById("psw-repeat").value;
		if (pw1 != pw2) {
			alert("**Passwords are not same");
			return false;
		}
	}
</script>
<body>
	<button onclick="document.getElementById('id01').style.display='block'"
		style="width: auto;">Login</button>
	<button onclick="document.getElementById('id02').style.display='block'"
		style="width: auto;">Sign Up</button>

	<div id="id01" class="modal">

		<form class="modal-content animate" action="DoLogin" method="post">
			<div class="imgcontainer">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="close" title="Close Modal">&times;</span>

			</div>
			<%
			String email = null, password = null;
			Cookie cookies[] = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("email")) {
				email = cookie.getValue();
					}
					if (cookie.getName().equals("password")) {
				password = cookie.getValue();
					}
				}
			}
			%>
			<div class="container">
				<label for="uname"><b>Email</b></label> <input type="email"
					placeholder="Enter email" name="email" value=<%=email%> required>
				<label for="psw"><b>Password</b></label> <input type="text"
					placeholder="Enter Password" name="psw" value=<%=password%>
					required>

				<button type="submit">Login</button>
				<label> <input type="checkbox" checked="checked"
					name="remember" value="remember"> Remember me
				</label>
			</div>

			<div class="container" style="background-color: #f1f1f1">
				<button type="button"
					onclick="document.getElementById('id01').style.display='none'"
					class="cancelbtn">Cancel</button>
			</div>
		</form>
	</div>

	<div id="id02" class="modal">

		<form class="modal-content animate" action="DoRegistration"
			method="post" onsubmit="return matchPassword()">
			<div class="imgcontainer">
				<span onclick="document.getElementById('id02').style.display='none'"
					class="close" title="Close Modal">&times;</span>
			</div>
			<div class="container">
				<h1>Register</h1>
				<p>Please fill in this form to create an account.</p>
				<hr>

				<label for="email"><b>Email</b></label> <input type="email"
					placeholder="Enter Email" name="email" id="email" required>

				<label for="psw"><b>Password</b></label> <input type="password"
					placeholder="Enter Password" name="psw" id="psw" required>

				<label for="psw-repeat"><b>Repeat Password</b></label> <input
					type="password" placeholder="Repeat Password" name="psw-repeat"
					id="psw-repeat" required>
				<hr>

				<button type="submit" class="registerbtn">Register</button>
			</div>
		</form>
	</div>

	<script>
		// Get the modal
		var modal = document.getElementById('id01');
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
		var modal = document.getElementById('id02');
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>

</body>
</html>