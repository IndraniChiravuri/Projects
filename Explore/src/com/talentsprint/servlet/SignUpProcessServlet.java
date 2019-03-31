package com.talentsprint.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.talentsprint.dao.CustomerDao;
import com.talentsprint.model.Customer;

@WebServlet("/SignUpProcessServlet")
public class SignUpProcessServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		String firstName = request.getParameter("p1");
		String lastName = request.getParameter("p2");
		String email = request.getParameter("p3");
		String contact = request.getParameter("p4");
		String gender = request.getParameter("p5");
		String password = request.getParameter("p6");
		Customer customer = new Customer();
		customer.setFirstName(firstName);
		customer.setLastName(lastName);
		customer.setEmail(email);
		customer.setContact(contact);
		customer.setGender(gender);
		customer.setPassword(password);
		CustomerDao customerDao = new CustomerDao();
		boolean status = customerDao.insertNewCustomer(customer);
		if (status) {
			out.write("{\"status\": \"success\"}");
		} else {
			out.write("{\"status\": \"failure\"}");
		}
	}
}