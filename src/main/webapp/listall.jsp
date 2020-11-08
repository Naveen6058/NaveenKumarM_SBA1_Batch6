<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page import="com.iiht.evaluation.eloan.model.LoanInfo" %>
 <%@ page import="java.util.ArrayList" %>
 <%@ page import="java.util.ListIterator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display All Loans</title>
</head>
<body>
<jsp:include page="header.jsp"/>
	<!-- write code to display all the loan details 
             which are received from the admin controllers' listall method
	-->
	<div align="right"><a href="index.jsp">Logout</a></div>
	<div align="right"><a href="adminhome1.jsp">Home Page</a></div>
	
	<h2 align="center">List of Applications</h2>
	<div>
		<table>
			<tr>
				<th>Loan Application Number</th>
				<th>Loan Purpose</th>
				<th>Loan Amount requested</th>
				<th>Application Date</th>
				<th>Business Structure</th>
				<th>Business Indicator</th>
				<th>Applicant Address</th>
				<th>Applicant Email</th>
				<th>Applicant Mobile Number</th>
				<th>Application Status</th>
			</tr>
			<%
				@SuppressWarnings("unchecked")
				ArrayList<LoanInfo> loanInfo = (ArrayList<LoanInfo>)request.getAttribute("loaninfo");
				ListIterator<LoanInfo> itr = loanInfo.listIterator();
				while(itr.hasNext()) {
					LoanInfo loandetail = itr.next();
			%>
			<tr>
				<td><%= loandetail.getApplno()%></td>
				<td><%= loandetail.getPurpose()%></td>
				<td><%= loandetail.getAmtrequest()%></td>
				<td><%= loandetail.getDoa()%></td>
				<td><%= loandetail.getBstructure()%></td>
				<td><%= loandetail.getBindicator()%></td>
				<td><%= loandetail.getAddress()%></td>
				<td><%= loandetail.getEmail()%></td>
				<td><%= loandetail.getMobile()%></td>
				<td><%= loandetail.getStatus()%></td>
			</tr>
			<%} %>
		</table>
		
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>