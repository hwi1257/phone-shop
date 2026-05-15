<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  String loginId =
          (String) session.getAttribute("loginId");

  if(loginId != null){

    response.sendRedirect("home.jsp");

    return;
  }
%>

<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="UTF-8">

  <title>Phone Compare</title>

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

      padding-top:120px;

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

    .navbar-custom{

      position:fixed;

      top:20px;
      left:50%;

      transform:translateX(-50%);

      width:88%;

      height:72px;

      border-radius:28px;

      background:
              rgba(15,23,42,0.55);

      backdrop-filter:blur(30px);

      border:
              1px solid rgba(255,255,255,0.08);

      display:flex;

      justify-content:space-between;

      align-items:center;

      padding:0 35px;

      z-index:100;
    }

    .logo{

      display:flex;

      align-items:center;

      gap:12px;

      color:white;

      font-size:30px;

      font-weight:700;
    }

    .logo-icon{

      font-size:28px;

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

    .menu{

      display:flex;

      gap:38px;
    }

    .menu a{

      color:rgba(255,255,255,0.78);

      text-decoration:none;
    }

    .iphone{

      width:285px;
      height:608px;

      margin-top:10px;

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

      overflow:hidden;
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

      z-index:10;
    }

    .page{

      position:absolute;

      width:100%;
      height:100%;

      top:0;
      left:0;

      display:flex;

      flex-direction:column;

      justify-content:center;

      align-items:center;

      padding:26px;

      transition:0.45s ease;
    }

    .active{

      transform:translateX(0);
      opacity:1;
    }

    .left{

      transform:translateX(-100%);
      opacity:0;
    }

    .right{

      transform:translateX(100%);
      opacity:0;
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

    .btn-main{

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

    .bottom-text{

      margin-top:22px;

      color:rgba(255,255,255,0.65);

      font-size:13px;
    }

    .bottom-text a{

      color:white;

      text-decoration:none;

      font-weight:600;

      cursor:pointer;
    }

  </style>

</head>

<body>

<div class="aurora aurora1"></div>
<div class="aurora aurora2"></div>

<div class="navbar-custom">

  <div class="logo">

    <span class="logo-icon">⚡</span>

    Phone Compare

  </div>

  <div class="menu">

    <a href="#">Prices</a>
    <a href="#">3DMark</a>
    <a href="#">AnTuTu</a>
    <a href="#">Compare</a>

  </div>

</div>

<div class="iphone">

  <div class="screen">

    <div class="island"></div>

    <!-- 로그인 -->
    <div id="loginPage"
         class="page active">

      <div class="phone-logo">⚡</div>

      <div class="title">

        Sign in

      </div>

      <div class="form-box">

        <input type="text"
               id="loginId"
               class="form-control"
               placeholder="ID">

        <input type="password"
               id="loginPassword"
               class="form-control"
               placeholder="Password">

        <button class="btn-main"
                onclick="loginUser()">

          Continue

        </button>

      </div>

      <div class="bottom-text">

        Don’t have an account?

        <a onclick="showRegister()">

          Create one

        </a>

      </div>

    </div>

    <!-- 회원가입 -->
    <div id="registerPage"
         class="page right">

      <div class="phone-logo">⚡</div>

      <div class="title">

        Register

      </div>

      <div class="form-box">

        <input type="email"
               class="form-control"
               placeholder="Email">

        <input type="text"
               id="registerId"
               class="form-control"
               placeholder="ID">

        <input type="password"
               id="registerPassword"
               class="form-control"
               placeholder="Password">

        <input type="password"
               id="confirmPassword"
               class="form-control"
               placeholder="Confirm Password">

        <button class="btn-main"
                onclick="registerUser()">

          Register

        </button>

      </div>

      <div class="bottom-text">

        Already have an account?

        <a onclick="showLogin()">

          Sign in

        </a>

      </div>

    </div>

  </div>

</div>

<script>

  const loginPage =
          document.getElementById("loginPage");

  const registerPage =
          document.getElementById("registerPage");

  function showRegister(){

    loginPage.classList.remove("active");
    loginPage.classList.add("left");

    registerPage.classList.remove("right");
    registerPage.classList.add("active");
  }

  function showLogin(){

    registerPage.classList.remove("active");
    registerPage.classList.add("right");

    loginPage.classList.remove("left");
    loginPage.classList.add("active");
  }

  function loginUser(){

    const id =
            document.getElementById("loginId").value;

    const password =
            document.getElementById("loginPassword").value;

    fetch("login", {

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

                window.location.href =
                        "home.jsp";

              } else {

                alert("INVALID LOGIN");
              }
            });
  }

  function registerUser(){

    const id =
            document.getElementById("registerId").value;

    const password =
            document.getElementById("registerPassword").value;

    const confirm =
            document.getElementById("confirmPassword").value;

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

                showLogin();

              } else {

                alert("REGISTER FAIL");
              }
            });
  }

</script>

</body>

</html>