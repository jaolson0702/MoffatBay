<!--
    Team Delta
    Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
-->
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
    <%@page import="lodge.beans.Customer"%>
    <%@page import="lodge.models.DataManager"%>
    <%@page import="lodge.HashPassword"%>
    <%@page import="org.apache.commons.lang3.StringUtils"%>
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

        <title>Registration | Moffat Bay Lodge</title>
    </head>
    <body>
    
        <%@ include file = "header.jsp" %>
        <div class="container">

            <div class="forms">
                <h1>Registration</h1>
                <br /><br />

                <form method="POST" action="register">
                <% // Display error message if email/password is invalid
                String emailInvlaid = (String)request.getAttribute("emailerror");
                String lengthInvalid = (String)request.getAttribute("passwordlengtherror");
                String caseInvalid = (String)request.getAttribute("passwordcaseerror");
                if(emailInvlaid != null)
                    out.println("<font color=red size=4px>"+emailInvlaid+"</font>");
                if(lengthInvalid != null)
                    out.println("<font color=red size=4px>"+lengthInvalid+"</font>");
                if(caseInvalid != null)
                    out.println("<font color=red size=4px>"+caseInvalid+"</font>");
                %>
                <input type="text" name="firstname" placeholder="First Name" required />
                <br /><br />
                <input type="text" name="lastname" placeholder="Last Name" required />
                <br /><br />
                <input type="tel" name="phone" placeholder="Phone: 123-456-7890" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required />
                <br /><br />
                <input type="text" placeholder="Email" name="email" required />
                <br /><br />
                <input type="password" placeholder="Password" name="psw" required />
                <br /><br />
                <button type="submit" class="registerbtn">Register</button>
                </form>
            </div>

        </div>
        <%@ include file = "footer.jsp" %>
    </body>
    </html>
