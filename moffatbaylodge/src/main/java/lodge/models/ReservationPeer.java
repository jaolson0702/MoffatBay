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
import lodge.beans.Room;
import lodge.beans.Reservation;


public class ReservationPeer {
  	public static Reservation getReservationByCustomerId(DataManager dataManager, String keyword, int cusId) {
		Reservation reservation = null;
		Connection connection = dataManager.getConnection();

		if (connection != null) {
			try {
				Statement s = connection.createStatement();
				String sql = "SELECT id, rooms_id, customers_id, guest_count, check_in, check_out from reservations " +
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
  
  	public static Reservation getReservationById(DataManager dataManager, String reservationID) {
		Reservation reservation = null;
		Connection connection = dataManager.getConnection();
		
		if (connection != null) {
			try {
				Statement s = connection.createStatement();
				String sql = "id, rooms_id, customers_id, guest_count, check_in, check_out from reservations"
					    + " where id=" + reservationID;
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

	public static void insertReservation(Statement stmt, Reservation reservation, Room room) throws SQLException {
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

