<!--
    Team Delta
    Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
-->
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
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

        <style>
            label, input {
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
            <h1 class="page-header">Registration</h1>
            
            <div class="forms">
                
                <br />
                <%@ include file = "validationerrors.jsp" %>
                <br />

                <form method="POST" action="register">
                
                <input type="text" name="firstname" placeholder="First Name *" required />
                <br /><br />
                <input type="text" name="lastname" placeholder="Last Name *" required />
                <br /><br />
                <input type="tel" name="phone" placeholder="Phone: 123-456-7890 *" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required />
                <br /><br />
                <input type="text" placeholder="Email *" name="email" required />
                <br /><br />
                <input type="password" placeholder="Password *" name="psw" required />
                <span style="font-size: 9px;">Password Requirements: At least 8 characters, one uppercase letter, one lowercase letter</span>
                <br /><br />
                <input type="password" placeholder="Confirm Password *" name="pswcon" required />
                <br /><br />
                <input type="hidden" name="form-name" value="register" />
                <button type="submit" class="registerbtn">Register</button>
                <br /><br />
                <p>Already registered? <a href="<%=base%>?action=login">Login</a></p>
                </form>
            </div>

        </div>
        <%@ include file = "footer.jsp" %>
    </body>
    </html>
