<!--
    Team Delta
    Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
-->
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
    <%@page import="lodge.beans.Customer"%>
    <%@page import="lodge.models.DataManager"%>
<%
    Reservation res = request.getAttribute("reservation");
    Room room = request.getAttribute("room");
%>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <link rel="stylesheet" href="../css/style.css" />
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
        href="https://fonts.googleapis.com/css2?family=Gloock&display=swap"
        rel="stylesheet"
        />

        <title>Reservation Summary | Moffat Bay Lodge</title>
    </head>
    <body>

        <div class="container">
            <%@ include file = "header.jsp" %>

            <div class="forms">
                <h1>Reservation Summary</h1>
                <br /><br />

                <form method="POST" action="reservation">
           
                <label type="date">Check-In Date</label> 
                <label type="date"><%=res.getCheckIn()%></label>

                <label type="date">Check-Out Date</label>
                <label type="date"><%=res.getCheckOut()%></label>

                <label type="guestcount">Guest Count</label>
                <label type="guestcount"><%=res.getGuestCount()%></label>

                <label type="roomtype">Room Size</label>
                <label type="roomtype"><%=room.getRoomSize()%></label>

                <label type="total">Total</label>
                <label type="total">Total</label>

                <button type="submit" class="backbtn">Go Back</button>
                <button type="submit" class="reviewbtn">Submit</button>
                </form>
            </div>

            <%@ include file = "footer.jsp" %>
        </div>
    </body>
    </html>
