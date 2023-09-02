/* Team Delta
 * Authors: Bryce Kellas
 * 
 * Servlet controller to handle requests
 * Adapted from: Beginning Jakarta EE Web Development, Third Edition - 2020 - Authors: Luciano Manelli, Giulio Zambon
 *      Accessed 9/2/2023
 * 
 * TODO: Update doPost method
 */

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lodge.models.DataManager;

@WebServlet(name = "LodgeServlet", urlPatterns = {"/lodge/*"})
public class LodgeServlet extends jakarta.servlet.http.HttpServlet {
  
    //private static final long serialVersionUID = 1L;

    public LodgeServlet() {
        super();
    }

    public void init(ServletConfig config) throws ServletException {
        System.out.println("*** initializing controller servlet.");
        super.init(config);

        DataManager dataManager = new DataManager();
        dataManager.setDbURL(config.getInitParameter("dbURL"));
        dataManager.setDbUserName(config.getInitParameter("dbUserName"));
        dataManager.setDbPassword(config.getInitParameter("dbPassword"));

        ServletContext context = config.getServletContext();
        context.setAttribute("base", config.getInitParameter("base"));
        context.setAttribute("imageURL", config.getInitParameter("imageURL"));
        context.setAttribute("dataManager", dataManager);

        try {  // load the database JDBC driver
            Class.forName(config.getInitParameter("jdbcDriver"));
        }
        catch (ClassNotFoundException e) {
            System.out.println(e.toString());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    // TODO: Update for Registration and Login
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        String base = "/jsp/";
        String url = base + "index.jsp";
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "search": 
                    url = base + "SearchOutcome.jsp";
                    break;
                case "selectCatalog":
                    url = base + "SelectCatalog.jsp";
                    break;
                case "bookDetails":
                    url = base + "BookDetails.jsp";
                    break;
                case "checkOut":
                    url = base + "Checkout.jsp";
                    break;
                case "orderConfirmation":
                    url = base + "OrderConfirmation.jsp";
                    break;
                default:
                    if (action.matches("(showCart|(add|update|delete)Item)"))
                        url = base + "ShoppingCart.jsp";
                    break;
            }
        }
    RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
        requestDispatcher.forward(request, response);
    }
}
