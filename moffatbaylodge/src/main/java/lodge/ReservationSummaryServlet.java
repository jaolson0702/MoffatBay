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
import java.math.BigDecimal;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lodge.models.DataManager;

import lodge.beans.Room;
import lodge.beans.Reservation;


@WebServlet(name = "ReservationSummaryServlet", urlPatterns = {"/summary/*"})
public class ReservationSummaryServlet extends jakarta.servlet.http.HttpServlet {
    
    
    public ReservationSummaryServlet() {
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
        
        // Set dataManager and pasword hasher
        DataManager dm = (DataManager)getServletContext().getAttribute("dataManager");

        String action = request.getParameter("action");
        System.out.println(action);

        if (action.equalsIgnoreCase("submit")) {
            System.out.println("clicked submit");
            // Reservation reservation = (Reservation)request.getAttribute("reservation");
            Reservation reservation = new Reservation();
            reservation.setCheckIn(request.getParameter("checkin"));
            reservation.setCheckOut(request.getParameter("checkout"));
            reservation.setRoomsId(Integer.parseInt(request.getParameter("roomid")));
            reservation.setCustomersId((int)session.getAttribute("userid"));
            reservation.setGuestCount(request.getParameter("guestcount"));

            // Room room = (Room)request.getAttribute("room");
            System.out.println("Room being searched for: " + reservation.getRoomsId());
            Room room = dm.getRoom(reservation.getRoomsId());
            System.out.println("Room sought for exists? " + (room != null));
            /*
            BigDecimal total = room.getPrice().multiply(BigDecimal.valueOf(reservation.getNumberOfNights()));
            request.setAttribute("total", total);
            System.out.println(total);
            */

            dm.insertReservation(reservation);
            RequestDispatcher req = request.getRequestDispatcher("?action=home");
            req.forward(request, response);
        }
        else {
            System.out.println("clicked go back");
            request.removeAttribute("reservation");
            request.removeAttribute("room");
            request.removeAttribute("total");
            RequestDispatcher req = request.getRequestDispatcher("?action=reservation");
            req.include(request, response);
        }
    }

}
