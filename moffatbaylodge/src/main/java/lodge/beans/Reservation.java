/* Team Delta
 * Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
 * Authors: Jared Olson
 * 
 */
package lodge.beans;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;

public class Reservation implements Serializable {
    int id;
    int roomsId;
    int customersId;
    int guestCount;
    Date checkIn;
    Date checkOut;
    int numberOfNights;

    // Constructor
    public Reservation() {
        this.id = 0;
        this.roomsId = 0;
        this.customersId = 0;
        this.guestCount = 0;
        this.checkIn = Date.valueOf(LocalDate.now());
        this.checkOut = Date.valueOf(LocalDate.now());
        this.numberOfNights = 0;
    }

    // Getters and Setters
    public int getId() {return id;}
    public void setId(int id) {this.id = id;}
    public int getRoomsId() {return roomsId;}
    public void setRoomsId(int roomsId) {this.roomsId = roomsId;}
    public int getCustomersId() {return customersId;}
    public void setCustomersId(int customersId) {this.customersId = customersId;}
    public void setCustomersId(String customersId) {this.customersId = Integer.parseInt(customersId);}
    public int getGuestCount() {return guestCount;}
    public void setGuestCount(int guestCount) {this.guestCount = guestCount;}
    public void setGuestCount(String guestCount) {this.guestCount = Integer.parseInt(guestCount);}
    public Date getCheckIn() {return checkIn;}
    public void setCheckIn(Date checkIn) {this.checkIn = checkIn;}
    public void setCheckIn(String checkIn) {this.checkIn = Date.valueOf(checkIn);}
    public Date getCheckOut() {return checkOut;}
    public void setCheckOut(String checkOut) {this.checkOut = Date.valueOf(checkOut);}
    public void setCheckOut(Date checkOut) {this.checkOut = checkOut;}
    public int getNumberOfNights() { return this.numberOfNights; }
    public void setNumberOfNights(int numberOfNights) {this.numberOfNights = numberOfNights;}
}
