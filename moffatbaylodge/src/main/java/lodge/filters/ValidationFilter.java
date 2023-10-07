package lodge.filters;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import lodge.beans.Validator;



public class ValidationFilter implements Filter  {

    @Override
    public void init(FilterConfig filterConfig) { 

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println(request.getParameter("form-name"));
        Validator v;

        String formName = request.getParameter("form-name");
        boolean b1;
        boolean b2;
        boolean b3;
        boolean b4;
        boolean b5;

        if (formName != null) {
            switch (formName) {
                case "register": // Validate: first name, last name, phone, email, password
                    v = new Validator();
                    b1 = v.isFirstNameValid(request.getParameter("firstname"));
                    b2 = v.isLastNameValid(request.getParameter("lastname"));
                    b3 = v.isPhoneValid(request.getParameter("phone"));
                    b4 = v.IsEmailValid(request.getParameter("email"));
                    b5 = v.isPasswordValid(request.getParameter("psw"));
                    if (!b1 || !b2 || !b3 || !b4 || !b5) {
                        ArrayList<String> errors = v.getErrorMessages();
                        request.setAttribute("errors", errors);
                        request.setAttribute("inputs", new String[] {
                                                                request.getParameter("firstname"), request.getParameter("lastname"),
                                                                request.getParameter("phone"),request.getParameter("email")});
                        RequestDispatcher rd = request.getRequestDispatcher("?action=registration");
                        rd.include(request, response);
                    }
                    break;

                case "login": // Validate: email, password
                    v = new Validator();
                    b1 = v.IsEmailValid(request.getParameter("username"));
                    b2 = v.isPasswordValid(request.getParameter("password"));
                    if (!b1 || !b2 ) {
                        ArrayList<String> errors = v.getErrorMessages();
                        request.setAttribute("errors", errors);
                        RequestDispatcher rd = request.getRequestDispatcher("?action=login");
                        rd.include(request, response);
                    }
                    break;

                case "reserve": // Validate: checkin, checkout, number of guests, room size
                    v = new Validator();
                    b1 = v.isDateValid(request.getParameter("checkin"), request.getParameter("checkout"));
                    //b2 = v.isGuestValid(request.getParameter("guestcount"));
                    //b3 = v.IsRoomValid(request.getParameter("roomsize"));
                    if (!b1) {
                        ArrayList<String> errors = v.getErrorMessages();
                        request.setAttribute("errors", errors);
                        RequestDispatcher rd = request.getRequestDispatcher("?action=reservation");
                        rd.include(request, response);
                    }
                    break;

                case "lookup": // Validate: reservation id or email
                    v = new Validator();
                    b1 = v.isSearchValid(request.getParameter("searchby"));

                    if (b1) {    
                        if (request.getParameter("searchby") == "resid") {
                            b1 = v.isResIDValid(request.getParameter("resid"));
                        } else if (request.getParameter("searchby") == "email") {
                            b1 = v.IsEmailValid(request.getParameter("email"));
                        }
                        if (!b1) {
                            ArrayList<String> errors = v.getErrorMessages();
                            request.setAttribute("errors", errors);
                            RequestDispatcher rd = request.getRequestDispatcher("?action=reservationlookup");
                            rd.include(request, response);
                        }
                    }
                    break; 

                default:
                    break;
            }
        }
        chain.doFilter(request, response);
    }
}
