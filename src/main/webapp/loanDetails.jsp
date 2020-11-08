<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loan Status</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<br>
	<div align="left">
	<form action="user?action=displaystatus" method="post">
			<div>
				<label  style="color: blue" for=loanName>Loan Name:</label> 	
				<label  style="color: black" for=loanNameValue><%= request.getAttribute("loanName") %></label> 
			</div>
			<br>
			<div>
				<label  style="color: blue" for=loanAppNo>Loan App No:</label> 	
				<label  style="color: black" for=loanAppNoValue><%= request.getAttribute("loanAppNo") %></label> 
			</div>
			<br>
			<div>
				<label  style="color: blue" for=loanStatus>Loan Status:</label> 	
				<label  style="color: black" for=loanStatusValue><%= request.getAttribute("loanStatus") %></label> 
			</div>
			<br>
			
	<jsp:include page="footer.jsp"/>
	</form>
	</div>
</body>
</html>
