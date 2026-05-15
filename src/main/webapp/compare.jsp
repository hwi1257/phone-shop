<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">

    <title>Compare Phones</title>

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

            gap:60px;

            font-family:
                    -apple-system,
                    BlinkMacSystemFont,
                    sans-serif;

            background:
                    radial-gradient(circle at top left,
                    rgba(0,212,255,0.25),
                    transparent 30%),

                    radial-gradient(circle at bottom right,
                    rgba(168,85,247,0.25),
                    transparent 30%),

                    #020617;
        }

        .phone{

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

            overflow:hidden;

            animation:
                    phoneIn 0.7s ease;
        }

        .screen{

            width:100%;
            height:100%;

            border-radius:40px;

            overflow:hidden;

            position:relative;

            background:
                    linear-gradient(
                            180deg,
                            #0f172a,
                            #111827
                    );
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

        .brand-select{

            position:absolute;

            top:80px;
            left:50%;

            transform:translateX(-50%);

            width:220px;

            padding:14px;

            border:none;

            border-radius:16px;

            background:
                    rgba(255,255,255,0.08);

            color:white;

            font-size:16px;

            outline:none;

            backdrop-filter:blur(20px);
        }

        .phone-select{

            position:absolute;

            top:145px;
            left:50%;

            transform:translateX(-50%);

            width:220px;

            padding:14px;

            border:none;

            border-radius:16px;

            background:
                    rgba(255,255,255,0.08);

            color:white;

            font-size:16px;

            outline:none;

            backdrop-filter:blur(20px);
        }

        .brand-select option,
        .phone-select option{

            background:#111827;

            color:white;
        }

        .spec-box{

            position:absolute;

            top:220px;
            left:20px;
            right:20px;

            color:white;
        }

        .spec-name{

            font-size:24px;

            font-weight:700;

            margin-bottom:12px;
        }

        .spec-chip{

            font-size:15px;

            color:
                    rgba(255,255,255,0.72);

            margin-bottom:20px;
        }

        .score-box{

            margin-bottom:18px;
        }

        .score-title{

            font-size:14px;

            margin-bottom:8px;

            color:
                    rgba(255,255,255,0.75);
        }

        .score{

            font-size:28px;

            font-weight:700;

            color:#ffffff;
        }

        .bar{

            width:100%;
            height:14px;

            border-radius:30px;

            background:
                    rgba(255,255,255,0.08);

            overflow:hidden;

            margin-top:10px;
        }

        .fill{

            height:100%;

            border-radius:30px;

            transition:0.5s ease;

            background-size:
                    300% 300%;

            animation:
                    auroraBar 6s ease infinite;
        }

        .empty-ui{

            position:absolute;

            top:250px;
            left:50%;

            transform:translateX(-50%);

            width:210px;

            display:flex;

            flex-direction:column;

            align-items:center;

            gap:20px;
        }

        .aurora-box{

            width:190px;
            height:190px;

            border-radius:34px;

            position:relative;

            overflow:hidden;

            background:
                    linear-gradient(
                            135deg,
                            rgba(0,212,255,0.45),
                            rgba(168,85,247,0.45),
                            rgba(59,130,246,0.45)
                    );

            animation:
                    auroraMove 6s linear infinite;

            box-shadow:
                    0 0 40px rgba(0,212,255,0.18);
        }

        .aurora-glow{

            position:absolute;

            inset:-40px;

            background:
                    radial-gradient(
                            circle,
                            rgba(255,255,255,0.25),
                            transparent 60%
                    );

            animation:
                    rotateGlow 8s linear infinite;
        }

        .phone-image{

            position:absolute;

            top:50%;
            left:50%;

            transform:
                    translate(-50%,-50%);

            width:82px;

            opacity:0.92;

            filter:
                    drop-shadow(
                            0 0 18px
                            rgba(255,255,255,0.18)
                    );
        }

        .empty-text{

            color:
                    rgba(255,255,255,0.5);

            font-size:18px;

            font-weight:600;

            text-align:center;

            line-height:1.5;
        }

        .back{

            position:fixed;

            top:30px;
            left:30px;

            width:54px;
            height:54px;

            border-radius:18px;

            background:
                    rgba(255,255,255,0.08);

            color:white;

            display:flex;

            justify-content:center;
            align-items:center;

            font-size:26px;

            cursor:pointer;
        }

        #compareResult{

            position:fixed;

            top:50%;

            right:40px;

            transform:
                    translateY(-50%);

            z-index:999;
        }

        .compare-result-box{

            background:
                    rgba(15,23,42,0.88);

            border:
                    1px solid rgba(255,255,255,0.08);

            backdrop-filter:
                    blur(20px);

            color:white;

            padding:
                    24px 32px;

            border-radius:28px;

            text-align:center;

            line-height:1.8;

            font-size:15px;

            min-width:280px;

            box-shadow:
                    0 20px 50px rgba(0,0,0,0.35);

            opacity:0;

            transform:
                    translateX(50px)
                    scale(0.92);

            animation:
                    resultIn 0.7s ease forwards;
        }

        .compare-title{

            font-size:20px;

            font-weight:700;

            margin-bottom:18px;
        }

        .compare-highlight{

            color:#00d4ff;

            font-weight:700;
        }

        @keyframes phoneIn{

            from{

                opacity:0;

                transform:
                        translateY(40px)
                        scale(0.9);
            }

            to{

                opacity:1;

                transform:
                        translateY(0)
                        scale(1);
            }
        }

        @keyframes auroraMove{

            0%{

                filter:hue-rotate(0deg);
            }

            100%{

                filter:hue-rotate(360deg);
            }
        }

        @keyframes rotateGlow{

            from{

                transform:rotate(0deg);
            }

            to{

                transform:rotate(360deg);
            }
        }

        @keyframes auroraBar{

            0%{

                background-position:
                        0% 50%;
            }

            50%{

                background-position:
                        100% 50%;
            }

            100%{

                background-position:
                        0% 50%;
            }
        }

        @keyframes resultIn{

            from{

                opacity:0;

                transform:
                        translateX(50px)
                        scale(0.92);
            }

            to{

                opacity:1;

                transform:
                        translateX(0)
                        scale(1);
            }
        }

    </style>

</head>

<body>

<div class="back"
     onclick="location.href='home.jsp'">

    ←

</div>

<div class="phone">

    <div class="screen">

        <div class="island"></div>

        <select class="brand-select"
                onchange="changeLeftBrand(this.value)">

            <option value="">

                제조사 선택

            </option>

            <option value="apple">

                Apple

            </option>

            <option value="samsung">

                Samsung

            </option>

        </select>

        <select class="phone-select"
                id="leftPhoneSelect"
                onchange="selectLeftPhone(this.value)">

            <option value="">

                핸드폰 선택

            </option>

        </select>

        <div class="empty-ui"
             id="leftEmpty">

            <div class="aurora-box">

                <div class="aurora-glow"></div>

                <img class="phone-image"
                     src="https://cdn-icons-png.flaticon.com/512/545/545245.png">

            </div>

            <div class="empty-text">

                Select Brand<br>
                And Phone

            </div>

        </div>

        <div class="spec-box"
             id="leftSpec">

        </div>

    </div>

</div>

<div class="phone">

    <div class="screen">

        <div class="island"></div>

        <select class="brand-select"
                onchange="changeRightBrand(this.value)">

            <option value="">

                제조사 선택

            </option>

            <option value="apple">

                Apple

            </option>

            <option value="samsung">

                Samsung

            </option>

        </select>

        <select class="phone-select"
                id="rightPhoneSelect"
                onchange="selectRightPhone(this.value)">

            <option value="">

                핸드폰 선택

            </option>

        </select>

        <div class="empty-ui"
             id="rightEmpty">

            <div class="aurora-box">

                <div class="aurora-glow"></div>

                <img class="phone-image"
                     src="https://cdn-icons-png.flaticon.com/512/545/545245.png">

            </div>

            <div class="empty-text">

                Select Brand<br>
                And Phone

            </div>

        </div>

        <div class="spec-box"
             id="rightSpec">

        </div>

    </div>

</div>

<div id="compareResult"></div>

<script>

    const phones = [

        {
            brand:"apple",
            name:"🍎 iPhone 17 Pro Max",
            chip:"Apple A19 Pro",
            score3d:3790,
            antutu:2345004
        },

        {
            brand:"apple",
            name:"🍎 iPhone 17 Pro",
            chip:"Apple A19 Pro",
            score3d:3777,
            antutu:2272175
        },

        {
            brand:"apple",
            name:"🍎 iPhone Air",
            chip:"Apple A19 Pro",
            score3d:3677,
            antutu:2067200
        },

        {
            brand:"apple",
            name:"🍎 iPhone 17",
            chip:"Apple A19",
            score3d:3618,
            antutu:2080107
        },

        {
            brand:"apple",
            name:"🍎 iPhone 16 Pro",
            chip:"Apple A18 Pro",
            score3d:3445,
            antutu:1724111
        },

        {
            brand:"apple",
            name:"🍎 iPhone 16 Pro Max",
            chip:"Apple A18 Pro",
            score3d:3427,
            antutu:1689843
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 S26 울트라",
            chip:"Snapdragon 8 Elite Gen 5 OC",
            score3d:3380,
            antutu:3484761
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 S26+",
            chip:"Snapdragon 8 Elite Gen 5",
            score3d:3375,
            antutu:3320000
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 S26",
            chip:"Snapdragon 8 Elite Gen 5",
            score3d:3370,
            antutu:3260000
        },

        {
            brand:"apple",
            name:"🍎 iPhone 16 Plus",
            chip:"Apple A18",
            score3d:3321,
            antutu:1904372
        },

        {
            brand:"apple",
            name:"🍎 iPhone 16",
            chip:"Apple A18",
            score3d:3318,
            antutu:1893051
        },

        {
            brand:"apple",
            name:"🍎 iPhone 16e",
            chip:"Apple A18",
            score3d:3244,
            antutu:1624259
        },

        {
            brand:"apple",
            name:"🍎 iPhone 15 Pro",
            chip:"Apple A17 Pro",
            score3d:2884,
            antutu:1455385
        },

        {
            brand:"apple",
            name:"🍎 iPhone 15 Pro Max",
            chip:"Apple A17 Pro",
            score3d:2876,
            antutu:1359948
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 S25 울트라",
            chip:"Snapdragon 8 Elite OC",
            score3d:2847,
            antutu:2850981
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 S25+",
            chip:"Snapdragon 8 Elite OC",
            score3d:2841,
            antutu:2774381
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 S25",
            chip:"Snapdragon 8 Elite OC",
            score3d:2723,
            antutu:2646876
        },

        {
            brand:"apple",
            name:"🍎 iPhone 14 Pro",
            chip:"Apple A16 Bionic",
            score3d:2616,
            antutu:1317587
        },

        {
            brand:"apple",
            name:"🍎 iPhone 14 Pro Max",
            chip:"Apple A16 Bionic",
            score3d:2607,
            antutu:1273098
        },

        {
            brand:"apple",
            name:"🍎 iPhone 15 Plus",
            chip:"Apple A16",
            score3d:2552,
            antutu:1561917
        },

        {
            brand:"apple",
            name:"🍎 iPhone 15",
            chip:"Apple A16",
            score3d:2551,
            antutu:1559009
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 Z 폴드7",
            chip:"Snapdragon 8 Elite",
            score3d:2529,
            antutu:2640000
        },

        {
            brand:"apple",
            name:"🍎 iPhone 13 Pro Max",
            chip:"Apple A15 Bionic",
            score3d:2350,
            antutu:1350000
        },

        {
            brand:"apple",
            name:"🍎 iPhone 13 Pro",
            chip:"Apple A15 Bionic",
            score3d:2348,
            antutu:1330000
        },

        {
            brand:"apple",
            name:"🍎 iPhone 14",
            chip:"Apple A15",
            score3d:2273,
            antutu:1452784
        },

        {
            brand:"apple",
            name:"🍎 iPhone 14 Plus",
            chip:"Apple A15",
            score3d:2272,
            antutu:1429425
        },

        {
            brand:"apple",
            name:"🍎 iPhone SE 3",
            chip:"Apple A15",
            score3d:2269,
            antutu:1297142
        },

        {
            brand:"apple",
            name:"🍎 iPhone 13 mini",
            chip:"Apple A15",
            score3d:2224,
            antutu:1296360
        },

        {
            brand:"apple",
            name:"🍎 iPhone 13",
            chip:"Apple A15",
            score3d:2215,
            antutu:1347625
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 S24+",
            chip:"Snapdragon 8 Gen 3",
            score3d:2104,
            antutu:1955043
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 S24 울트라",
            chip:"Snapdragon 8 Gen 3 OC",
            score3d:2102,
            antutu:2195161
        },

        {
            brand:"apple",
            name:"🍎 iPhone 12 Pro Max",
            chip:"Apple A14",
            score3d:2128,
            antutu:1239402
        },

        {
            brand:"apple",
            name:"🍎 iPhone 12 Pro",
            chip:"Apple A14",
            score3d:2082,
            antutu:1220679
        },

        {
            brand:"apple",
            name:"🍎 iPhone 12 Mini",
            chip:"Apple A14",
            score3d:2034,
            antutu:1170000
        },

        {
            brand:"apple",
            name:"🍎 iPhone 12",
            chip:"Apple A14",
            score3d:2031,
            antutu:1180000
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 S24",
            chip:"Snapdragon 8 Gen 3",
            score3d:2041,
            antutu:1902772
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 Z 폴드6",
            chip:"Snapdragon 8 Gen 3",
            score3d:2024,
            antutu:1770000
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 S23+",
            chip:"Snapdragon 8 Gen 2",
            score3d:1919,
            antutu:1660000
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 Z 폴드5",
            chip:"Snapdragon 8 Gen 2",
            score3d:1914,
            antutu:1610000
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 S23 울트라",
            chip:"Snapdragon 8 Gen 2 OC",
            score3d:1907,
            antutu:1684419
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 S23",
            chip:"Snapdragon 8 Gen 2 OC",
            score3d:1871,
            antutu:1656561
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 Z 플립6",
            chip:"Snapdragon 8 Gen 3",
            score3d:1815,
            antutu:2130000
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 Z 플립5",
            chip:"Snapdragon 8 Gen 2",
            score3d:1772,
            antutu:1580000
        },

        {
            brand:"apple",
            name:"🍎 iPhone 11 Pro Max",
            chip:"Apple A13 Bionic",
            score3d:1720,
            antutu:930000
        },

        {
            brand:"apple",
            name:"🍎 iPhone 11 Pro",
            chip:"Apple A13 Bionic",
            score3d:1706,
            antutu:920000
        },

        {
            brand:"apple",
            name:"🍎 iPhone 11",
            chip:"Apple A13 Bionic",
            score3d:1704,
            antutu:910000
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 Z 폴드4",
            chip:"Snapdragon 8+ Gen 1",
            score3d:1685,
            antutu:1100000
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 Z 플립4",
            chip:"Snapdragon 8+ Gen 1",
            score3d:1546,
            antutu:1050000
        },

        {
            brand:"samsung",
            name:"🟦 삼성 갤럭시 S23 FE",
            chip:"Exynos 2200",
            score3d:1530,
            antutu:1250000
        }

    ];

    function updatePhoneSelect(selectId,brand){

        const select =
            document.getElementById(selectId);

        select.innerHTML = `

        <option value="">

            핸드폰 선택

        </option>

    `;

        const filtered =
            phones.filter(
                phone=>phone.brand===brand
            );

        filtered.forEach(phone=>{

            select.innerHTML += `

            <option value="${phone.name}">

                ${phone.name}

            </option>

        `;
        });
    }

    function changeLeftBrand(brand){

        updatePhoneSelect(
            "leftPhoneSelect",
            brand
        );
    }

    function changeRightBrand(brand){

        updatePhoneSelect(
            "rightPhoneSelect",
            brand
        );
    }

    function createSpec(phone){

        const percent3d =
            phone.score3d / 40;

        const percentAntutu =
            phone.antutu / 40000;

        const color =
            phone.brand === "apple"

                ? `linear-gradient(
            90deg,
            #60a5fa,
            #ffffff,
            #93c5fd,
            #dbeafe
           )`

                : `linear-gradient(
            90deg,
            #7c3aed,
            #00d4ff,
            #a855f7,
            #38bdf8
           )`;

        return `

    <div class="spec-name">

        ${phone.name}

    </div>

    <div class="spec-chip">

        ${phone.chip}

    </div>

    <div class="score-box">

        <div class="score-title">

            3DMark Score

        </div>

        <div class="score">

            ${phone.score3d}

        </div>

        <div class="bar">

            <div class="fill"
                 style="
                 width:${percent3d}%;
                 background:${color};
                 ">

            </div>

        </div>

    </div>

    <div class="score-box">

        <div class="score-title">

            AnTuTu Score

        </div>

        <div class="score">

            ${phone.antutu.toLocaleString()}

        </div>

        <div class="bar">

            <div class="fill"
                 style="
                 width:${percentAntutu}%;
                 background:${color};
                 ">

            </div>

        </div>

    </div>

    `;
    }

    function compareScores(){

        const leftName =
            document.getElementById(
                "leftPhoneSelect"
            ).value;

        const rightName =
            document.getElementById(
                "rightPhoneSelect"
            ).value;

        if(!leftName || !rightName){

            return;
        }

        const leftPhone =
            phones.find(
                p=>p.name===leftName
            );

        const rightPhone =
            phones.find(
                p=>p.name===rightName
            );

        const higher3D =
            leftPhone.score3d >
            rightPhone.score3d

                ? leftPhone

                : rightPhone;

        const lower3D =
            leftPhone.score3d >
            rightPhone.score3d

                ? rightPhone

                : leftPhone;

        const percent3D =
            (
                (
                    higher3D.score3d -
                    lower3D.score3d
                )
                /
                lower3D.score3d
            ) * 100;

        const higherAntutu =
            leftPhone.antutu >
            rightPhone.antutu

                ? leftPhone

                : rightPhone;

        const lowerAntutu =
            leftPhone.antutu >
            rightPhone.antutu

                ? rightPhone

                : leftPhone;

        const percentAntutu =
            (
                (
                    higherAntutu.antutu -
                    lowerAntutu.antutu
                )
                /
                lowerAntutu.antutu
            ) * 100;

        document.getElementById(
            "compareResult"
        ).innerHTML = `

    <div class="compare-result-box">

        <div class="compare-title">

            Benchmark Compare

        </div>

        🧊 3DMark

        <br><br>

        <span class="compare-highlight">

            ${higher3D.name}

        </span>

        <br>

        ${percent3D.toFixed(1)}%

        더 높음

        <br><br><br>

        🔥 AnTuTu

        <br><br>

        <span class="compare-highlight">

            ${higherAntutu.name}

        </span>

        <br>

        ${percentAntutu.toFixed(1)}%

        더 높음

    </div>

    `;
    }

    function selectLeftPhone(name){

        const phone =
            phones.find(
                p=>p.name===name
            );

        document.getElementById(
            "leftEmpty"
        ).style.display = "none";

        document.getElementById(
            "leftSpec"
        ).innerHTML =
            createSpec(phone);

        compareScores();
    }

    function selectRightPhone(name){

        const phone =
            phones.find(
                p=>p.name===name
            );

        document.getElementById(
            "rightEmpty"
        ).style.display = "none";

        document.getElementById(
            "rightSpec"
        ).innerHTML =
            createSpec(phone);

        compareScores();
    }

</script>

</body>

</html>