<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Loan</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div align="right"><a href="index.jsp">Logout</a></div>
<div align="right"><a href="adminhome1.jsp">Admin Home</a></div>
	<br>
	<h4>Edit Loan</h4>
	<br>
	<div align="left">
	
			<div>
				<label  style="color: blue" for=loanName>Loan Name</label> 	
				<input  style="color: black" type="text" name="loanName" value="<%= request.getAttribute("loanName") %>"></input>
			</div>
			<br>
			<div>
				<label  style="color: blue" for=loanAppNo>Application Number</label> 	
				<input  style="color: black" type="text" name="loanAppNo" value="<%= request.getAttribute("loanAppNo") %>"></input>
			</div>
			<br>
			<div>
				<label  style="color: blue" for=loanAmt>Loan Amount</label> 	
				<input  style="color: black" type="text" name="loanAmt" value="<%= request.getAttribute("loanAmt") %>"></input>
			</div>
			<br>
			<div>
			
				<label  style="color: blue" for=loanAppDate>Loan Application Date</label> 	
				<input  style="color: black" type="text" name="loanAppDate" value="<%= (new java.util.Date()).toLocaleString()%>"></input>
			</div>
			<br>
			<div>
				<label  style="color: blue" for=businessStructure>Business Structure</label>
				<select name="businessStructure" id="businessStructure">
  					<option value="Individual">Individual</option>
  					<option value="Organization">Organization</option>
				</select>
			</div>
			<br>
			<div>
				<label  style="color: blue" for=billingIndicator>Billing Indicator</label>
				<select name="billingIndicator" id="billingIndicator">
  					<option value="Salaried">Salaried</option>
  					<option value="Business">Business</option>
				</select>
			</div>
			<br>
			<div>
				<label  style="color: blue" for=taxIndicator>Tax Indicator</label>
				<select name="taxIndicator" id="taxIndicator">
  					<option value="Yes">Yes</option>
  					<option value="No">No</option>
				</select>
			</div>
			<br>
			<div>
				<label  style="color: blue" for=contactAddress>Contact Address</label> 	
				<input  style="color: black" type="text" name="contactAddress" value="<%= request.getAttribute("contactAddress") %>"></input>
			</div>
			<br>
			<div>
				<label  style="color: blue" for=mobile>Mobile</label> 	
				<input  style="color: black" type="text" name="mobile" value="<%= request.getAttribute("mobile") %>"></input>
			</div>
			<br>
			<div>
				<label  style="color: blue" for=email>Email</label> 	
				<input  style="color: black" type="text" name="email" value="<%= request.getAttribute("email") %>"></input>
			</div>
			<br>
			
	<form action="user?action=editLoanProcess" method="post">
			<div><input type="submit" value="Submit"> </div>
			
	</form>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>