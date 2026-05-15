<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.phone.api.Phone" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Phone Compare</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>

        body{

            background:#111827;
            color:white;
        }

        .navbar{

            background:#0f172a;
        }

        .card{

            background:#1e293b;
            border:none;

            border-radius:20px;

            transition:0.3s;
        }

        .card:hover{

            transform:translateY(-5px);

            box-shadow:0 0 25px rgba(59,130,246,0.5);
        }

        .card img{

            height:300px;
            object-fit:contain;

            padding:20px;
        }

        .price{

            color:#60a5fa;

            font-size:24px;
            font-weight:bold;
        }

    </style>

</head>

<body>

<nav class="navbar navbar-dark">

    <div class="container">

        <span class="navbar-brand mb-0 h1">

            📱 Phone Compare

        </span>

    </div>

</nav>

<div class="container mt-5">

    <div class="row g-4">

        <%

            List<Phone> phones =
                    (List<Phone>) request.getAttribute("phones");

            if (phones != null) {

                for (Phone phone : phones) {

        %>

        <div class="col-md-4">

            <div class="card h-100 text-light">

                <img src="<%= phone.getImage() %>"
                     class="card-img-top">

                <div class="card-body">

                    <h5 class="card-title">

                        <%= phone.getTitle() %>

                    </h5>

                    <p class="price">

                        <%= phone.getPrice() %>원

                    </p>

                </div>

            </div>

        </div>

        <%

                }
            }

        %>

    </div>

</div>

</body>
</html>