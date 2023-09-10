/* Team Delta
 * Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
 * Authors: Bryce Kellas
 * 
 * Supplemental class to Room. Handles connection to database
 */

 package lodge.models;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import lodge.beans.Room;


public class RoomPeer {
  	public static ArrayList<Room> getAvailableRooms(DataManager dataManager, Date checkin, Date checkout, String roomSize) {
		ArrayList<Room> rooms = new ArrayList<Room>();
        Room r = new Room();
		Connection connection = dataManager.getConnection();

		if (connection != null) {
			try {
				Statement s = connection.createStatement();
                // Find rooms that are not in the bookings table for the user supplied date range
				String sql = "SELECT id, room_size, price " + //
                            "FROM Rooms AS r " + //
                            "WHERE r.room_size='"+roomSize+"' AND r.id NOT IN  " + // 
                            "      (SELECT rooms_id " + //
                            "      FROM bookings as b " + //
                            "      WHERE (b.check_in >= '" + checkin.toString() + "' AND b.check_in < '" + checkout.toString() + "') " + //
                            "      OR (b.check_out > '" + checkin.toString() + "' AND b.check_out < '" + checkout.toString() + "') " + //
                            "      OR (b.check_in < '" + checkin.toString() + "' AND b.check_out > '" + checkout.toString() + "'))";
				try {
					ResultSet rs = s.executeQuery(sql);
					try {
						while (rs.next()) {
							r.setId(rs.getInt(1));
							r.setRoomSize(rs.getString(2));
							r.setPrice(rs.getBigDecimal(3));
                            rooms.add(r);
						}
					} finally { rs.close(); }
				} finally { s.close(); }
			} catch (SQLException e) {
				System.out.println("Could not search for rooms:" + e.getMessage());
			} finally {
				dataManager.putConnection(connection);
			}
		}
		return rooms;
	}
  
  	public static Room getRoomById(DataManager dataManager, int roomId) {
		Room room = null;
		Connection connection = dataManager.getConnection();
		
		if (connection != null) {
			try {
				Statement s = connection.createStatement();
				String sql = "select id, room_size, available, price from rooms"
					+ " where id=" + roomId;
				try {
					ResultSet rs = s.executeQuery(sql);
					if (rs.next()) {
						room = new Room();
						room.setId(rs.getInt(1));
						room.setRoomSize(rs.getString(2));
						room.setAvailable(rs.getBoolean(3));
						room.setPrice(rs.getBigDecimal(4));
					}
				} finally { s.close(); }
			} catch (SQLException e) {
				System.out.println("Could not get room: " + e.getMessage());
			} finally {
				dataManager.putConnection(connection);
			}
		}
		return room;
	}

	public static void insertRoom(Statement stmt, Room room) throws SQLException {
		String sql = "insert into rooms (id, room_size, available, price) " 
			+ "values ('"
            + room.getId() + "','"
            + room.getRoomSize() + "','"
            + room.isAvailable() + "','" 
			+ room.getPrice() + "')";
        stmt.executeUpdate(sql);
	}
}

