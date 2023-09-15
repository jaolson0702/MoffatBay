package lodge.filters;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.commons.lang3.Validate;

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
        Validator v = new Validator();

        String formName = request.getParameter("form-name");
        if (formName != null) {
            switch (formName) {
                case "register": 
                    boolean b1 = v.isFirstNameValid(request.getParameter("firstname"));
                    boolean b2 = v.isLastNameValid(request.getParameter("lastname"));
                    boolean b3 = v.isPhoneValid(request.getParameter("phone"));
                    boolean b4 = v.IsEmailValid(request.getParameter("email"));
                    boolean b5 = v.isPasswordValid(request.getParameter("psw"));
                    if (!b1 || !b2 || !b3 || !b4 || !b5) {
                        ArrayList<String> errors = v.getErrorMessages();
                        request.setAttribute("errors", errors);
                        RequestDispatcher rd = request.getRequestDispatcher("?action=registration");
                        rd.include(request, response);
                    }
                    break;
                case "login":
                    
                    break;
                case "reserve":
                    
                    break;
                case "lookup":
                    
                    break;              
                default:
                    break;
            }
        }
        chain.doFilter(request, response);
    }
}
