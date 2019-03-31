package com.talentsprint.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.talentsprint.dao.CustomerDao;
import com.talentsprint.model.Customer;

@WebServlet("/SignInProcessServlet")
public class SignInProcessServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("p1");
		String password = request.getParameter("p2");
		CustomerDao customerDao = new CustomerDao();
		Customer customer = customerDao.searchCustomer(email, password);
		String jsonFormat = "{\"customer\":[";
		if (customer != null) {
			Gson gson = new Gson();
			jsonFormat += gson.toJson(customer);
		}
		
		jsonFormat += "]}";
		out.write(jsonFormat);
	}
}