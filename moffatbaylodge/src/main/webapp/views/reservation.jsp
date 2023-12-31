<!--
    Team Delta
    Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo

    Images and partial descriptions from: thelodgeatsonoma.com/
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.time.LocalDate" %>

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

    <title>Reservation | Moffat Bay Lodge</title>

</head>
<body>
    <%@ include file = "header.jsp" %>

    <div class="container resform">
            
        <h1 class="page-header">Reservation</h1>

        <%@ include file = "validationerrors.jsp" %>

        <%
            if (request.getAttribute("roomerror") != null) {
                %>
                <p class="error"><%=request.getAttribute("roomerror")%></p>
                <%
            }
        %>

        <form method="POST" action="book" class="flex"> 
            <div class="flex-item form">
                <label for="checkin" class="grid-item"> Check-In </label>
                <input type="date" name="checkin" class="grid-item" min="<%=LocalDate.now() %>" required > 
            </div>

            <div class="flex-item form">
                <label for="checkout" class="grid-item"> Check-Out </label>
                <input type="date" name="checkout" class="grid-item" min="<%=LocalDate.now() %>" required > 
            </div>

            <div class="flex-item form">
                <label for="guestcount" class="grid-item"> Guest Count </label>
                <select name="guestcount" id="guestcount" class="grid-item" required>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>                      
                    <option value="5">5</option>
                </select>
            </div>

            <div class="flex-item form">
                <label for="roomsize" class="grid-item"> Room Size </label>
                <select name="roomsize" id="roomsize" class="grid-item" required>
                    <option value="double full">Double Full</option>
                    <option value="queen">Queen</option>
                    <option value="double queen">Double Queen </option>
                    <option value="king">King</option>                      
                </select> 
            </div>

            <div class="flex-item form">
                <input type="hidden" name="form-name" value="reserve" class="flex-item" />
                <button type="submit" class="button" class="flex-item-button">Review</button>
            </div>
        </form>

        <div class="cards flex">
            <div class="card flex-item" id="double-full" >
                <img src="<%=request.getContextPath()%>/images/rooms/double-full.webp" class="card-img-top" alt="Double full"  >
                <div class="card-body">
                    <h3 class="card-title">Double Full Beds</h3>
                    <h4 class="card-subtitle mb-2 text-muted ">Features</h4>
                    <ul class="card-text">
                        <li>Maximum occupancy: 4</li>
                        <li>2 full beds</li>
                        <li>Pillowtop mattress, featherbed &amp; duvet</li>
                        <li>Rollaway beds: allowed in some rooms</li>
                        <li>Cribs: 1 permitted</li>
                        <li>Shower/tub combination</li>
                        <li>Robes: 2</li>
                        <li>Hairdryer</li>
                        <li>Locally sourced bath amenities</li>
                        <li>Chair</li>
                        <li>Desk for writing/work</li>
                        <li>Iron &amp; ironing board</li>
                    </ul>
                    <p>$115.50/night</p>
                </div>
            </div>

            <div class="card flex-item" id="queen" >
                <img src="<%=request.getContextPath()%>/images/rooms/queen.webp" class="card-img-top" alt="..." >
                <div class="card-body">
                    <h3 class="card-title">Queen Bed</h3>
                    <h4 class="card-subtitle mb-2 text-muted ">Features</h4>
                    <ul class="card-text">
                        <li>Maximum occupancy: 2</li>
                        <li>1 queen bed</li>
                        <li>Pillowtop mattress, featherbed &amp; duvet</li>
                        <li>Rollaway beds: allowed in some rooms</li>
                        <li>Cribs: 1 permitted</li>
                        <li>Shower/tub combination</li>
                        <li>Robes: 2</li>
                        <li>Hairdryer</li>
                        <li>Locally sourced bath amenities</li>
                        <li>Chair</li>
                        <li>Desk for writing/work</li>
                        <li>Iron &amp; ironing board</li>
                    </ul>
                    <p>$120.75/night</p>
                </div>
            </div>

            <div class="card flex-item" id="double-queen" >
                <img src="<%=request.getContextPath()%>/images/rooms/double-queen.jpg" class="card-img-top" alt="..." >
                <div class="card-body">
                    <h3 class="card-title">Double Queen Beds</h3>
                    <h4 class="card-subtitle mb-2 text-muted ">Features</h4>
                    <ul class="card-text">
                        <li>Maximum occupancy: 4</li>
                        <li>2 queen beds</li>
                        <li>Pillowtop mattress, featherbed &amp; duvet</li>
                        <li>Rollaway beds: allowed in some rooms</li>
                        <li>Cribs: 1 permitted</li>
                        <li>Shower/tub combination</li>
                        <li>Robes: 2</li>
                        <li>Hairdryer</li>
                        <li>Locally sourced bath amenities</li>
                        <li>Chair</li>
                        <li>Desk for writing/work</li>
                        <li>Iron &amp; ironing board</li>
                    </ul>
                    <p>$131.25/night</p>
                </div>
            </div>

            <div class="card flex-item" id="king" >
                <img src="<%=request.getContextPath()%>/images/rooms/king.webp" class="card-img-top" alt="..." >
                <div class="card-body">
                    <h3 class="card-title">King Bed</h3>
                    <h4 class="card-subtitle mb-2 text-muted ">Features</h4>
                    <ul class="card-text">
                        <li>Maximum occupancy: 2</li>
                        <li>1 king bed</li>
                        <li>Pillowtop mattress, featherbed &amp; duvet</li>
                        <li>Rollaway beds: allowed in some rooms</li>
                        <li>Cribs: 1 permitted</li>
                        <li>Shower/tub combination</li>
                        <li>Robes: 2</li>
                        <li>Hairdryer</li>
                        <li>Locally sourced bath amenities</li>
                        <li>Chair</li>
                        <li>Desk for writing/work</li>
                        <li>Iron &amp; ironing board</li>
                    </ul>
                    <p>$157.50/night</p>
                </div>
            </div>
        </div> <!-- end cards -->
    </div> <!-- end container -->
    <style>
        form {
            display: inline;
            background-color: #ffffff;
        }
        label, input, select {
            padding: 0.5em;
            border-radius: 5px;
            box-sizing: border-box;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
        }
        .resform {
            font-family: Arial, Helvetica, sans-serif;
            width: 80%;
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            padding: 10px;
            box-shadow: 5px 5px 5px 5px lightgrey;
        }

        .button {
            background-color: #000000;
            color: #FFB287;
            text-align: center;
            text-decoration: none;
            height: fit-content;
            padding: 0.5em;
            border-radius: 4px;
        }

        .card {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            height: fit-content;
            transition: 0.3s;
            width: 45%;
            min-width: 300px;

            -webkit-transition: all 1s ease;
            -moz-transition: all 1s ease;
            -o-transition: all 1s ease;
            transition: all 1s ease;

            /*
            &:hover {
                cursor: pointer;
                transform: scale(1.05);
                -webkit-transform: scale(1.05);
                -moz-transform: scale(1.05);
                -ms-transform: scale(1.05);
                -o-transform: scale(1.05);
                transform: scale(1.05);
                -webkit-box-shadow: 3px 3px 5px #000;
                -moz-box-shadow: 3px 3px 5px #000;
                box-shadow: 3px 3px 5px #000;
                -webkit-backface-visibility: hidden;
            */
            }
        }
        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        }
        .card-body {
            padding: 2px 16px;
            background-color: #dcf6ff;
            width: 100%;
        }
        .card-subtitle {
            text-align: left;
            margin: 1em 0 0em 1.5em;
        }
        .card-body ul {
            list-style: none;
            text-align: left;
        }
        .card-body ul li {
            margin: 0.5em 0 ;
        }
        .card-body ul li:first-child {
            margin-top: 0;
        }
        h3 {
            background-color: transparent;
            color: black;
            text-align: center;
        }
        .flex {
            display: flex;
            flex-flow: row wrap;
            align-content: center;
            justify-content: center;
            align-items: center;
            min-width: 200px;
            max-width: 1160px;
            margin-left: auto;
            margin-right: auto;
        }    
        .flex-item {
            display: flex;
            flex-flow: row wrap;
            justify-content: center;
            margin: 30px 10px;
        }
        .flex-item.form {
            display: grid;
            margin: 2%;
            text-align: left;
        }
        .flex-item.form>label {
            grid-row: 1;
        }
        .flex-item.form>input {
            grid-row: 2;
        }
        .flex-item>img {
            border-radius: 5px 5px 0 0;
            width: 100%;
            object-fit: contain;
            /*-webkit-transition: all 1s ease;
            -moz-transition: all 1s ease;
            -o-transition: all 1s ease;
            transition: all 1s ease;

            &:hover {
                transform: scale(1.05);
                -webkit-transform: scale(1.05);
                -moz-transform: scale(1.05);
                -ms-transform: scale(1.05);
                -o-transform: scale(1.05);
                transform: scale(1.05);
                -webkit-box-shadow: 3px 3px 5px #000;
                -moz-box-shadow: 3px 3px 5px #000;
                box-shadow: 3px 3px 5px #000;
                -webkit-backface-visibility: hidden;
            }
            */
        }

        @media screen and (max-width: 850px) {
            .flex {
                flex-direction: column;
                width: 100%;
            } 
            .flex-item {
                width: 100%;
            }
            .card {
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
                min-width: none;
            }
            form {
                display: inline;
            }

        }
    </style>
    <%@ include file = "footer.jsp" %>
</body>
</html>
