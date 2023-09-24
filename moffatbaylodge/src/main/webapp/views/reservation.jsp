<!--
    Team Delta
    Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.time.LocalDate" %>

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
                    <h4 class="card-subtitle mb-2 text-muted ">Card subtitle</h4>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    $115.50
                </div>
            </div>

            <div class="card flex-item" id="queen" >
                <img src="<%=request.getContextPath()%>/images/rooms/queen.webp" class="card-img-top" alt="..." >
                <div class="card-body">
                    <h3 class="card-title">Queen Bed</h3>
                    <h4 class="card-subtitle mb-2 text-muted ">Card subtitle</h4>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    $120.75
                </div>
            </div>

            <div class="card flex-item" id="double-queen" >
                <img src="<%=request.getContextPath()%>/images/rooms/double-queen.jpg" class="card-img-top" alt="..." >
                <div class="card-body">
                    <h3 class="card-title">Double Queen Beds</h3>
                    <h4 class="card-subtitle mb-2 text-muted ">Card subtitle</h4>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    $131.25
                </div>
            </div>

            <div class="card flex-item" id="king" >
                <img src="<%=request.getContextPath()%>/images/rooms/king.webp" class="card-img-top" alt="..." >
                <div class="card-body">
                    <h3 class="card-title">King Bed</h3>
                    <h4 class="card-subtitle mb-2 text-muted ">Card subtitle</h4>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    $157.50
                </div>
            </div>
        </div> <!-- end cards -->
    </div> <!-- end container -->
    <style>
        form {
            display: inline;
        }
        .resform {
            background-color: #ffffff;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 1em;
            width: 80%;
            text-align: center;
            margin-top: 5%;
            margin-left: auto;
            margin-right: auto;
            padding: 10px;
            box-shadow: 5px 5px 5px 5px lightgrey;
        }

        .resform > h1 {
            text-align: left;
        }

        .button {
            background-color: #000000;
            color: #FFB287;
            text-align: center;
            text-decoration: none;
            font-size: 1em;
            padding: 10px;
            border-radius: 4px;
        }

        .card {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            height: fit-content;
            transition: 0.3s;
            width: 40%;
            min-width: 300px;

            -webkit-transition: all 1s ease;
            -moz-transition: all 1s ease;
            -o-transition: all 1s ease;
            transition: all 1s ease;

            &:hover {
                cursor: pointer;
            /*    transform: scale(1.05);
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
            min-width: 200px;
            max-width: 1160px;
            margin-left: auto;
            margin-right: auto;
        }    
        .flex-item {
            display: flex;
            flex-flow: row wrap;
            justify-content: left;
            margin: 2rem;
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
            height: 500px;
            width: 100%;
            object-fit: cover;
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

        @media screen and (max-width: 820px) {
            .flex {
                flex-direction: column;
            } 
            .card {
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
                width: 100%;
                min-width: none;
            }
            form {
                display: inline;
            }
            .grid-container{
                display: grid;
                gap: 10px 10px;
            }
            .grid-item {
                text-align: left;
                width: 8em;
            }
            .grid-item.label{
                grid-row: 1;
            }
            .grid-item.input{
                grid-row: 2;
            }

            .grid-item-button {
                grid-row: 3;
            }
            .grid-item-button {
                grid-row: 5;
                grid-column: 1/3;
            }
        }
    </style>
    <%@ include file = "footer.jsp" %>
</body>
</html>
