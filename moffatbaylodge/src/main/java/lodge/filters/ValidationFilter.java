package lodge.filters;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;



public class ValidationFilter implements Filter  {

    @Override
    public void init(FilterConfig filterConfig) { 

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        System.out.println("ValidationFilter");
        throw new UnsupportedOperationException("Unimplemented method 'doFilter'");
    }
    
}
