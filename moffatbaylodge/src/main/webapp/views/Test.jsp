<!--
    Team Delta
    Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
-->


<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js" integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Gloock&display=swap" rel="stylesheet" />

    <title>Reservation | Moffat Bay Lodge</title>

    <style type="text/css">
        .resform {
            background-color: #ffffff;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 1em;
            width: 80%;
            text-align: center;
            margin-top: 5%;
            margin-bottom: 10%;
            margin-left: 10%;
            padding: 10px;
            box-shadow: 5px 5px 5px lightgrey;
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
    </style>
</head>
<body>
    <%@ include file = "header.jsp" %>
    <div class="container">


        <div class="resform">
            <h1>Reservation Lookup</h1>
    
            <form method="POST" action="reservationlookup">
        
            <input type="text" name="search" placeholder="Search...">
            <select name="searchby" id="guestcount" required>
                <option value="">Search by...</option>
                <option value="resid">Reservation ID</option>
                <option value="email">Email</option>
            </select>
            
            <button type="submit" class="button">Search</button>
            </form>
        </div>

        
    </div>
    <%@ include file = "footer.jsp" %>
    <style>
        
    </style>
</body>
</html>
