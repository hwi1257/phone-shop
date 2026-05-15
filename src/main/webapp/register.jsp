<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">

    <title>Register</title>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
        }

        body{

            min-height:100vh;

            overflow:hidden;

            display:flex;

            justify-content:center;

            align-items:center;

            font-family:
                    -apple-system,
                    BlinkMacSystemFont,
                    sans-serif;

            background:
                    radial-gradient(circle at top left,
                    rgba(0,212,255,0.35),
                    transparent 30%),

                    radial-gradient(circle at bottom right,
                    rgba(168,85,247,0.35),
                    transparent 30%),

                    #020617;
        }

        .aurora{

            position:absolute;

            width:900px;
            height:900px;

            border-radius:50%;

            filter:blur(120px);

            opacity:0.45;

            animation:float 8s infinite alternate ease-in-out;
        }

        .aurora1{

            background:#00d4ff;

            top:-300px;
            left:-300px;
        }

        .aurora2{

            background:#a855f7;

            bottom:-300px;
            right:-300px;
        }

        @keyframes float{

            from{
                transform:translateY(0px);
            }

            to{
                transform:translateY(40px);
            }
        }

        .iphone{

            width:285px;
            height:608px;

            background:
                    linear-gradient(
                            145deg,
                            #2a2a2d,
                            #0f0f10
                    );

            border-radius:50px;

            padding:10px;

            position:relative;

            box-shadow:
                    0 35px 70px rgba(0,0,0,0.7);
        }

        .screen{

            width:100%;
            height:100%;

            border-radius:38px;

            overflow:hidden;

            position:relative;

            background:
                    radial-gradient(circle at top left,
                    rgba(59,130,246,0.3),
                    transparent 35%),

                    radial-gradient(circle at bottom right,
                    rgba(168,85,247,0.3),
                    transparent 35%),

                    #050816;

            display:flex;

            flex-direction:column;

            justify-content:center;

            align-items:center;

            padding:26px;
        }

        .island{

            position:absolute;

            top:14px;
            left:50%;

            transform:translateX(-50%);

            width:104px;
            height:28px;

            background:black;

            border-radius:20px;
        }

        .phone-logo{

            font-size:50px;

            margin-bottom:12px;

            transform:rotate(-12deg);

            background:
                    linear-gradient(
                            180deg,
                            #00d4ff,
                            #a855f7
                    );

            -webkit-background-clip:text;

            -webkit-text-fill-color:transparent;
        }

        .title{

            color:white;

            font-size:30px;

            font-weight:600;

            margin-bottom:30px;
        }

        .form-box{

            width:100%;
        }

        .form-control{

            height:50px;

            border:none;

            border-radius:16px;

            margin-bottom:14px;

            background:
                    rgba(255,255,255,0.08);

            color:white;

            padding-left:16px;

            font-size:14px;

            border:
                    1px solid rgba(255,255,255,0.08);
        }

        .form-control::placeholder{

            color:rgba(255,255,255,0.62);
        }

        .btn-register{

            width:100%;
            height:50px;

            border:none;

            border-radius:16px;

            background:
                    linear-gradient(
                            90deg,
                            #0071e3,
                            #4f46e5
                    );

            color:white;

            font-size:16px;

            font-weight:600;

            margin-top:8px;

            cursor:pointer;
        }

    </style>

</head>

<body>

<div class="aurora aurora1"></div>
<div class="aurora aurora2"></div>

<div class="iphone">

    <div class="screen">

        <div class="island"></div>

        <div class="phone-logo">⚡</div>

        <div class="title">

            Register

        </div>

        <div class="form-box">

            <input type="email"
                   id="email"
                   class="form-control"
                   placeholder="Email">

            <input type="text"
                   id="id"
                   class="form-control"
                   placeholder="ID">

            <input type="password"
                   id="password"
                   class="form-control"
                   placeholder="Password">

            <input type="password"
                   id="confirm"
                   class="form-control"
                   placeholder="Confirm Password">

            <button class="btn-register"
                    onclick="registerUser()">

                Register

            </button>

        </div>

    </div>

</div>

<script>

    function registerUser(){

        const id =
            document.getElementById("id").value;

        const password =
            document.getElementById("password").value;

        const confirm =
            document.getElementById("confirm").value;

        if(password !== confirm){

            alert("PASSWORD NOT MATCH");

            return;
        }

        fetch("register", {

            method:"POST",

            headers:{
                "Content-Type":
                    "application/x-www-form-urlencoded"
            },

            body:
                "id="
                + encodeURIComponent(id)
                +
                "&password="
                + encodeURIComponent(password)

        })
            .then(response => response.text())
            .then(data => {

                if(data.trim() === "success"){

                    alert("REGISTER SUCCESS");

                    window.location.href =
                        "login.jsp";

                } else {

                    alert("REGISTER FAIL");
                }
            });
    }

</script>

</body>

</html>