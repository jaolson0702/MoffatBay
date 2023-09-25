<!--
    Team Delta
    Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
-->
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
    <%@page import="lodge.beans.Reservation"%>
    <%@page import="lodge.beans.Room"%>
    <%@page import="java.sql.Date"%>
    <%@page import="java.math.BigDecimal"%>
    <%@page import="java.util.concurrent.TimeUnit"%>
    <%@page import="java.text.SimpleDateFormat"%>
    <%@page import="org.apache.commons.text.WordUtils"%>
<%
    Reservation res = (Reservation)request.getAttribute("reservation");
    Room room = (Room)request.getAttribute("room");
    long difference = res.getCheckOut().getTime() - res.getCheckIn().getTime();
    BigDecimal total = room.getPrice().multiply(BigDecimal.valueOf(TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS)));
    SimpleDateFormat sdf = new SimpleDateFormat("EEEE, MMMM d, yyyy");
    //String total = (String)request.getAttribute("total");
%>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
        href="https://fonts.googleapis.com/css2?family=Gloock&display=swap"
        rel="stylesheet"
        />

        <title>Reservation Summary | Moffat Bay Lodge</title>

        <style type="text/css">
            .summaryForm {
                background-color: #ffffff;
                font-family: Arial, Helvetica, sans-serif;
                width: 50%;
                text-align: center;
                margin-top: 10%;
                margin-bottom: 10%;
                margin-left: 25%;
                padding: 10px;
                box-shadow: 5px 5px 5px lightgrey;
            }
            label, input {
                padding: 0.5em;
                border-radius: 5px;
                box-sizing: border-box;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
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
            <h1 class="page-header">Reservation Summary</h1>

            <div class="summaryForm">
                
                <br /><br />

                <form method="POST" action="summary">
           
                <label type="date">Check-In Date:</label> 
                <label type="date"><%=sdf.format(res.getCheckIn())%></label>
                <br/>
                <label type="date">Check-Out Date:</label>
                <label type="date"><%=sdf.format(res.getCheckOut())%></label>
                <br/>
                <label type="guestcount">Guest Count:</label>
                <label type="guestcount"><%=res.getGuestCount()%></label>
                <br/>
                <label type="roomnumber">Room Number:</label>
                <label type="roomnumber"><%=room.getId()%></label>
                <br/>
                <label type="roomtype">Room Size:</label>
                <label type="roomtype"><%=WordUtils.capitalizeFully(room.getRoomSize())%></label>
                <br/>
                <label type="total">Number of nights:</label>
                <label type="total"><%=res.getNumberOfNights()%></label>
                <br/>
                <label type="text">Rate:</label>
                <label type="total"><%=String.format("$%,.2f", room.getPrice())%></label>
                <br/>
                <label type="text">Total:</label>
                <label type="total"><%=String.format("$%,.2f", total)%></label>

                <input type="hidden" name="checkin" id="checkin" value="<%= res.getCheckIn() %>">
                <input type="hidden" name="checkout" id="checkout" value="<%= res.getCheckOut() %>">
                <input type="hidden" name="guestcount" id="guestcount" value="<%= res.getGuestCount() %>">
                <input type="hidden" name="roomid" id="roomid" value="<%= room.getId() %>">

                <button type="submit" name="cancel" class="button" formaction="summary?action=cancel">Go Back</button>
                <button type="submit" name="submit" class="button" formaction="summary?action=submit">Submit</button>
                </form>
            </div>

            
        </div>
        <%@ include file = "footer.jsp" %>
    </body>
    </html>
