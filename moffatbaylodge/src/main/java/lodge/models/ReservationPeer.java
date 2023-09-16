/* Team Delta
 * Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
 * Authors: Bryce Kellas
 * 
 * Supplemental class to Customer. Handles connection to database
 */

 package lodge.models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import lodge.beans.Reservation;


public class ReservationPeer {
  	public static Reservation getReservationByCustomerId(DataManager dataManager, int cusId) {
		Reservation reservation = null;
		Connection connection = dataManager.getConnection();

		if (connection != null) {
			try {
				Statement s = connection.createStatement();
				String sql = "SELECT id, rooms_id, customers_id, guest_count, check_in, check_out from bookings " +
                             "WHERE customers_id=" + cusId;
				try {
					ResultSet rs = s.executeQuery(sql);
					try {
						while (rs.next()) {
							reservation = new Reservation();
							reservation.setId(rs.getInt(1));
							reservation.setRoomsId(rs.getInt(2));
							reservation.setCustomersId(rs.getInt(3));
							reservation.setGuestCount(rs.getInt(4));
							reservation.setCheckIn(rs.getDate(5));
							reservation.setCheckOut(rs.getDate(6));
						}
					} finally { rs.close(); }
				} finally { s.close(); }
			} catch (SQLException e) {
				System.out.println("Could not search for reservation:" + e.getMessage());
			} finally {
				dataManager.putConnection(connection);
			}
		}
		return reservation;
	}
  
  	public static Reservation getReservationById(DataManager dataManager, int reservationID) {
		Reservation reservation = null;
		Connection connection = dataManager.getConnection();
		
		if (connection != null) {
			try {
				System.out.println("Reservation ID: " + reservationID);
				Statement s = connection.createStatement();
				String sql = "SELECT bookings.id, bookings.rooms_id, customers.id, bookings.guest_count, bookings.check_in, bookings.check_out, DATEDIFF(bookings.check_out, bookings.check_in) AS nights "
							+"FROM bookings "
							+"INNER JOIN customers ON bookings.customers_id = customers.id\n"
				  			+"WHERE bookings.id=" + reservationID;
				try {
					ResultSet rs = s.executeQuery(sql);
					if (rs.next()) {
						reservation = new Reservation();
                        reservation.setId(rs.getInt(1));
                        reservation.setRoomsId(rs.getInt(2));
                        reservation.setCustomersId(rs.getInt(3));
                        reservation.setGuestCount(rs.getInt(4));
                        reservation.setCheckIn(rs.getDate(5));
                        reservation.setCheckOut(rs.getDate(6));
						reservation.setNumberOfNights(rs.getInt(7));
					}
				} finally { s.close(); }
			} catch (SQLException e) {
				System.out.println("Could not get reservation: " + e.getMessage());
			} finally {
				dataManager.putConnection(connection);
			}
		}
		return reservation;
	}

	public static ArrayList<Reservation> getReservationsByCustomerEmail(DataManager dataManager, String email) {
		Reservation r = null;
		ArrayList<Reservation> reservations = new ArrayList<>();
		Connection connection = dataManager.getConnection();
		
		if (connection != null) {
			try {
				Statement s = connection.createStatement();
				String sql = "SELECT bookings.id, bookings.rooms_id, customers.id, bookings.guest_count, bookings.check_in, bookings.check_out, DATEDIFF(bookings.check_out, bookings.check_in) AS nights "
							+"FROM bookings "
							+"INNER JOIN customers ON bookings.customers_id = customers.id\n"
				  			+"WHERE customers.email = \'" + email + "\'";
				try {
					ResultSet rs = s.executeQuery(sql);
					while (rs.next()) {
						r = new Reservation();
                        r.setId(rs.getInt(1));
                        r.setRoomsId(rs.getInt(2));
                        r.setCustomersId(rs.getInt(3));
                        r.setGuestCount(rs.getInt(4));
                        r.setCheckIn(rs.getDate(5));
                        r.setCheckOut(rs.getDate(6));
						r.setNumberOfNights(rs.getInt(7));
						reservations.add(r);
					}
				} finally { s.close(); }
			} catch (SQLException e) {
				System.out.println("Could not get reservation: " + e.getMessage());
				System.out.println(e.getClass());
			} finally {
				dataManager.putConnection(connection);
			}
		}
		return reservations;
	}

	public static void insertReservation(Statement stmt, Reservation reservation) throws SQLException {
		String sql = "insert into bookings (guest_count, check_in, check_out, rooms_id, customers_id) " 
			+ "values ('"
            + reservation.getGuestCount() + "','"
            + reservation.getCheckIn() + "','"
            + reservation.getCheckOut() + "','" 
			+ reservation.getRoomsId() + "','" 
			+ reservation.getCustomersId() + "')";
        stmt.executeUpdate(sql);
	}
}

