package com.iiht.evaluation.eloan.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iiht.evaluation.eloan.dao.ConnectionDao;

@WebServlet("/user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ConnectionDao connDao;
	private String UserName = "";

	public void setConnDao(ConnectionDao connDao) {
		this.connDao = connDao;
	}

	public void init(ServletConfig config) {
		String jdbcURL = config.getServletContext().getInitParameter("jdbcUrl");
		String jdbcUsername = config.getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = config.getServletContext().getInitParameter("jdbcPassword");
		System.out.println(jdbcURL + jdbcUsername + jdbcPassword);
		this.connDao = new ConnectionDao(jdbcURL, jdbcUsername, jdbcPassword);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		String viewName = "";
		try {
			switch (action) {
			case "registernewuser":
				viewName = registernewuser(request, response);
				break;
			case "validate":
				viewName = validate(request, response);
				break;
			case "placeloan":
				viewName = placeloan(request, response);
				break;

			case "editLoanProcess":
				viewName = editLoanProcess(request, response);
				break;

			case "application":
				viewName = application(request, response);
				break;
			case "trackloan":
				viewName = trackloan(request, response);
				break;
			case "editloan":
				viewName = editloan(request, response);
				break;
			case "displaystatus":
				viewName = displaystatus(request, response);
				break;
			default:
				viewName = "notfound.jsp";
				break;
			}
		} catch (Exception ex) {

			throw new ServletException(ex.getMessage());
		}
		RequestDispatcher dispatch = request.getRequestDispatcher(viewName);
		dispatch.forward(request, response);
	}

	private String validate(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String loginId = request.getParameter("loginId");
		String password = request.getParameter("password");
		String pageToLoad = "";

		String query = "SELECT UserName, Password FROM UserLoginDetails where UserName='" + loginId + "' and "
				+ "Password='" + password + "';";
		Connection conn = connDao.connect();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query);

		String Password = "";
		while (rs.next()) {
			UserName = rs.getString("UserName");
			Password = rs.getString("Password");
		}
		st.close();

		if (loginId.contentEquals("admin") && password.contentEquals("admin")) {
			pageToLoad = "adminhome1.jsp";
		} else if (loginId.contentEquals(UserName) && password.contentEquals(Password)) {
			pageToLoad = "userhome1.jsp";
		} else {
			pageToLoad = "notfound.jsp";
		}

		return pageToLoad;
	}

	private String placeloan(HttpServletRequest request, HttpServletResponse response) throws SQLException {

		String loanName = request.getParameter("loanName");
		String loanAppNo = request.getParameter("loanAppNo");
		String loanAmt = request.getParameter("loanAmt");
		String loanAppDate = request.getParameter("loanAppDate");
		String businessStructure = request.getParameter("businessStructure");
		String billingIndicator = request.getParameter("billingIndicator");
		String taxIndicator = request.getParameter("taxIndicator");
		String contactAddress = request.getParameter("contactAddress");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");

		Connection conn = connDao.connect();
		Statement st = conn.createStatement();

		String insertLoanDetails = "INSERT INTO UserLoanDetails(UserName, loanName, loanAppNo,loanAmt,loanAppDate,businessStructure,"
				+ "billingIndicator,taxIndicator,contactAddress,mobile,email,LoanStatus)" + "VALUES('" + UserName
				+ "','" + loanName + "','" + loanAppNo + "','" + loanAmt + "','" + loanAppDate + "','"
				+ businessStructure + "','" + billingIndicator + "','" + taxIndicator + "','" + contactAddress + "','"
				+ mobile + "','" + email + "','" + "submitted" + "');";
		st.executeUpdate(insertLoanDetails);

		return "userhome1.jsp";
	}

	private String editLoanProcess(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String returnPage;
		String query = "SELECT * FROM UserLoanDetails where UserName='" + UserName + "';";
		String LoanStatusquery = "SELECT LoanStatus FROM UserLoanDetails where UserName='" + UserName + "';";
		Connection conn = connDao.connect();
		Statement st = conn.createStatement();
		ResultSet rss = st.executeQuery(LoanStatusquery);
		String LoanStatus = "";
		while (rss.next()) {
			LoanStatus = rss.getString("LoanStatus");
		}
		if (LoanStatus.contentEquals("submitted")) {
			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {
				String loanName = rs.getString("loanName");
				String loanAppNo = rs.getString("loanAppNo");
				String loanAmt = rs.getString("loanAmt");
				String contactAddress = rs.getString("contactAddress");
				String mobile = rs.getString("mobile");
				String email = rs.getString("email");

				request.setAttribute("loanName", loanName);
				request.setAttribute("loanAppNo", loanAppNo);
				request.setAttribute("loanAmt", loanAmt);
				request.setAttribute("contactAddress", contactAddress);
				request.setAttribute("mobile", mobile);
				request.setAttribute("email", email);
			}

		
			 
			returnPage = "editloanui.jsp";
		} else {
			returnPage = "errorPage.jsp";
		}
		return returnPage;
	}

	private String registernewuser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String loginId = request.getParameter("loginId");
		String password = request.getParameter("password");
		String pageToLoad = "";

		String query = "SELECT UserName, Password FROM UserLoginDetails where UserName='" + loginId + "' and "
				+ "Password='" + password + "';";
		Connection conn = connDao.connect();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query);

		while (rs.next()) {
			UserName = rs.getString("UserName");

		}

		if (loginId.contentEquals(UserName)) {
			pageToLoad = "notfound.jsp";
		} else if (!loginId.contentEquals(UserName)) {

			String insertLoginQuery = "INSERT INTO UserLoginDetails(UserID, UserName, Password) VALUES('1', '" + loginId
					+ "', " + "'" + password + "');";
			st.executeUpdate(insertLoginQuery);
			pageToLoad = "userhome1.jsp";
		} else {
			pageToLoad = "notfound.jsp";
		}
		st.close();
		return pageToLoad;
	}

	private String displaystatus(HttpServletRequest request, HttpServletResponse response) throws SQLException {

		String query = "SELECT * FROM UserLoanDetails where UserName='" + UserName + "';";
		Connection conn = connDao.connect();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query);

		while (rs.next()) {
			UserName = rs.getString("UserName");
			String loanName = rs.getString("loanName");
			String loanAppNo = rs.getString("loanAppNo");
			String loanStatus = rs.getString("LoanStatus");

			request.setAttribute("loanName", loanName);
			request.setAttribute("loanAppNo", loanAppNo);
			request.setAttribute("loanStatus", loanStatus);

		}
		return "loanDetails.jsp";
	}

	private String editloan(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		editLoanProcess(request, response);
		return "editloanui.jsp";
	}

	private String trackloan(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		displaystatus(request, response);
		return "loanDetails.jsp";
	}

	private String application(HttpServletRequest request, HttpServletResponse response) {

		return "application.jsp";
	}
}