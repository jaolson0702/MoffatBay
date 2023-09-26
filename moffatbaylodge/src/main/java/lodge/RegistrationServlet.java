/* Team Delta
 * Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
 * Authors: Bryce Kellas, Jared Olson
 * 
 * Servlet controller to handle registration requests and validations.
 * Adapted from: Beginning Jakarta EE Web Development, Third Edition - 2020 - Authors: Luciano Manelli, Giulio Zambon
 *      Accessed 9/2/2023
 * 
 */
package lodge;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.spec.InvalidKeySpecException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lodge.beans.Customer;
import lodge.models.DataManager;


@WebServlet(name = "RegistrationServlet", urlPatterns = {"/register/*"})
public class RegistrationServlet extends jakarta.servlet.http.HttpServlet {
    
    
    public RegistrationServlet() {
        super();
    }

    public void init(ServletConfig config) throws ServletException {
        System.out.println("*** initializing registration servlet.");
        super.init(config);

        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //doPost(request, response);
        
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Check password confirmation
        String passwordConfirmation = request.getParameter("pswcon");

        ArrayList<String> errors = new ArrayList<>();

        if (!passwordConfirmation.equals(request.getParameter("psw"))) {
            errors.add("The password and the password confirmation must be the same.");
        }

        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            RequestDispatcher rdError = request.getRequestDispatcher("?action=registration");
            rdError.include(request, response);
        }

        // Set dataManager and pasword hasher
        DataManager dm = (DataManager)getServletContext().getAttribute("dataManager");
        HashPassword hp = new HashPassword();

        // Store DB customer info in Customer bean
        Customer customer = new Customer(); 
        customer.setFirstName(request.getParameter("firstname"));
        customer.setLastName(request.getParameter("lastname"));
        customer.setEmail(request.getParameter("email"));
        customer.setPhoneNumber(request.getParameter("phone"));
        
        // Hash 
        try {
            customer.setPassword(hp.generateStrongPasswordHash(request.getParameter("psw")));
        } catch (NoSuchAlgorithmException e) {
            System.out.println(e.getMessage());
        } catch (InvalidKeySpecException e) {
            System.out.println(e.getMessage());
        } catch (NoSuchProviderException e) {
            System.out.println(e.getMessage());
        }

        dm.insertCustomer(customer);
        request.setAttribute("registerwelcome","Welcome: Please sign in");
        RequestDispatcher rd=request.getRequestDispatcher("?action=login");            
        rd.include(request, response);

    }

}
