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
import java.util.concurrent.TimeUnit;
import java.sql.Date;
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
        HttpSession session = request.getSession();
        
        // Set dataManager and password hasher
        DataManager dm = (DataManager)getServletContext().getAttribute("dataManager");

        String keyword = request.getParameter("search");

        if (request.getAttribute("searchby") == "email") {
            dm.
        } else if (request.getParameter("searchby") == "resid") {

        } else {

        }
    }
}
