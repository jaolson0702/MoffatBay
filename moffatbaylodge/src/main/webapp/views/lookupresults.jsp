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
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Gloock&display=swap" rel="stylesheet" />
    <title>Reservation | Moffat Bay Lodge</title>
</head>
<body>
    <div class="results">
        <% if (request.getAttribute("reservations") != null) { 
            
            ArrayList<Reservation> reservations = (ArrayList<Reservation>)request.getAttribute("reservations");
            ArrayList<Room> rooms = (ArrayList<Room>)request.getAttribute("rooms");
            
            // Card section
            out.print("<div class=\"cards reservations flex\">");
            for (int i = 0; i < reservations.size(); i++) {
                Reservation res = reservations.get(i);
                Room room = rooms.get(i);
                //long difference = res.getCheckOut().getTime() - res.getCheckIn().getTime();
                String total = room.getPrice().multiply(BigDecimal.valueOf(res.getNumberOfNights())).toString(); 

                out.print("<div class=\"card flex-item\">");
                    // Add image of room
                    switch (room.getRoomSize()) {
                        case "double full": 
                            out.print("<img src=\"" + request.getContextPath() + "/images/rooms/double-full.webp\" class=\"card-img-top\" alt=\"Double full\" >");
                            break;
                        case "queen":
                            out.print("<img src=\"" + request.getContextPath() + "/images/rooms/queen.webp\" class=\"card-img-top\" alt=\"Double full\" >");
                            break;
                        case "double queen":
                            out.print("<img src=\"" + request.getContextPath() + "/images/rooms/double-queen.jpg\" class=\"card-img-top\" alt=\"Double full\" >");
                            break;
                        case "king":
                            out.print("<img src=\"" + request.getContextPath() + "/images/rooms/king.webp\" class=\"card-img-top\" alt=\"Double full\" >");
                            break;
                    }

                // Card body
                out.print("<div class=\"card-body\">");
                out.print("<h3 class=\"card-title\">Reservation ID: " + res.getId() + "</h3>");
                out.print("<h4 class=\"card-subtitle\">Room: " + res.getRoomsId() + ", " + room.getRoomSize() + "</h4>");
                    
                // Table for dates and nights
                out.print("<div class=\"dates\">");
                out.print("<table><tr><td class=\"left\">Check-in:</td><td class=\"right\">" + res.getCheckIn() + "</td></tr>");
                out.print("<tr><td class=\"left\">Check-out:</td><td class=\"right\">" + res.getCheckOut() + "</td></tr>");
                out.print("<tr><td class=\"left\"></td><td class=\"right\">" + res.getNumberOfNights() + " nights</td></tr></table>");
                out.print("</div>");
                
                // Rate and total
                out.print("<table><tr><td class=\"left\">Nightly rate:</td><td class=\"right\">" + room.getPrice() + "</td></tr>");
                out.print("<tr><td class=\"total left\">Total:</td><td class=\"total right\">" + total + "</td></tr></table>");
                
                // End card body
                out.print("</div>");

                // End card
                out.print("</div>");
            } %>
            </div>
        <% } %>
        
    </div>
    <style>
        .reservations {
            text-align: center;
            color: #000000;
            font-family: Arial, Helvetica, sans-serif;
        }
        .card {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            height: fit-content;
            transition: 0.3s;
            width: 40%;
            min-width: 300px;

            -webkit-transition: all 1s ease;
            -moz-transition: all 1s ease;
            -o-transition: all 1s ease;
            transition: all 1s ease;

            /*
            &:hover {
                cursor: pointer;
                transform: scale(1.05);
                -webkit-transform: scale(1.05);
                -moz-transform: scale(1.05);
                -ms-transform: scale(1.05);
                -o-transform: scale(1.05);
                transform: scale(1.05);
                -webkit-box-shadow: 3px 3px 5px #000;
                -moz-box-shadow: 3px 3px 5px #000;
                box-shadow: 3px 3px 5px #000;
                -webkit-backface-visibility: hidden;
            */
            }
        }
        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        }
        .card-body {
            width: 100%;
            padding: 2px 8px;
            background-color: #dcf6ff;
        }
        table {
            padding: 0;
            margin: 1em 0;
        }
        .dates {
            padding: 1em;
            background-color: #fffafa;
            border-radius: 8px;
        }
        .left {
            text-align: left;
        }
        .right {
            text-align: right;
        }
        h3 {
            background-color: transparent;
            color: black;
            text-align: center;
            margin: 8px 0 3px 0;
        }
        h4 {
            color: black;
            margin: 0 0 8px 0;
        }
        .flex {
            display: flex;
            flex-flow: row wrap;
            align-content: center;
            justify-content: center;
            align-items: center;
            min-width: 200px;
            max-width: 1160px;
            margin-left: auto;
            margin-right: auto;
        }    
        .flex-item {
            display: flex;
            flex-flow: row wrap;
            justify-content: left;
            margin: 30px 10px;
        }
        .flex-item.form {
            display: grid;
            margin: 2%;
            text-align: left;
        }
        .flex-item.form>label {
            grid-row: 1;
        }
        .flex-item.form>input {
            grid-row: 2;
        }
        .flex-item>img {
            border-radius: 5px 5px 0 0;
            height: 500px;
            width: 100%;
            object-fit: cover;
            /*-webkit-transition: all 1s ease;
            -moz-transition: all 1s ease;
            -o-transition: all 1s ease;
            transition: all 1s ease;

            &:hover {
                transform: scale(1.05);
                -webkit-transform: scale(1.05);
                -moz-transform: scale(1.05);
                -ms-transform: scale(1.05);
                -o-transform: scale(1.05);
                transform: scale(1.05);
                -webkit-box-shadow: 3px 3px 5px #000;
                -moz-box-shadow: 3px 3px 5px #000;
                box-shadow: 3px 3px 5px #000;
                -webkit-backface-visibility: hidden;
            }
            */
        }
    </style>
</body>
</html>
