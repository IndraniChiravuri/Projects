package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Job;


public class ProductDao {
	public ArrayList<Job> selectAllRooms() {
		ArrayList<Job> roomsCollection = new ArrayList<Job>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/internshala", "root", "root");
			stmt = con.createStatement();
			String sql = "SELECT * FROM job";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Job room = new Job();
				room.setCompany(rs.getString(1));
				room.setStipend(rs.getString(2));
				room.setPlace(rs.getString(3));
				room.setImage(rs.getString(4));
				roomsCollection.add(room);
			}
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
		return roomsCollection;
	}
	
	public boolean insertNewRoom(Job job) {
		boolean status = false;
		Connection con = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/internshala", "root", "root");
			stmt = con.createStatement();
			String sql = "INSERT INTO room(company,stipend,place,image) VALUES('"
					+ job.getCompany() + "','" + job.getStipend() + "','" + job.getPlace() + "','"
					+ job.getImage() + "')";
			int row = stmt.executeUpdate(sql);
			if (row != 0) {
				status = true;
			}
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
		return status;
	}

}

