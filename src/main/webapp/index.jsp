<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>eLoan system</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h3>eLoan Login</h3>
		<a href="user"></a>
		<form action="user?action=validate" method="post">
			<div>
				<label  style="color: blue" for="loginId">Login ID</label> 	
				<input  style="color: blue" type="text" name="loginId"
					name="loginId"></input>
			</div>
			<br>
			<div>
				<label  style="color: blue" for="password">Password</label>
				<input  style="color: blue" type="text" name="password" name="password"></input>
			</div>
			<br>
			<div align="center">
			<div>
				<input  style="color: black" type="submit" value="Login" >
			</div>
			</div>
			<br>
			<div>
				<a href="register.jsp">New User Register Here</a>
			</div>
		</form>
	</div>
<jsp:include page="footer.jsp"/>
	<!-- write the html code to read user credentials and send it to validateservlet
	    to validate and user servlet's registernewuser method if create new user
	    account is selected
	-->

</body>
</html>