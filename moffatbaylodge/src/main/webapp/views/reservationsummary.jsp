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
    String total = request.getAttribute("total");
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

        <style type="text/css">
            .summaryForm {
                background-color: #ffffff;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 1em;
                width: 50%;
                text-align: center;
                margin-top: 10%;
                margin-bottom: 10%;
                margin-left: 25%;
                padding: 10px;
                box-shadow: 5px 5px 5px lightgrey;
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

        <div class="container">
            <%@ include file = "header.jsp" %>

            <div class="summaryForm">
                <h1>Reservation Summary</h1>
                <br /><br />

                <form method="POST" action="book/summary">
           
                <label type="date">Check-In Date</label> 
                <label type="date"><%=res.getCheckIn()%></label>
                <br/>
                <label type="date">Check-Out Date</label>
                <label type="date"><%=res.getCheckOut()%></label>
                <br/>
                <label type="guestcount">Guest Count</label>
                <label type="guestcount"><%=res.getGuestCount()%></label>
                <br/>
                <label type="roomtype">Room Size</label>
                <label type="roomtype"><%=room.getRoomSize()%></label>
                <br/><br/>
                <label type="total">Total</label>
                <label type="total"><%=total%></label>

                <button type="submit" class="button">Go Back</button>
                <button type="submit" class="button">Submit</button>
                </form>
            </div>

            <%@ include file = "footer.jsp" %>
        </div>
    </body>
    </html>
