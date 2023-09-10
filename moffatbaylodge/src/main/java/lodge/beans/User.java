/* Team Delta
 * Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
 * Authors: Bryce Kellas
 * 
 */
package lodge.beans;

public class User {
    private String name;
    private int id;

    // Contructors
    public User() {
        this.name = "";
        this.id = 0;
    }
    public User(String name, int id) {
        this.name = name;
        this.id = id;
    }
    
    // Getters and Setters
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
}
