package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.User;
import dao.UserDao;

@WebServlet("/LoginProcessServlet")
public class LoginFormServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Servlet");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("pswd");
		UserDao customerDao = new UserDao();
		System.out.println("Email: " + email + "Password: " + password);
		User customer = customerDao.searchUser(email, password);
		String jsonFormat = "{\"customer\":[";
		if (customer != null) {
			Gson gson = new Gson();
			jsonFormat += gson.toJson(customer);
		}
		jsonFormat += "]}";
		out.write(jsonFormat);
	}
}
