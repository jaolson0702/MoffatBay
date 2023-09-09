/* Team Delta
 * Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
 * Authors: Bryce Kellas, Jared Olson
 * 
 * Servlet controller to handle registration requests and validations.
 * Adapted from: Beginning Jakarta EE Web Development, Third Edition - 2020 - Authors: Luciano Manelli, Giulio Zambon
 *      Accessed 9/2/2023
 * 
 * TODO: Register: Use JavaScript for form validations?
 */
package lodge;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.spec.InvalidKeySpecException;

import org.apache.commons.lang3.StringUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lodge.beans.Customer;
import lodge.models.DataManager;


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

        // Set dataManager and pasword hasher
        DataManager dm = (DataManager)getServletContext().getAttribute("dataManager");
        
        
    }

}
