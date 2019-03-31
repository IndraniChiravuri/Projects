package dao;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.User;

public class UserDao {
	public boolean insertNewCustomer(User customer) {
		boolean status = false;
		Connection con = null;
		Statement stmt = null;
		//System.out.println("Before try Entered DAO");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/internshala","root", "root");
			stmt = con.createStatement();
			String sql = "INSERT INTO user(email,password,first_name,last_name) VALUES('" +
							customer.getEmail() +
							"','" + customer.getPassword() +
							"','" + customer.getFirstName() +
							"','" + customer.getLastName() + "')";
			System.out.println("Query: "+sql);
				int row = stmt.executeUpdate(sql);
				if(row != 0) {
					status = true;
				}
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			try {
				if(stmt != null ) {
					stmt.close();
				}
				if(con != null ) {
					con.close();
				}
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
		return status;
	}
	public User searchUser(String email, String password) {
		User customer = null;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/internshala", "root", "root");
			stmt = con.createStatement();
			String sql = "SELECT * FROM user WHERE email='" + email + "' AND password='" + password
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				customer = new User();
				customer.setEmail(rs.getString(1));
				customer.setPassword(rs.getString(2));
				customer.setFirstName(rs.getString(3));
				customer.setLastName(rs.getString(4));
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
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
		System.out.println(customer.toString());
		return customer;
	}
}
