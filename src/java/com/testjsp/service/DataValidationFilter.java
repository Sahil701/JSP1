package com.testjsp.service;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DataValidationFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request=  (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)res;
        String username = request.getParameter("username");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        boolean status = true;
        if(username.equals("")){
             request.setAttribute("usernameError", "Please enter username");
             status = false;
        }
        if(mobile.equals("")){
            request.setAttribute("mobileError", "Please enter mobile");
            status = false;
        }
        if(password.equals("")){
            request.setAttribute("passwordError", "Please enter password");
            status = false;
        }
        if(status){
            chain.doFilter(request, response);
        }
        else{
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
            rd.forward(request, response);
        }
           
    }

    @Override
    public void destroy() {
    }
    
}
