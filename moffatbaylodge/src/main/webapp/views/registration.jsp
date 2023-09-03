<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> 
<%@page import="lodge.beans.Customer"%>
<%@page import="lodge.models.DataManager"%>
<%@page import="lodge.HashPassword"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Gloock&display=swap"
      rel="stylesheet"
    />

    <title>Registration | Moffat Bay Lodge</title>
  </head>
  <body>
    <%@ include file = "dbinit.jsp" %>
    <% if (request.getMethod().equalsIgnoreCase("POST")) { 
      HashPassword hp = new HashPassword();
      Customer customer = new Customer(); 
      customer.setFirstName(request.getParameter("firstname"));
      customer.setLastName(request.getParameter("lastname"));
      customer.setEmail(request.getParameter("email"));
      customer.setPhoneNumber(request.getParameter("phone"));
      customer.setPassword(hp.generateStrongPasswordHash(request.getParameter("psw")));
      dataManager.insertCustomer(customer); 
      } 
    %>

    <div class="container">
      <header>
        <img src="../images/header.jpg" alt="Moffat Bay Sunset" />
        <div class="header-text">Moffat Bay Lodge</div>
      </header>

      <div id="navbar">
        <a href="#">Home</a>
        <a href="aboutus.html">About Us</a>
        <a href="book.html">Book</a>
        <a href="attractions.html">Attractions</a>
        <a href="reservationlookup.html">Reservation Lookup</a>

        <div class="account">
          <a href="registration.jsp">Registration</a>
          <a href="login.jsp">Log In</a>
        </div>
      </div>

      <div class="forms">
        <h1>Registration</h1>
        <br /><br />
        <form method="POST">
          <input
            type="text"
            name="firstname"
            placeholder="First Name"
            required
          />
          <br /><br />
          <input type="text" name="lastname" placeholder="Last Name" required />
          <br /><br />
          <input type="text" name="phone" placeholder="Phone Number" required />
          <br /><br />
          <input type="text" placeholder="Email" name="email" required />
          <br /><br />
          <input type="password" placeholder="Password" name="psw" required />
          <br /><br />
          <button type="submit" class="registerbtn">Register</button>
        </form>
      </div>

      <footer>
        <div id="logo">
          <img src="../images/logo.png" alt="Logo" />
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
          <a href="login.html">Log In</a>
          <a href="https://www.facebook.com/"><img src="../images/fb.png" /></a>
          <a href="https://www.instagram.com/"
            ><img src="../images/ig.png"
          /></a>
          <a href="https://www.youtube.com/"><img src="../images/yt.png" /></a>
        </div>
      </footer>
    </div>
  </body>
</html>
