<!--
    Team Delta
    Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Gloock&display=swap" rel="stylesheet" />

    <title>DELTA | CSD460</title>

    <style>
        .main {
            background-color: #ffffff;
            border: 1px solid #000000;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 2rem;
            text-align: center;
        }
        .gallery {
            background-color: #000000;
        }
    </style>
</head>
<body>
    <%@ include file = "views/header.jsp" %>
    <div class="container">

        <div class="main">

        <div class="welcome">
            <table>
                <colgroup>
                    <col span="1" style="width: 20%;">
                    <col span="1" style="width: 60%;">
                    <col span="1" style="width: 20%;">
                </colgroup>
            <tr>
            <td>
            <img src="<%=request.getContextPath()%>/images/salmonR.png" alt="salmon-right" />
            </td>
            <td>
            <h1>Welcome to your home away from home.</h1>
            <h5>JOVIEDSA ISLAND, WA</h5>
            </td>
            <td>
            <img src="<%=request.getContextPath()%>/images/salmonL.png" alt="salmon-left" />
            </td>
            </table>
        </div>

        <div class="gallery">
            <img src="<%=request.getContextPath()%>/images/photo1.jpg" alt="photo1" />
        </div>
        
        </div>

    </div>
    <%@ include file = "views/footer.jsp" %>
</body>
</html>