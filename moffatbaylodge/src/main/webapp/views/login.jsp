<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@page import="lodge.beans.Customer"%>
<%@page import="lodge.models.DataManager"%>
<%@page import="lodge.HashPassword"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="../css/style.css" />
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Gloock&display=swap" rel="stylesheet" />

        <title>Log In | Moffat Bay Lodge</title>
    </head>
    <body>
        <%@ include file = "dbinit.jsp" %>
        
        <div class="container">
        <header>
            <img src="<%=request.getContextPath()%>/images/header.jpg" alt="Moffat Bay Sunset" />
            <div class="header-text">Moffat Bay Lodge</div>
        </header>

        <div id="navbar">
            <a href="../index.jsp">Home</a>
            <a href="aboutus.html">About Us</a>
            <a href="book.html">Book</a>
            <a href="attractions.html">Attractions</a>
            <a href="reservationlookup.html">Reservation Lookup</a>

            <div class="account">
            <a href="registration.jsp">Registration</a>
            <% 
            if (session.getAttribute("username") != null) {
                out.print("<a href=\"." + request.getContextPath() + "/views/logout.jsp\">Log Out</a>");
            } else {
                out.print("<a href=\"" + request.getContextPath() + "/views/login.jsp\">Log In</a>");
            }
            %>
            </div>
        </div>

        <!-- POST display -->
        <% if (request.getMethod().equalsIgnoreCase("POST")) { 
            String email = request.getParameter("username"); 
            String password = request.getParameter("password");

                HashPassword hp = new HashPassword();
                Customer customer = dataManager.getCustomerLogin(request.getParameter("username"));

                if (customer != null && hp.validatePassword(password, customer.getPassword())) {
                    session.setAttribute("userid", customer.getId());
                    session.setAttribute("username", customer.getEmail());
                    session.setAttribute("uname", customer.getFirstName());
                    RequestDispatcher req = request.getRequestDispatcher("../index.jsp");
                    req.forward(request, response);
                }
                else {
                    %>
                    <script>
                        window.alert("Invalid username and/or password");
                    </script>
                <%
                request.setAttribute("redo", "yes");
                }
            }
        %>

        <!-- GET display -->
        <% if (request.getMethod().equalsIgnoreCase("GET") || request.getAttribute("redo") == "yes") { %>
            <div class="forms">
                <h1>Log In</h1>
                <br /><br />
                <form method="POST" action="login.jsp">
                <input type="text" placeholder="Enter Username" name="username" required/>
                <br /><br />
                <input type="password" placeholder="Enter Password" name="password" required/>
                <br /><br />
                <button type="submit">Login</button>
                <br /><br />
                </form>
            </div>
        <%} 
        %>

        <footer>
            <div id="logo">
            <img src="<%=request.getContextPath()%>/images/logo.png" alt="Logo" />
            <br /><br />
            (c) 2023 DELTA
            </div>

            <div id="flinks">
            <a href="index.html">Home</a>
            <a href="aboutus.html">About Us</a>
            <a href="book.html">Book</a>
            <a href="attractions.html">Attractions</a>
            <a href="reservationlookup.html">Reservation Lookup</a>
            </div>

            <div class="account"></div>

            <div id="socials">
            <a href="registration.html">Registration | </a>
            <% 
            if (session.getAttribute("username") != null) {
                out.print("<a href=\"" + request.getContextPath() + "/views/logout.jsp\">Log Out</a>");
            } else {
                out.print("<a href=\"" + request.getContextPath() + "/views/login.jsp\">Log In</a>");
            }
            %>
            <a href="https://www.facebook.com/"><img src="<%=request.getContextPath()%>/images/fb.png" /></a>
            <a href="https://www.instagram.com/"
                ><img src="<%=request.getContextPath()%>/images/ig.png"
            /></a>
            <a href="https://www.youtube.com/"><img src="<%=request.getContextPath()%>/images/yt.png" /></a>
            </div>
        </footer>
        </div>
    </body>
</html>
