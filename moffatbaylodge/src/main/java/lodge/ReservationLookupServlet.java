/* Team Delta
 * Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
 * Authors: Bryce Kellas, Jared Olson
 * 
 * Servlet controller to handle reservation requests and validations.
 * Adapted from: Beginning Jakarta EE Web Development, Third Edition - 2020 - Authors: Luciano Manelli, Giulio Zambon
 *      Accessed 9/2/2023
 * 
 */
package lodge;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import lodge.models.DataManager;

import java.util.ArrayList;
import lodge.beans.Room;
import lodge.beans.Reservation;


@WebServlet(name = "ReservationLookupServlet", urlPatterns = {"/lookup/*"})
public class ReservationLookupServlet extends jakarta.servlet.http.HttpServlet {
    
    
    public ReservationLookupServlet() {
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
        
        // Set dataManager and password hasher
        DataManager dm = (DataManager)getServletContext().getAttribute("dataManager");

        String keyword = request.getParameter("search");

        ArrayList<Reservation> reservations = dm.getReservations(keyword);

        if (request.getParameter("searchby").equals("email")) {
            
            // Redirect to form again if no reservation found
            try {
                reservations.get(0);
            } catch (IndexOutOfBoundsException e) {
                request.setAttribute("reserror","No reservations found.");
                RequestDispatcher req = request.getRequestDispatcher("?action=reservationlookup");
                req.include(request, response);
            }

            ArrayList<Room> rooms = new ArrayList<>();
            for (Reservation res : reservations) {
                rooms.add(dm.getRoom(res.getRoomsId()));
            }

            // Forward to lookup to display results
            request.setAttribute("reservations", reservations);
            request.setAttribute("rooms", rooms);
            RequestDispatcher req = request.getRequestDispatcher("?action=reservationlookup");
            req.forward(request, response);
            
        }  
        if (request.getParameter("searchby").equals("resid")) {
            Reservation reservation = dm.getReservation(Integer.parseInt(keyword));
            
            // Redirect to form again if no reservation found
            if (reservation == null) {
                request.setAttribute("reserror","No reservations found.");
                RequestDispatcher req = request.getRequestDispatcher("?action=reservationlookup");
                req.include(request, response);
            }

            reservations.add(reservation);

            ArrayList<Room> rooms = new ArrayList<>();
            for (Reservation res : reservations) {
                rooms.add(dm.getRoom(res.getRoomsId()));
            }

            // Forward to lookup to display results
            request.setAttribute("reservations", reservations);
            request.setAttribute("rooms", rooms);
            RequestDispatcher req = request.getRequestDispatcher("?action=reservationlookup");
            req.forward(request, response);
        } else {

        }
    }
}
