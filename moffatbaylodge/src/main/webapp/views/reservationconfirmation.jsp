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
<%
    Reservation res = (Reservation)request.getAttribute("reservation");
    Room room = (Room)request.getAttribute("room");
    long difference = res.getCheckOut().getTime() - res.getCheckIn().getTime();
    String total = room.getPrice().multiply(BigDecimal.valueOf(TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS))).toString();
    // String total = (String)request.getAttribute("total");
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

        <title>Reservation Confirmation | Moffat Bay Lodge</title>

        <style type="text/css">
            .summaryForm {
                background-color: #ffffff;
                font-family: Arial, Helvetica, sans-serif;
                width: 75%;
                text-align: center;
                display: block;
                margin: 10% auto;
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
        <script>
            function displayEmailSuccess() {
                let emailSuccess = document.getElementById("emailSuccess");
                emailSuccess.innerText = "An email with this information has been sent to your account email.";
            }
        </script>
    </head>
    <body>
        <%@ include file = "header.jsp" %>
        
        <div class="container">
        <h1 class="page-header">Reservation Confirmation</h1>

            <div class="summaryForm">
                
                <table>
                    <tr>
                        <th>Reservation Id</th>
                        <th>Check-In Date</th>
                        <th>Check-Out Date</th>
                        <th>Guest Count</th>
                        <th>Room Number</th>
                        <th>Room Size</th>
                        <th>Total</th>
                    </tr>
                    <tr>
                        <td><%= res.getId() %></td>
                        <td><%= res.getCheckIn() %></td>
                        <td><%= res.getCheckOut() %></td>
                        <td><%= res.getGuestCount() %></td>
                        <td><%= res.getRoomsId() %></td>
                        <td><%= room.getRoomSize() %></td>
                        <td><%= total %></td>
                    </tr>
                </table>
                <button id="email" onclick="displayEmailSuccess()">Email me this information</button>
                <p id="emailSuccess"></p>
            </div>

            
        </div>
        <%@ include file = "footer.jsp" %>
    </body>
    </html>
