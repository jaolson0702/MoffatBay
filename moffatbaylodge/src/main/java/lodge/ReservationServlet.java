/* Team Delta
 * Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
 * Authors: Bryce Kellas, Jared Olson
 * 
 * Servlet controller to handle reservation requests and validations.
 * Adapted from: Beginning Jakarta EE Web Development, Third Edition - 2020 - Authors: Luciano Manelli, Giulio Zambon
 *      Accessed 9/2/2023
 * 
 * TODO: Register: Use JavaScript for form validations?
 */
package lodge;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lodge.models.DataManager;

import java.util.ArrayList;

import java.sql.Date;

import lodge.beans.Room;
import lodge.beans.Reservation;


@WebServlet(name = "ReservationServlet", urlPatterns = {"/book/*"})
public class ReservationServlet extends jakarta.servlet.http.HttpServlet {
    
    
    public ReservationServlet() {
        super();
    }

    public void init(ServletConfig config) throws ServletException {
        System.out.println("*** initializing reservation servlet.");
        super.init(config);

        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //doPost(request, response);
        
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Set dataManager and password hasher
        DataManager dm = (DataManager)getServletContext().getAttribute("dataManager");

        if (request.getAttribute("reservation") == null && session.getAttribute("username") != null) {
            Date checkIn = Date.valueOf(request.getParameter("checkin"));
            Date checkOut = Date.valueOf(request.getParameter("checkout"));
            System.out.println(checkIn);
            System.out.println(checkIn);
            String roomType = request.getParameter("roomsize");
            ArrayList<Room> availableRooms = dm.getAvailableRooms(checkIn, checkOut, roomType);
            Room room = availableRooms.get(0);
            
            // Set Reservation values from user input
            Reservation reservation = new Reservation();
            reservation.setCheckIn(request.getParameter("checkin"));
            reservation.setCheckOut(request.getParameter("checkout"));
            reservation.setRoomsId(room.getId());
            reservation.setCustomersId((int)session.getAttribute("userid"));
            reservation.setGuestCount(request.getParameter("guestcount"));

            System.out.println("Set request");
            request.setAttribute("reservation", reservation);
            request.setAttribute("room", room);

            // Display confirmation
            RequestDispatcher req = request.getRequestDispatcher("?action=reservationsummary");
            req.forward(request, response);
        }
        else if(request.getAttribute("reservation") != null) {
            Reservation reservation = (Reservation)request.getAttribute("reservation");
            dm.insertReservation(reservation);
            RequestDispatcher req = request.getRequestDispatcher("?action=home");
            req.forward(request, response);
        }
         else {

            // Redirect to login
            RequestDispatcher req = request.getRequestDispatcher("?action=login");
            req.forward(request, response);
        }
    }

}
