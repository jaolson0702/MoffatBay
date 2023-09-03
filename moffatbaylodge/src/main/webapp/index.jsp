<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Gloock&display=swap"
      rel="stylesheet"
    />

    <title>DELTA | CSD460</title>
  </head>
  <body>
    <div class="container">
      <header>
        <img src="images/header.jpg" alt="Moffat Bay Sunset" />
        <div class="header-text">Moffat Bay Lodge</div>
      </header>

      <div id="navbar">
        <a href="#">Home</a>
        <a href="aboutus.html">About Us</a>
        <a href="book.html">Book</a>
        <a href="attractions.html">Attractions</a>
        <a href="reservationlookup.html">Reservation Lookup</a>

        <div class="account">
          <a href="views/registration.jsp">Registration</a>
          <% 
            if (session.getAttribute("username") != null) {
                out.print("<a href=\"views/index.jsp\">Log Out</a>");
            } else {
                out.print("<a href=\"views/login.jsp\">Log In</a>");
            }
            %>
        </div>
      </div>

      <div class="gallery">
        <img src="images/photo1.jpg" alt="photo1" />
      </div>

      <footer>
        <div id="logo">
          <img src="images/logo.png" alt="Logo" />
          <br /><br />
          (c) 2023 DELTA
        </div>

        <div id="flinks">
          <a href="index.html">Home</a>
          <a href="views/aboutus.html">About Us</a>
          <a href="views/book.html">Book</a>
          <a href="views/attractions.html">Attractions</a>
          <a href="views/reservationlookup.html">Reservation Lookup</a>
        </div>

        <div class="account"></div>

        <div id="socials">
          <a href="views/registration.html">Registration | </a>
          <% 
            if (session.getAttribute("username") != null) {
                out.print("<a href=\"views/index.jsp\">Log Out</a>");
            } else {
                out.print("<a href=\"views/login.jsp\">Log In</a>");
            }
            %>
          <a href="https://www.facebook.com/"><img src="images/fb.png" /></a>
          <a href="https://www.instagram.com/"><img src="images/ig.png" /></a>
          <a href="https://www.youtube.com/"><img src="images/yt.png" /></a>
        </div>
      </footer>
    </div>
  </body>
</html>
