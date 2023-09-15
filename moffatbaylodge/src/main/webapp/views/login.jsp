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
        <link rel="stylesheet" href="../css/style.css" />
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Gloock&display=swap" rel="stylesheet" />

        <title>Log In | Moffat Bay Lodge</title>
    </head>
    <body>    
        <%@ include file = "header.jsp" %>  
        <div class="container">
            

            <div class="forms">
            
                <h1>Log In</h1>
                <br />
                <%@ include file = "validationerrors.jsp" %>
                <br />
                <form method="POST" action="login">
                <input type="text" placeholder="Enter Username" name="username" required/>
                <br /><br />
                <input type="password" placeholder="Enter Password" name="password" required/>
                <input type="hidden" name="form-name" value="login" />
                <br /><br />
                <button type="submit">Login</button>
                <br /><br />
                </form>
            </div>
            
            
        </div>
        <%@ include file = "footer.jsp" %>
    </body>
</html>
