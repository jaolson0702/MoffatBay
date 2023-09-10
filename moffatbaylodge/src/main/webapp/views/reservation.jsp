<!--
    Team Delta
    Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
-->
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
    <%@page import="lodge.beans.Customer"%>
    <%@page import="lodge.models.DataManager"%>

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

        <div class="container">
            <%@ include file = "header.jsp" %>

            <div class="resform">
                <h1>Reservation</h1>
        
                <form method="POST" action="book">
           
                <label for="checkin"> Check-In </label>
                <input type="date">   
                <label for="checkin"> Check-Out </label>
                <input type="date">   
                <label for="guestcount"> Guest Count </label>
                <select name="guestcount" id="guestcount">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>                      
                  <option value="5">5</option>
                </select>
                <label for="roomsize"> Room Size </label>
                <select name="roomsize" id="roomsize">
                  <option value="double full">Double Full</option>
                  <option value="queen">Queen</option>
                  <option value="double queen">Double Queen </option>
                  <option value="king">King</option>                      
                </select>   
                <button type="submit" class="button">Review</button>
                </form>
            </div>

            <%@ include file = "footer.jsp" %>
        </div>
    </body>
    </html>
