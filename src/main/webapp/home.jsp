<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String loginId =
            (String) session.getAttribute("loginId");

    if(loginId == null){

        response.sendRedirect("login.jsp");

        return;
    }
%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">

    <title>Phone Compare</title>

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

            font-size:16px;
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

            transition:
                    0.8s ease;
        }

        .landscape{

            width:1100px !important;
            height:650px !important;

            border-radius:52px;
        }

        .screen{

            width:100%;
            height:100%;

            border-radius:40px;

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

            z-index:20;
        }

        .back-btn{

            position:absolute;

            top:24px;
            left:26px;

            width:46px;
            height:46px;

            border-radius:16px;

            background:
                    rgba(255,255,255,0.08);

            color:white;

            display:none;

            justify-content:center;
            align-items:center;

            font-size:24px;

            cursor:pointer;

            z-index:50;
        }

        .landscape .back-btn{

            display:flex;
        }

        .logout{

            position:absolute;

            top:18px;
            right:14px;

            color:white;

            text-decoration:none;

            font-size:12px;

            background:
                    linear-gradient(
                            180deg,
                            #00d4ff,
                            #a855f7
                    );

            padding:8px 14px;

            border-radius:12px;

            z-index:50;
        }

        .landscape .logout{

            top:24px;
            right:28px;
        }

        .apps{

            width:100%;
            height:100%;

            display:grid;

            grid-template-columns:
            repeat(2,1fr);

            gap:18px;

            padding:90px 20px 20px;
        }

        .landscape .apps{

            display:none;
        }

        .app{

            background:
                    rgba(255,255,255,0.08);

            border:
                    1px solid rgba(255,255,255,0.08);

            border-radius:28px;

            display:flex;

            flex-direction:column;

            justify-content:center;

            align-items:center;

            color:white;

            cursor:pointer;

            transition:0.3s ease;
        }

        .app:hover{

            transform:scale(1.04);
        }

        .icon{

            font-size:52px;

            margin-bottom:14px;
        }

        .app-name{

            font-size:22px;

            font-weight:600;
        }

        .page{

            position:absolute;

            inset:0;

            opacity:0;

            pointer-events:none;

            transition:
                    0.5s ease;

            padding:
                    90px 30px 30px;

            overflow-y:auto;
        }

        .page::-webkit-scrollbar{

            width:10px;
        }

        .page::-webkit-scrollbar-track{

            background:
                    rgba(120,120,120,0.25);

            border-radius:20px;
        }

        .page::-webkit-scrollbar-thumb{

            background:
                    rgba(20,20,20,0.9);

            border-radius:20px;

            border:
                    2px solid rgba(160,160,160,0.45);
        }

        .landscape.show-3dmark .benchmark-page{

            opacity:1;

            pointer-events:auto;
        }

        .landscape.show-antutu .antutu-page{

            opacity:1;

            pointer-events:auto;
        }

        .benchmark-title{

            color:white;

            font-size:42px;

            font-weight:700;

            margin-bottom:30px;
        }

        .phone-card{

            background:
                    rgba(255,255,255,0.06);

            border:
                    1px solid rgba(255,255,255,0.08);

            border-radius:24px;

            padding:20px;

            margin-bottom:18px;

            backdrop-filter:blur(20px);
        }

        .phone-top{

            display:flex;

            justify-content:space-between;

            align-items:center;

            margin-bottom:14px;
        }

        .phone-name{

            color:white;

            font-size:22px;

            font-weight:700;
        }

        .phone-score{

            color:#00d4ff;

            font-size:24px;

            font-weight:700;
        }

        .chip{

            color:
                    rgba(255,255,255,0.72);

            margin-bottom:14px;

            font-size:15px;
        }

        .bar{

            width:100%;
            height:14px;

            border-radius:30px;

            background:
                    rgba(255,255,255,0.08);

            overflow:hidden;
        }

        .fill{

            height:100%;

            border-radius:30px;

            background:
                    linear-gradient(
                            90deg,
                            #00d4ff,
                            #a855f7
                    );
        }
        body{

            transition:
                    0.5s ease;
        }

        body.page-out{

            opacity:0;

            transform:
                    scale(0.96);
        }
    </style>

</head>

<body>

<div class="navbar-custom">

    <div class="logo">

        <span class="logo-icon">⚡</span>

        Phone Compare

    </div>

    <div class="menu">

        <a href="#">가격 비교</a>
        <a href="#">AnTuTu</a>
        <a href="#">3DMark</a>
        <a href="#">Compare</a>

    </div>

</div>

<div class="iphone">

    <div class="screen">

        <div class="island"></div>

        <div class="back-btn"
             onclick="closeLandscape()">

            ←

        </div>

        <a href="logout"
           class="logout">

            Logout

        </a>

        <div class="apps">

            <div class="app"
                 onclick="goPrice()">

                <div class="icon">💲</div>

                <div class="app-name">

                    Prices

                </div>

            </div>

            <div class="app"
                 onclick="open3DMark()">

                <div class="icon">🧊</div>

                <div class="app-name">

                    3DMark

                </div>

            </div>

            <div class="app"
                 onclick="openAntutu()">

                <div class="icon">🔥</div>

                <div class="app-name">

                    AnTuTu

                </div>

            </div>

            <div class="app"
                 onclick="goCompare()">

                <div class="icon">📱</div>

                <div class="app-name">

                    Compare

                </div>

            </div>

        </div>

        <div class="page benchmark-page">

            <div class="benchmark-title">

                3DMark Ranking

            </div>

            <div id="phoneList"></div>

        </div>

        <div class="page antutu-page">

            <div class="benchmark-title">

                AnTuTu Ranking

            </div>

            <div id="antutuList"></div>

        </div>

    </div>

</div>


<script>
    function goCompare(){

        document.body.classList.add(
            "page-out"
        );

        setTimeout(()=>{

            location.href='compare.jsp';

        },500);
    }
    const phones = [

        {
            name:"🍎 iPhone 17 Pro Max",
            chip:"Apple A19 Pro",
            score:3790
        },

        {
            name:"🍎 iPhone 17 Pro",
            chip:"Apple A19 Pro",
            score:3777
        },

        {
            name:"🍎 iPhone Air",
            chip:"Apple A19 Pro",
            score:3677
        },

        {
            name:"🍎 iPhone 17",
            chip:"Apple A19",
            score:3618
        },

        {
            name:"🍎 iPhone 16 Pro",
            chip:"Apple A18 Pro",
            score:3445
        },

        {
            name:"🍎 iPhone 16 Pro Max",
            chip:"Apple A18 Pro",
            score:3427
        },

        {
            name:"🟦 삼성 갤럭시 S26 울트라",
            chip:"퀄컴 스냅드래곤 8 엘리트 Gen 5",
            score:3380
        },

        {
            name:"🟦 삼성 갤럭시 S26+",
            chip:"퀄컴 스냅드래곤 8 엘리트 Gen 5",
            score:3375
        },

        {
            name:"🟦 삼성 갤럭시 S26",
            chip:"퀄컴 스냅드래곤 8 엘리트 Gen 5",
            score:3370
        },

        {
            name:"🍎 iPhone 16 Plus",
            chip:"Apple A18",
            score:3321
        },

        {
            name:"🍎 iPhone 16",
            chip:"Apple A18",
            score:3318
        },

        {
            name:"🍎 iPhone 16e",
            chip:"Apple A18",
            score:3244
        },

        {
            name:"🍎 iPhone 15 Pro",
            chip:"Apple A17 Pro",
            score:2884
        },

        {
            name:"🍎 iPhone 15 Pro Max",
            chip:"Apple A17 Pro",
            score:2876
        },

        {
            name:"🟦 삼성 갤럭시 S25 울트라",
            chip:"퀄컴 스냅드래곤 8 엘리트",
            score:2847
        },

        {
            name:"🟦 삼성 갤럭시 S25+",
            chip:"퀄컴 스냅드래곤 8 엘리트",
            score:2841
        },

        {
            name:"🟦 삼성 갤럭시 S25",
            chip:"퀄컴 스냅드래곤 8 엘리트",
            score:2723
        },

        {
            name:"🍎 iPhone 14 Pro",
            chip:"Apple A16 Bionic",
            score:2616
        },

        {
            name:"🍎 iPhone 14 Pro Max",
            chip:"Apple A16 Bionic",
            score:2607
        },

        {
            name:"🍎 iPhone 15 Plus",
            chip:"Apple A16 Bionic",
            score:2552
        },

        {
            name:"🍎 iPhone 15",
            chip:"Apple A16 Bionic",
            score:2551
        },

        {
            name:"🟦 삼성 갤럭시 Z 폴드7",
            chip:"퀄컴 스냅드래곤 8 엘리트",
            score:2529
        },

        {
            name:"🍎 iPhone 13 Pro Max",
            chip:"Apple A15 Bionic",
            score:2350
        },

        {
            name:"🍎 iPhone 13 Pro",
            chip:"Apple A15 Bionic",
            score:2348
        },

        {
            name:"🍎 iPhone 14",
            chip:"Apple A15 Bionic",
            score:2273
        },

        {
            name:"🍎 iPhone 14 Plus",
            chip:"Apple A15 Bionic",
            score:2272
        },

        {
            name:"🍎 iPhone SE 3",
            chip:"Apple A15 Bionic",
            score:2269
        },

        {
            name:"🍎 iPhone 13 mini",
            chip:"Apple A15 Bionic",
            score:2224
        },

        {
            name:"🍎 iPhone 13",
            chip:"Apple A15 Bionic",
            score:2215
        },

        {
            name:"🟦 삼성 갤럭시 S24+",
            chip:"퀄컴 스냅드래곤 8 3세대",
            score:2104
        },

        {
            name:"🟦 삼성 갤럭시 S24 울트라",
            chip:"퀄컴 스냅드래곤 8 3세대",
            score:2102
        },

        {
            name:"🍎 iPhone 12 Pro Max",
            chip:"Apple A14 Bionic",
            score:2128
        },

        {
            name:"🍎 iPhone 12 Pro",
            chip:"Apple A14 Bionic",
            score:2082
        },

        {
            name:"🍎 iPhone 12 Mini",
            chip:"Apple A14 Bionic",
            score:2034
        },

        {
            name:"🍎 iPhone 12",
            chip:"Apple A14 Bionic",
            score:2031
        },

        {
            name:"🟦 삼성 갤럭시 S24",
            chip:"퀄컴 스냅드래곤 8 3세대",
            score:2041
        },

        {
            name:"🟦 삼성 갤럭시 S24+",
            chip:"삼성 엑시노스 2400",
            score:2036
        },

        {
            name:"🟦 삼성 갤럭시 Z 폴드6",
            chip:"퀄컴 스냅드래곤 8 3세대",
            score:2024
        },

        {
            name:"🟦 삼성 갤럭시 S24",
            chip:"삼성 엑시노스 2400",
            score:1938
        },

        {
            name:"🟦 삼성 갤럭시 S23+",
            chip:"퀄컴 스냅드래곤 8 2세대",
            score:1919
        },

        {
            name:"🟦 삼성 갤럭시 Z 폴드5",
            chip:"퀄컴 스냅드래곤 8 2세대",
            score:1914
        },

        {
            name:"🟦 삼성 갤럭시 S23 울트라",
            chip:"퀄컴 스냅드래곤 8 2세대",
            score:1907
        },

        {
            name:"🟦 삼성 갤럭시 S23",
            chip:"퀄컴 스냅드래곤 8 2세대",
            score:1871
        },

        {
            name:"🟦 삼성 갤럭시 Z 플립6",
            chip:"퀄컴 스냅드래곤 8 3세대",
            score:1815
        },

        {
            name:"🟦 삼성 갤럭시 Z 플립5",
            chip:"퀄컴 스냅드래곤 8 2세대",
            score:1772
        },

        {
            name:"🍎 iPhone 11 Pro Max",
            chip:"Apple A13 Bionic",
            score:1720
        },

        {
            name:"🍎 iPhone 11 Pro",
            chip:"Apple A13 Bionic",
            score:1706
        },

        {
            name:"🍎 iPhone 11",
            chip:"Apple A13 Bionic",
            score:1704
        },

        {
            name:"🟦 삼성 갤럭시 Z 폴드4",
            chip:"퀄컴 스냅드래곤 8+ 1세대",
            score:1685
        },

        {
            name:"🟦 삼성 갤럭시 Z 플립4",
            chip:"퀄컴 스냅드래곤 8+ 1세대",
            score:1546
        },

        {
            name:"🟦 삼성 갤럭시 S23 FE",
            chip:"삼성 엑시노스 2200",
            score:1530
        }

    ];

    const antutuPhones = [

        {
            name:"🟦 삼성 갤럭시 S26 울트라",
            chip:"Snapdragon 8 Elite Gen 5 OC",
            score:3484761
        },

        {
            name:"🟦 삼성 갤럭시 S25 울트라",
            chip:"Snapdragon 8 Elite OC",
            score:2850981
        },

        {
            name:"🟦 삼성 갤럭시 S25+",
            chip:"Snapdragon 8 Elite OC",
            score:2774381
        },

        {
            name:"🟦 삼성 갤럭시 S25",
            chip:"Snapdragon 8 Elite OC",
            score:2646876
        },

        {
            name:"🍎 iPhone 17 Pro Max",
            chip:"Apple A19 Pro",
            score:2345004
        },

        {
            name:"🍎 iPhone 17 Pro",
            chip:"Apple A19 Pro",
            score:2272175
        },

        {
            name:"🟦 삼성 갤럭시 S24 울트라",
            chip:"Snapdragon 8 Gen 3 OC",
            score:2195161
        },

        {
            name:"🍎 iPhone 17",
            chip:"Apple A19",
            score:2080107
        },

        {
            name:"🍎 iPhone 17e",
            chip:"Apple A19",
            score:2076262
        },

        {
            name:"🟦 삼성 갤럭시 S25 FE",
            chip:"Exynos 2400",
            score:2019182
        },

        {
            name:"🟦 삼성 갤럭시 S24+",
            chip:"Exynos 2400",
            score:1955043
        },

        {
            name:"🟦 삼성 갤럭시 S24",
            chip:"Exynos 2400",
            score:1902772
        },

        {
            name:"🍎 iPhone 16 Plus",
            chip:"Apple A18",
            score:1904372
        },

        {
            name:"🍎 iPhone 16",
            chip:"Apple A18",
            score:1893051
        },

        {
            name:"🍎 iPhone Air",
            chip:"Apple A19 Pro",
            score:1771978
        },

        {
            name:"🍎 iPhone 16 Pro",
            chip:"Apple A18 Pro",
            score:1724111
        },

        {
            name:"🍎 iPhone 16 Pro Max",
            chip:"Apple A18 Pro",
            score:1689843
        },

        {
            name:"🟦 삼성 갤럭시 S23 울트라",
            chip:"Snapdragon 8 Gen 2 OC",
            score:1684419
        },

        {
            name:"🟦 삼성 갤럭시 S23",
            chip:"Snapdragon 8 Gen 2 OC",
            score:1656561
        },

        {
            name:"🍎 iPhone 16e",
            chip:"Apple A18",
            score:1624259
        },

        {
            name:"🍎 iPhone 15 Plus",
            chip:"Apple A16",
            score:1561917
        },

        {
            name:"🍎 iPhone 15",
            chip:"Apple A16",
            score:1559009
        },

        {
            name:"🍎 iPhone 15 Pro",
            chip:"Apple A17 Pro",
            score:1455385
        },

        {
            name:"🍎 iPhone 14",
            chip:"Apple A15",
            score:1452784
        },

        {
            name:"🍎 iPhone 14 Plus",
            chip:"Apple A15",
            score:1429425
        },

        {
            name:"🍎 iPhone 15 Pro Max",
            chip:"Apple A17 Pro",
            score:1359948
        },

        {
            name:"🍎 iPhone 13",
            chip:"Apple A15",
            score:1347625
        },

        {
            name:"🍎 iPhone 14 Pro",
            chip:"Apple A16",
            score:1317587
        },

        {
            name:"🍎 iPhone SE3",
            chip:"Apple A15",
            score:1297142
        },

        {
            name:"🍎 iPhone 13 mini",
            chip:"Apple A15",
            score:1296360
        },

        {
            name:"🍎 iPhone 14 Pro Max",
            chip:"Apple A16",
            score:1273098
        },

        {
            name:"🍎 iPhone 12 Pro Max",
            chip:"Apple A14",
            score:1239402
        },

        {
            name:"🍎 iPhone 12 Pro",
            chip:"Apple A14",
            score:1220679
        }

    ];

    const phoneList =
        document.getElementById("phoneList");

    phones.forEach(phone => {

        const percent =
            phone.score / 40;

        phoneList.innerHTML += `

        <div class="phone-card">

            <div class="phone-top">

                <div class="phone-name">

                    ${phone.name}

                </div>

                <div class="phone-score">

                    ${phone.score}

                </div>

            </div>

            <div class="chip">

                ${phone.chip}

            </div>

            <div class="bar">

                <div class="fill"
                     style="width:${percent}%">

                </div>

            </div>

        </div>

    `;
    });

    const antutuList =
        document.getElementById("antutuList");

    antutuPhones.forEach(phone => {

        const percent =
            phone.score / 40000;

        antutuList.innerHTML += `

        <div class="phone-card">

            <div class="phone-top">

                <div class="phone-name">

                    ${phone.name}

                </div>

                <div class="phone-score">

                    ${phone.score.toLocaleString()}

                </div>

            </div>

            <div class="chip">

                ${phone.chip}

            </div>

            <div class="bar">

                <div class="fill"
                     style="width:${percent}%">

                </div>

            </div>

        </div>

    `;
    });

    function open3DMark(){

        const phone =
            document.querySelector(".iphone");

        phone.classList.remove("show-antutu");

        phone.classList.add("landscape");

        phone.classList.add("show-3dmark");
    }

    function openAntutu(){

        const phone =
            document.querySelector(".iphone");

        phone.classList.remove("show-3dmark");

        phone.classList.add("landscape");

        phone.classList.add("show-antutu");
    }

    function closeLandscape(){

        const phone =
            document.querySelector(".iphone");

        phone.classList.remove("landscape");

        phone.classList.remove("show-antutu");

        phone.classList.remove("show-3dmark");
    }


    function goPrice(){

        document.body.classList.add(
            "page-out"
        );

        setTimeout(()=>{

            location.href='price.jsp';

        },500);
    }
</script>

</body>

</html>