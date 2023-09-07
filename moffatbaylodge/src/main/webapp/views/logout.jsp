<!--
    Team Delta
    Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
-->
<%
String base = (String)application.getAttribute("base");
session.invalidate();
response.sendRedirect(base + "?action=home");
%>