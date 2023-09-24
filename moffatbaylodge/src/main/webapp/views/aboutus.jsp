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
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Gloock&display=swap" rel="stylesheet" />

        <title>About Us | Moffat Bay Lodge</title>

        <style type="text/css">
            .main {
                background-color: white;
                border: 1px solid black;
                padding: 10px;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 1em;
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
                margin-left: 10%;
                margin-right: 20%;
                display: inline-block;
            }
            .main .contact {
                text-align: center;
            }
        </style>
    </head>
    <body>      
        <%@ include file = "header.jsp" %>

        <div class="container">

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
                        <img src="<%=request.getContextPath()%>/images/employee1.jpg" alt="Mary Beth Smith" />
                        <h4>Mary Beth Smith</h4>
                        <p>General Manager</p>
                    </div>
                    <div class="teamPicture">
                        <img src="<%=request.getContextPath()%>/images/employee2.jpg" alt="Cheryl Deiro" />
                        <h4>Cheryl Deiro</h4>
                        <p>Director of Sales</p>
                    </div>
                </div>
                    <p></p>
                <div class="contact">
                    <h3>Contact Us</h3>
                        <p>
                            Moffat Bay Lodge<br>
                            323 Moffat Bay Dr.<br>
                            Joviedsa Island, WA 98001
                            <br><br>
                            (206) 555-4768<br>
                            hello@moffatbaylodge.com
                            <br><br>
                        </p>
                    <h3>Follow Us</h3>
                        <a href="https://www.facebook.com/"><img src="<%=request.getContextPath()%>/images/fb.png" alt="Facebook" /></a>
                        <a href="https://www.instagram.com/"><img src="<%=request.getContextPath()%>/images/ig.png" alt="Instagram" /></a>
                        <a href="https://www.youtube.com/"><img src="<%=request.getContextPath()%>/images/yt.png" alt="YouTube" /></a>
                </div>
            </div>
            
        </div>
        <%@ include file = "footer.jsp" %>
    </body>
</html>
