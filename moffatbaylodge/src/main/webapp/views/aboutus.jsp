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

        <style type="text/css">
            .main {
                background-color: white;
                border: 1px solid black;
                padding: 10px;
            }
            .main > .islandDesc {
                display: flex;
            }
            .main > .islandDesc > h3 {
                width: 85%;
                text-align: center;
                margin-top: auto;
                margin-bottom: auto;
            }
            .main > .islandDesc > p {
                width: 100%;
                float: right;
            }
            .main > .teamDesc > h3 {
                text-align: center;
            }
            .main > .teamDesc > p {
                text-align: center;
            }
            .main > .teamPictures {
                display: flex;
                align-items: center;
            }
            .main .teamPicture {
                margin-left: 20%;
                margin-right: 20%;
                display: inline-block;
            }
        </style>
    </head>
    <body>      
        <div class="container">
            <%@ include file = "header.jsp" %>

            <div class="main">
                <div class="islandDesc">
                    <h3>The Art of Joviedsa Island</h3>
                    <p>Ideally located in the heart of Joviedsa Island, The Moffat Bay Lodge offers the area's first and only boutique lodging experience. Our first-in-class service, distinctive dining, unique bar menus, and a wide array of amenities create an unrivaled guest experience. It fuses gracious hospitality with a contemporary art collection for a truly memorable stay in Moffat Bay.</p>
                </div>
                <div class="teamDesc">
                    <h3>Our World-Class Team</h3>
                    <p>Our skillful team anticipates needs and delivers exemplary service. Each associate prioritizes your comfort and satisfaction.</p>
                </div>
                <div class="teamPictures">
                    <div class="teamPicture">
                        <h4>Mary Beth Smith</h4>
                        <p>General Manager</p>
                    </div>
                    <div class="teamPicture">
                        <h4>Cheryl Deiro</h4>
                        <p>Director of Sales</p>
                    </div>
                </div>
            </div>
            
            <%@ include file = "footer.jsp" %>
        </div>
    </body>
</html>