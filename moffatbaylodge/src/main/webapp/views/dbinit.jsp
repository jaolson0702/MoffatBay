<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@page import="lodge.beans.Customer"%>
<%@page import="lodge.models.DataManager"%>
<!DOCTYPE html>
<html lang="en">
<head><title></title></head>
<body>
<%    
Class.forName(getServletContext().getInitParameter("jdbcDriver"));
    DataManager dataManager = new DataManager();
    dataManager.setDbURL(getServletContext().getInitParameter("dbURL"));
    dataManager.setDbUserName(getServletContext().getInitParameter("dbUserName"));
    dataManager.setDbPassword(getServletContext().getInitParameter("dbPassword"));
    %>
</body>
</html>