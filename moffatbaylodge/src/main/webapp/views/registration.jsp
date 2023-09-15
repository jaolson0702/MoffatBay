<!--
    Team Delta
    Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
-->
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
    <%@page import="java.util.ArrayList"%>
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

        <title>Registration | Moffat Bay Lodge</title>
    </head>
    <body>
    
        <%@ include file = "header.jsp" %>
        <div class="container">

            <div class="forms">
                <h1>Registration</h1>
                <br />
                <%@ include file = "validationerrors.jsp" %>
                <br />

                <form method="POST" action="register">
                
                <input type="text" name="firstname" placeholder="First Name"  />
                <br /><br />
                <input type="text" name="lastname" placeholder="Last Name"  />
                <br /><br />
                <input type="tel" name="phone" placeholder="Phone: 123-456-7890" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"  />
                <br /><br />
                <input type="text" placeholder="Email" name="email"  />
                <br /><br />
                <input type="password" placeholder="Password" name="psw"  />
                <input type="hidden" name="form-name" value="register" />
                <br /><br />
                <button type="submit" class="registerbtn">Register</button>
                </form>
            </div>

        </div>
        <%@ include file = "footer.jsp" %>
    </body>
    </html>
