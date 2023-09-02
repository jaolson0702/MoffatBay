/* Team Delta
 * Authors: Bryce Kellas
 * 
 * Supplemental class to Customer. Handles connection to database
 */

 package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Customer;


public class CustomerPeer {
  	public static ArrayList<Customer> searchCustomers(DataManager dataManager, String keyword) {
		ArrayList<Customer> customers = new ArrayList<Customer>();
		Connection connection = dataManager.getConnection();
		if (connection != null) {
			try {
				Statement s = connection.createStatement();
				String sql = "select customer_id, title, author, price from customers"
					+ " where title like '%" + keyword.trim() + "%'"
					+ " or author like '%" + keyword.trim() + "%'";
				try {
					ResultSet rs = s.executeQuery(sql);
					try {
						while (rs.next()) {
							Customer customer = new Customer();
							customer.setId(rs.getString(1));
							customer.setTitle(rs.getString(2));
							customer.setAuthor(rs.getString(3));
							customer.setPrice(rs.getDouble(4));
							customers.add(customer);
						}
					} finally { rs.close(); }
				} finally { s.close(); }
			} catch (SQLException e) {
				System.out.println("Could not search for customers:" + e.getMessage());
			} finally {
				dataManager.putConnection(connection);
			}
		}
    	return customers;
	}
  
  	public static ArrayList<Customer> getCustomersByCategory(DataManager dataManager, String categoryId) {
		
		ArrayList<Customer> customers = new ArrayList<Customer>();
		Connection connection = dataManager.getConnection();

		if (connection != null) {
			try {
				Statement s = connection.createStatement();
				String sql = "select customer_id, title, author, price from customers"
					+ " where category_id=" + categoryId;
				try {
					ResultSet rs = s.executeQuery(sql);
					try {
						while (rs.next()) {
							Customer customer = new Customer();
							customer.setId(rs.getString(1));
							customer.setTitle(rs.getString(2));
							customer.setAuthor(rs.getString(3));
							customer.setPrice(rs.getDouble(4));
							customers.add(customer);
						}
					} finally { rs.close(); }
				} finally { s.close(); }
			} catch (SQLException e) {
				System.out.println("Could not get customers: " + e.getMessage());
			} finally {
				dataManager.putConnection(connection);
			}
		}
		return customers;
    }

  	public static Customer getCustomerById(DataManager dataManager, String customerID) {
		Customer customer = null;
		Connection connection = dataManager.getConnection();
		if (connection != null) {
			try {
				Statement s = connection.createStatement();
				String sql = "select customer_id, title, author, price from customers"
					+ " where customer_id=" + customerID;
				try {
					ResultSet rs = s.executeQuery(sql);
					if (rs.next()) {
						customer = new Customer();
						customer.setId(rs.getString(1));
						customer.setTitle(rs.getString(2));
						customer.setAuthor(rs.getString(3));
						customer.setPrice(rs.getDouble(4));
					}
				} finally { s.close(); }
			} catch (SQLException e) {
				System.out.println("Could not get customer: " + e.getMessage());
			} finally {
				dataManager.putConnection(connection);
			}
		}
		return customer;
	}
}

