<%@page import="java.util.ArrayList"%>
<html>
<body>
<% // Display error message if inputs are invalid
if(request.getAttribute("errors") != null) {
    ArrayList<String> errors = (ArrayList<String>)request.getAttribute("errors"); 
    for (String e : errors) {
        out.println("<p class=\"error\">" + e + "</p>");
    }
    out.println("<br>");
    request.removeAttribute("errors");
}
%>
</body>
</html>