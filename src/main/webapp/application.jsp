<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loan Application Form</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body onload="myFunction()">
<!-- write the html code to accept laon info from user and send to placeloan servlet -->

	<jsp:include page="header.jsp" />
	<br>
	<div align="left">
	<form action="user?action=placeloan" method="post">
			<div>
				<label  style="color: blue" for=loanName>Loan Name</label> 	
				<input  style="color: black" type="text" name="loanName"></input>
			</div>
			<br>
			<div>
			<%@page import="java.util.*" %>
			<%
			Random rand = new Random();
			int n = rand.nextInt(90000) + 10000;
			%>
				<label  style="color: blue" for=loanAppNo>Application Number</label> 
					
				<input  style="color: black" type="text" name="loanAppNo" value="<%=n%>"></input>
			</div>
			<br>
			<div>
				<label  style="color: blue" for=loanAmt>Loan Amount</label> 	
				<input  style="color: black" type="text" name="loanAmt"></input>
			</div>
			<br>
			<div>
			
				<label  style="color: blue" for=loanAppDate>Loan Application Date</label> 	
				<input  style="color: black" type="text" name="loanAppDate" value="<%= (new java.util.Date()).toLocaleString()%>"></input>
			</div>
			<br>
			<div>
				<label  style="color: blue" for=businessStructure>Business Structure</label> 	
				<!--<input  style="color: black" type="text" name="businessStructure"></input>-->
				<select name="businessStructure" id="businessStructure">
  					<option value="Individual">Individual</option>
  					<option value="Organization">Organization</option>
				</select>
			</div>
			<br>
			<div>
				<label  style="color: blue" for=billingIndicator>Billing Indicator</label> 	
				<!--<input  style="color: black" type="text" name="billingIndicator"></input>-->
				<select name="billingIndicator" id="billingIndicator">
  					<option value="Salaried">Salaried</option>
  					<option value="Business">Business</option>
				</select>
			</div>
			<br>
			<div>
				<label  style="color: blue" for=taxIndicator>Tax Indicator</label> 	
				<!--<input  style="color: black" type="text" name="taxIndicator"></input>-->
				<select name="taxIndicator" id="taxIndicator">
  					<option value="Yes">Yes</option>
  					<option value="No">No</option>
				</select>
			</div>
			<br>
			<div>
				<label  style="color: blue" for=contactAddress>Contact Address</label> 	
				<input  style="color: black" type="text" name="contactAddress"></input>
			</div>
			<br>
			<div>
				<label  style="color: blue" for=mobile>Mobile</label> 	
				<input  style="color: black" type="text" name="mobile"></input>
			</div>
			<br>
			<div>
				<label  style="color: blue" for=email>Email</label> 	
				<input  style="color: black" type="text" name="email"></input>
			</div>
			<br>
			<div>
			<div><input type="submit" value="Submit"> </div>
			</div>

	<jsp:include page="footer.jsp"/>
	</form>
	</div>
</body>
</html>