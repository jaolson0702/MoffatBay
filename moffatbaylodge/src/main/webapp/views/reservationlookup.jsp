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

    <style type="text/css">
        .resform {
            background-color: #ffffff;
            font-family: Arial, Helvetica, sans-serif;
            text-align: center;
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
            padding: 0.5em;
            border-radius: 4px;
        }

        .reservations {
            text-align: center;
            color: #000000;
            font-family: Arial, Helvetica, sans-serif;
        }
        input, select {
            padding: 0.5em;
            border-radius: 5px;
            box-sizing: border-box;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
        }
    </style>
</head>
<body>
    <%@ include file = "header.jsp" %>
    <div class="container">
        
        <h1 class="page-header">Reservation Lookup</h1>
        
        <div class="resform">
            
            <%@ include file = "validationerrors.jsp" %>

            <%
                if (request.getAttribute("reserror") != null) {
                    %>
                    <p class="error"><%=request.getAttribute("reserror")%></p>
                    <%
                }
            %>
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

            <%@ include file = "lookupresults.jsp" %>
        </div>
    </div>
    <%@ include file = "footer.jsp" %>
</body>
</html>
