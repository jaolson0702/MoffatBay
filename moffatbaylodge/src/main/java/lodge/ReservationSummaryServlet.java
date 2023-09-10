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

import org.apache.commons.lang3.StringUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lodge.beans.Customer;
import lodge.models.DataManager;

import java.util.List;

import java.sql.Date;

import lodge.beans.Room;
import lodge.beans.Reservation;


@WebServlet(name = "ReservationSummaryServlet", urlPatterns = {"/book/summary/*"})
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

        if (action.equals("submit")) {
            Reservation reservation = (Reservation)request.getAttribute("reservation");

            dm.insertReservation(reservation);
            RequestDispatcher req = request.getRequestDispatcher("?action=home");
            req.forward(request, response);
        }
        else {
            request.removeAttribute("reservation");
            request.removeAttribute("room");
            RequestDispatcher req = request.getRequestDispatcher("?action=book");
            req.forward(request, response);
        }
    }

}
