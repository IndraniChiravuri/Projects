package com.talentsprint.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.talentsprint.model.Customer;

public class CustomerDao {
	public boolean insertNewCustomer(Customer customer) {
		boolean status = false;
		Connection con = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_db", "root", "root");
			stmt = con.createStatement();
			String sql = "INSERT INTO customer_information(firstName, lastName, email, contact, gender, password) VALUES('"
					+ customer.getFirstName() + "','" + customer.getLastName() + "','" + customer.getEmail() + "','"
					 + customer.getContact() + "','"  + customer.getGender() +"','" + customer.getPassword() + "')";
			System.out.println(sql);
			int row = stmt.executeUpdate(sql);
			if (row != 0) {
				status = true;
				System.out.println("hellloooo");
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

	public Customer searchCustomer(String email, String password) {
		Customer customer = null;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_db", "root", "root");
			stmt = con.createStatement();
			String sql = "SELECT * FROM customer_information WHERE email='" + email + "' AND password ='" + password
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				customer = new Customer();
				customer.setFirstName(rs.getString(1));
				customer.setLastName(rs.getString(2));
				customer.setGender(rs.getString(3));
				customer.setEmail(rs.getString(4));
				customer.setContact(rs.getString(5));
				customer.setPassword(rs.getString(6));
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
		return customer;
	}
}