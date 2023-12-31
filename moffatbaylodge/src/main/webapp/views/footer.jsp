<!--
    Team Delta
    Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<body>
</body>
    
    <footer>
        <table>
            <colgroup>
                <col span="1" style="width: 40%;">
                <col span="1" style="width: 40%;">
                <col span="1" style="width: 20%;">
            </colgroup>
            <tr>
            <td>
            <h1>Moffat Bay Lodge</h1>
            (c) 2023 DELTA
            </td>
            <td>
            <a href="<%=base%>?action=home">Home</a><br>
            <a href="<%=base%>?action=aboutus">About Us</a><br>
            <a href="<%=base%>?action=reservation">Book</a><br>
            <a href="<%=base%>?action=attractions">Attractions</a><br>
            <a href="<%=base%>?action=reservationlookup">Reservation Lookup</a>
            </td>
            <td>
        
        <% 
            if (session.getAttribute("username") != null) {
                out.print("<a href=\"" + base + "?action=logout\">Log Out</a>");
            } else {
                out.print("<a href=\"" + base + "?action=registration\">Registration</a>");
                out.print(" | ");
                out.print("<a href=\"" + base + "?action=login\">Log In</a>");
            }
        %>
            </td>
        </tr>
    </table>
    </footer>

</html>
