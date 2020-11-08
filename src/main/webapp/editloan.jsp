<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Loan Application</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h3>Edit Loan</h3>
		<form action="user?action=editloan" method="post">
			<div>
				<label  style="color: blue" for="userName">UserName</label> 	
				<input  style="color: black" type="text" name="userName"></input>
			</div>
			<br>
			<div>
				<input  style="color: black" type="submit" value="search" >
			</div>
			<br>
		</form>
	</div>
<jsp:include page="footer.jsp"/>

</body>
</html>