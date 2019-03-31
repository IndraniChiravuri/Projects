package com.talentsprint.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.talentsprint.dao.ProductDao;
import com.talentsprint.model.Room;

/**
 * Servlet implementation class AddBookServlet
 */
@WebServlet("/AddRoomServlet")
public class AddRoomServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		String location = request.getParameter("p1");
		String hotel = request.getParameter("p2");
		int beds = Integer.parseInt(request.getParameter("p3"));
		int price = Integer.parseInt(request.getParameter("p4"));
		Room room = new Room();
		room.setLocation(location);
		room.setHotel(hotel);
		room.setBeds(beds);
		room.setPrice(price);
		ProductDao ProductDao = new ProductDao();
		boolean status = ProductDao.insertNewRoom(room);
		if (status) {
			out.write("{\"status\": \"success\"}");
		} else {
			out.write("{\"status\": \"failure\"}");
		}
	}

}
