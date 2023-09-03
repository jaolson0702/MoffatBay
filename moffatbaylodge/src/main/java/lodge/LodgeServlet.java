/* Team Delta
 * Authors: Bryce Kellas
 * 
 * Servlet controller to handle requests
 * Adapted from: Beginning Jakarta EE Web Development, Third Edition - 2020 - Authors: Luciano Manelli, Giulio Zambon
 *      Accessed 9/2/2023
 * 
 * TODO: Validate password using HashPassword
 * TODO: Update doPost method
 */

package lodge;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lodge.beans.Customer;
import lodge.models.DataManager;

@WebServlet(name = "LodgeServlet", urlPatterns = {"/lodge/*"})
public class LodgeServlet extends jakarta.servlet.http.HttpServlet {
  
    //private static final long serialVersionUID = 1L;

    public LodgeServlet() {
        super();
    }

    private DataManager dataManager = new DataManager();

    public void init(ServletConfig config) throws ServletException {
        System.out.println("*** initializing controller servlet.");
        super.init(config);
        dataManager.setDbURL(config.getInitParameter("dbURL"));
        dataManager.setDbUserName(config.getInitParameter("dbUserName"));
        dataManager.setDbPassword(config.getInitParameter("dbPassword"));

        ServletContext context = config.getServletContext();
        context.setAttribute("base", config.getInitParameter("base"));
        context.setAttribute("imageURL", config.getInitParameter("imageURL"));
        context.setAttribute("dataManager", dataManager);

        try {  // load the database JDBC driver
            Class.forName(getServletContext().getInitParameter("jdbcDriver"));
        }
        catch (ClassNotFoundException e) {
            System.out.println(e.toString());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        String base = "/views/";
        String url = "index.html";
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "login": 
                    url = base + "login.jsp";
                    break;
                case "registration":
                    url = base + "registration.jsp";
                    Customer c = new Customer();
                    c.setFirstName(request.getParameter("firstname"));
                    c.setLastName(request.getParameter("lastname"));
                    c.setEmail(request.getParameter("email"));
                    c.setPhoneNumber(request.getParameter("phone"));
                    c.setPassword(request.getParameter("psw"));
                    dataManager.insertCustomer(c);
                    break;
                default:
                    break;
            }
        }
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
        requestDispatcher.forward(request, response);
    }
}
