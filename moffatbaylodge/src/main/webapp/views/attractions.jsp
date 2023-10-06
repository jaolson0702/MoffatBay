<!--
    Team Delta
    Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@page import="lodge.beans.Customer"%>
<%@page import="lodge.models.DataManager"%>
<%@page import="lodge.HashPassword"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Gloock&display=swap" rel="stylesheet" />

        <title>Attractions | Moffat Bay Lodge</title>

        <style type="text/css">
        * {
          box-sizing: border-box;
        }
        
        body {
          font-family: Arial, Helvetica, sans-serif;
        }
        
        /* Float four columns side by side */
        .column {
          float: left;
          width: 40%;
          padding: 0 10px;
        }
        
        /* Remove extra left and right margins, due to padding */
        .row {
            margin-left: 15%;
        }
        
        /* Clear floats after the columns */
        .row:after {
          content: "";
          display: table;
          clear: both;
        }
        
        /* Responsive columns */
        @media screen and (max-width: 600px) {
          .column {
            width: 100%;
            display: block;
            margin-bottom: 20px;
          }
        }
        
        /* Style the counter cards */
        .card {
          border-radius: 25px;
          padding: 16px;
          text-align: center;
          font-size: 0.75em;
          background-color: #ffffff;
        }

        img {
          max-width: 100%;
        }

        </style>
    </head>
    <body>      
        <%@ include file = "header.jsp" %>

        <div class="container">

            <h1 class="page-header">Attractions</h1>
        
        <div class="row">
          <div class="column">
            <div class="card">
                <img src="<%=request.getContextPath()%>/images/hiking-sm.jpg" alt="hiking"/>
              <h4>Hiking</h4>
              Discover the natural beauty of Joviedsa Island right in our lodge's backyard.
            </div>
          </div>
        
          <div class="column">
            <div class="card">
                <img src="<%=request.getContextPath()%>/images/kayak-sm.jpg" alt="kayaking"/>
              <h4>Kayaking</h4>
              Nestled right in front of the lodge is our own lake, when you can kayak solo or up to a group of 4.
            </div>
          </div>
         </div> 
         <br>
         <div class="row">
          <div class="column">
            <div class="card">
                <img src="<%=request.getContextPath()%>/images/ww-sm.jpg" alt="whale watching"/>
              <h4>Whale Watching</h4>
              For inquiries regarding transportation, boat rides, and availability, please visit our front desk.
            </div>
          </div>
          
          <div class="column">
            <div class="card">
                <img src="<%=request.getContextPath()%>/images/scuba-sm.jpg" alt="scuba diving"/>
              <h4>Scuba Diving</h4>
              For inquiries, requirements, and rentals, please visit our front desk.
            </div>
          </div>
        </div>
            
        </div>
        <%@ include file = "footer.jsp" %>
    </body>
</html>
