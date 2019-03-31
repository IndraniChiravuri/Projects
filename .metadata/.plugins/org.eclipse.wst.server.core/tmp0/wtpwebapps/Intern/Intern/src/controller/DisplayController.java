package controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import dao.ProductDao;
import model.Job;
@WebServlet("/DisplayRoomsServlet")
public class DisplayController extends HttpServlet {
protected void service(HttpServletRequest request, HttpServletResponse response) throws
ServletException, IOException {
	System.out.println("dsss");
response.setContentType("application/json");
PrintWriter out = response.getWriter();
ProductDao productDao = new ProductDao();
ArrayList<Job> roomsCollection = productDao.selectAllRooms();
System.out.println(roomsCollection);
Gson gson = new Gson();
String jsonFormat = "{\"records\":[";
for(Job room : roomsCollection) {
jsonFormat += gson.toJson(room)+", ";
}
jsonFormat = jsonFormat.substring(0, jsonFormat.lastIndexOf(','));
jsonFormat += "]}";
out.write(jsonFormat);
System.out.println(jsonFormat);
}
}