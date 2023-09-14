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
</head>
<body>
    <%@ include file = "views/header.jsp" %>
    <div class="container">

        <div class="gallery">
            <img src="<%=request.getContextPath()%>/images/photo1.jpg" alt="photo1" />
        </div>

    </div>
    <%@ include file = "views/footer.jsp" %>
</body>
</html>