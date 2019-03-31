package com.talentsprint.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import com.talentsprint.model.Room;


public class ProductDao {
	public ArrayList<Room> selectAllRooms() {
		ArrayList<Room> roomsCollection = new ArrayList<Room>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_db", "root", "root");
			stmt = con.createStatement();
			String sql = "SELECT * FROM room";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Room room = new Room();
				room.setId(rs.getInt(1));
				room.setLocation(rs.getString(2));
				room.setHotel(rs.getString(3));
				room.setBeds(rs.getInt(4));
				room.setPrice(rs.getInt(5));
				room.setImage(rs.getString(6));
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
	
	public boolean insertNewRoom(Room room) {
		boolean status = false;
		Connection con = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_db", "root", "root");
			stmt = con.createStatement();
			String sql = "INSERT INTO room(location,hotel,beds,price,image) VALUES('"
					+ room.getLocation() + "','" + room.getHotel() + "','" + room.getBeds() + "','"
					+ room.getPrice() + "','" + room.getImage() + "')";
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

