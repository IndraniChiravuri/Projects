package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import dao.UserDao;

@WebServlet("/SignUpProcessServlet")
public class SignUpProcessServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		String	firstName = request.getParameter("fname");
		String lastName = request.getParameter("lname");
		String email = request.getParameter("email");
		String password = request.getParameter("pswd");
		System.out.println(email);

		User customer = new User();
		customer.setFirstName(firstName);
		customer.setLastName(lastName);
		customer.setEmail(email);
		customer.setPassword(password);
		System.out.println(customer.toString());
		UserDao customerDao = new UserDao();
		boolean status = customerDao.insertNewCustomer(customer);
		if(status){
			out.write("{\"status\": \"success\"}");
		}else{
			out.write("{\"status\": \"failure\"}");
		}
	}
}