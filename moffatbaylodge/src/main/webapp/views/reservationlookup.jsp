<!--
    Team Delta
    Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@page import="lodge.beans.Reservation"%>
<%@page import="lodge.beans.Room"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Gloock&display=swap" rel="stylesheet" />
    <title>Reservation | Moffat Bay Lodge</title>

    <style type="text/css">
        .resform {
            background-color: #ffffff;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 1em;
            width: 80%;
            text-align: center;
            margin-top: 5%;
            margin-bottom: 10%;
            margin-left: 10%;
            padding: 10px;
            box-shadow: 5px 5px 5px lightgrey;
        }

        .resform > h1 {
            text-align: left;
        }

        .button {
            background-color: #000000;
            color: #FFB287;
            text-align: center;
            text-decoration: none;
            font-size: 1em;
            padding: 10px;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <%@ include file = "header.jsp" %>
    <div class="container">

        <div class="resform">
            <h1>Reservation Lookup</h1>
    
            <%@ include file = "validationerrors.jsp" %>

            <form method="POST" action="lookup">
        
            <input type="text" name="search" placeholder="Search...">
            <select name="searchby" id="searchby" required>
                <option value="">Search by...</option>
                <option value="resid">Reservation ID</option>
                <option value="email">Email</option>
            </select>
            <input type="hidden" name="form-name" value="lookup" />
            
            <button type="submit" class="button">Search</button>
            </form>
        </div>

        <% if (request.getAttribute("reservations") != null) { %>
            <div class="reservations">
                <%
                ArrayList<Reservation> reservations = (ArrayList<Reservation>)request.getAttribute("reservations");
                ArrayList<Room> rooms = (ArrayList<Room>)request.getAttribute("rooms");
                for (int i = 0; i < reservations.size(); i++) {
                    Reservation res = reservations.get(i);
                    Room room = rooms.get(i);
                    long difference = res.getCheckOut().getTime() - res.getCheckIn().getTime();
                    String total = room.getPrice().multiply(BigDecimal.valueOf(TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS))).toString(); %>
                    <div class="reservation">
                        <label type="number">Id:</label>
                        <label type="number"><%=res.getId()%></label>
                        <br/>
                        <label type="date">Check-In Date:</label> 
                        <label type="date"><%=res.getCheckIn()%></label>
                        <br/>
                        <label type="date">Check-Out Date:</label>
                        <label type="date"><%=res.getCheckOut()%></label>
                        <br/>
                        <label type="guestcount">Guest Count:</label>
                        <label type="guestcount"><%=res.getGuestCount()%></label>
                        <br/>
                        <label type="roomnumber">Room Number:</label>
                        <label type="roomnumber"><%=room.getId()%></label>
                        <br/>
                        <label type="roomtype">Room Size:</label>
                        <label type="roomtype"><%=room.getRoomSize()%></label>
                        <br/>
                        <label type="total">Number of nights:</label>
                        <label type="total"><%=res.getNumberOfNights()%></label>
                        <br/>
                        <label type="text">Rate:</label>
                        <label type="total"><%=room.getPrice()%></label>
                        <br/>
                        <label type="text">Total:</label>
                        <label type="total"><%=total%></label>
                    </div>
                <% } %>
            </div>
        <% } %>
        
    </div>
    <%@ include file = "footer.jsp" %>
</body>
</html>
