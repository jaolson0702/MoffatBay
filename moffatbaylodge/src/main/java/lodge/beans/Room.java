/* Team Delta
 * Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
 * Authors: Bryce Kellas
 * 
 */
package lodge.beans;

import java.io.Serializable;
import java.math.BigDecimal;

public class Room implements Serializable {
    private int id;
    private String roomSize;
    private boolean available;
    private BigDecimal price;

    // Contructor
    public Room() {
        this.id = 0;
        this.roomSize = "";
        this.available = false;
        this.price = null;
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getRoomSize() { return roomSize; }
    public void setRoomSize(String roomSize) { this.roomSize = roomSize; }
    public boolean isAvailable() { return available; }
    public void setAvailable(boolean available) { this.available = available; }
    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }
}