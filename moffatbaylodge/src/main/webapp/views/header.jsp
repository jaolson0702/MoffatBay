<!--
    Team Delta
    Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%
    String base = (String)application.getAttribute("base");
    String imageURL = (String)application.getAttribute("imageURL");
%>
<!DOCTYPE html>
<html lang="en">
<body>
    <header>
        <div id="banner">
        <img src="<%=request.getContextPath()%>/images/header.jpg" alt="Moffat Bay Sunset" />
        <h1 class="header-text">Moffat Bay Lodge</h1>
        </div>
    
        <div id="navbar">
        <a href="<%=base%>?action=home">Home</a>
        <a href="<%=base%>?action=aboutus">About Us</a>
        <a href="<%=base%>?action=reservation">Book</a>
        <a href="<%=base%>?action=attractions">Attractions</a>
        <a href="<%=base%>?action=reservationlookup">Reservation Lookup</a>

        <div class="account">
            <a href="<%=base%>?action=registration">Registration</a>
            <% 
            if (session.getAttribute("username") != null) {
                out.print("<a href=\"" + base + "?action=logout\">Log Out</a>");
            } else {
                out.print("<a href=\"" + base + "?action=login\">Log In</a>");
            }
            %>
        </div>
        </div>
    </header>
</body>
</html>
