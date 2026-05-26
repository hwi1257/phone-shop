<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="UTF-8">

  <title>Phone Price</title>

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
              rgba(255,140,0,0.28),
              transparent 30%),

              radial-gradient(circle at bottom right,
              rgba(255,0,140,0.25),
              transparent 30%),

              #050816;
    }

    .window{

      width:900px;
      height:560px;

      border-radius:22px;

      overflow:hidden;

      background:
              rgba(12,12,16,0.88);

      backdrop-filter:
              blur(30px);

      border:
              1px solid rgba(255,255,255,0.08);

      box-shadow:
              0 40px 100px rgba(0,0,0,0.65);
    }

    .topbar{

      width:100%;
      height:54px;

      background:
              rgba(255,255,255,0.03);

      border-bottom:
              1px solid rgba(255,255,255,0.06);

      display:flex;

      align-items:center;

      padding:0 18px;
    }

    .dots{

      display:flex;

      gap:10px;
    }

    .dot{

      width:13px;
      height:13px;

      border-radius:50%;
    }

    .red{
      background:#ff5f57;
    }

    .yellow{
      background:#ffbd2f;
    }

    .green{
      background:#28c840;
    }

    .back-btn{

      margin-left:20px;

      padding:8px 16px;

      border:none;

      border-radius:12px;

      background:
              rgba(255,255,255,0.08);

      color:white;

      font-size:14px;

      cursor:pointer;
    }

    .content{

      display:flex;

      height:calc(100% - 54px);
    }

    .sidebar{

      width:260px;

      border-right:
              1px solid rgba(255,255,255,0.06);

      padding:30px 20px;

      overflow-y:auto;
    }

    .logo{

      color:white;

      font-size:26px;

      font-weight:700;

      margin-bottom:40px;
    }

    .select{

      width:100%;

      padding:14px;

      border:none;

      border-radius:16px;

      margin-bottom:18px;

      background:
              rgba(255,255,255,0.06);

      color:white;

      font-size:15px;

      outline:none;
    }

    .select option{

      background:#111827;
    }

    .main{

      flex:1;

      display:flex;

      justify-content:center;
      align-items:center;

      padding:20px;
    }

    .placeholder{

      color:
              rgba(255,255,255,0.28);

      font-size:34px;

      font-weight:700;
    }

    .card{

      width:380px;

      max-height:500px;

      overflow:hidden;

      padding:28px;

      border-radius:28px;

      background:
              rgba(255,255,255,0.05);

      border:
              1px solid rgba(255,255,255,0.06);

      color:white;

      text-align:center;
    }

    .phone-image{

      width:180px;
      height:180px;

      object-fit:contain;

      margin-bottom:18px;
    }

    .phone-name{

      font-size:26px;

      font-weight:700;

      margin-bottom:18px;
    }

    .price-label{

      color:
              rgba(255,255,255,0.6);

      margin-bottom:10px;
    }

    .price{

      font-size:42px;

      font-weight:800;

      color:#00d4ff;
    }

    .loading{

      color:white;

      font-size:18px;
    }

    .ai-result{

      margin-top:20px;

      line-height:1.8;

      font-size:16px;

      white-space:pre-wrap;

      text-align:left;

      max-height:180px;

      overflow-y:auto;
    }

  </style>

</head>

<body>

<div class="window">

  <div class="topbar">

    <div class="dots">

      <div class="dot red"></div>
      <div class="dot yellow"></div>
      <div class="dot green"></div>

    </div>

    <button class="back-btn"
            onclick="location.href='home.jsp'">

      ← Home

    </button>

  </div>

  <div class="content">

    <div class="sidebar">

      <div class="logo">

        Price Finder

      </div>

      <select class="select"
              onchange="changeBrand(this.value)">

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

      <select class="select"
              id="phoneSelect"
              onchange="selectPhone(this.value)">

        <option value="">
          핸드폰 선택
        </option>

      </select>



      <textarea
              id="styleInput"
              class="select"
              placeholder="원하는 스타일 입력"
              style="height:120px;resize:none;"></textarea>

      <button
              onclick="recommendPhone(event)"
              class="select"
              style="
              cursor:pointer;
              background:
              linear-gradient(
              90deg,
              #00d4ff,
              #a855f7
              );
              ">

        AI 추천 받기

      </button>

    </div>

    <div class="main">

      <div class="placeholder"
           id="result">

        Select Phone

      </div>

    </div>

  </div>

</div>

<script>

  const phones = [

    // Apple

    {
      brand:"apple",
      name:"iPhone 17 Pro Max 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 17 Pro 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 17 Air 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 16 Pro Max 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 16 Pro 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 16 Plus 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 16 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 15 Pro Max 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 15 Pro 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 15 Plus 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 15 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 14 Pro Max 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 14 Pro 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 14 Plus 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 14 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 13 Pro Max 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 13 Pro 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 13 mini 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 13 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 12 Pro Max 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 12 Pro 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 12 mini 자급제"
    },

    {
      brand:"apple",
      name:"iPhone 12 자급제"
    },



    // Samsung S Series

    {
      brand:"samsung",
      name:"갤럭시 S26 울트라 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 S26 플러스 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 S26 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 S25 울트라 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 S25 플러스 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 S25 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 S24 울트라 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 S24 플러스 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 S24 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 S23 울트라 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 S23 플러스 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 S23 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 S22 울트라 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 S22 플러스 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 S22 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 S21 울트라 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 S21 플러스 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 S21 자급제"
    },



    // Samsung Fold

    {
      brand:"samsung",
      name:"갤럭시 Z 폴드7 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 Z 폴드6 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 Z 폴드5 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 Z 폴드4 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 Z 폴드3 자급제"
    },



    // Samsung Flip

    {
      brand:"samsung",
      name:"갤럭시 Z 플립7 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 Z 플립6 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 Z 플립5 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 Z 플립4 자급제"
    },

    {
      brand:"samsung",
      name:"갤럭시 Z 플립3 자급제"
    }

  ];

  function changeBrand(brand){

    const select =
            document.getElementById(
                    "phoneSelect"
            );

    select.innerHTML =
            `<option value="">
                핸드폰 선택
             </option>`;

    phones
            .filter(
                    p=>p.brand===brand
            )

            .forEach(phone=>{

              select.innerHTML +=

                      `<option value="${phone.name}">
                            ${phone.name}
                       </option>`;
            });
  }

  async function selectPhone(name){

    document.getElementById(
            "result"
    ).innerHTML =

            `<div class="loading">
                가격 불러오는 중...
             </div>`;

    try{

      const response =
              await fetch(
                      `price?query=${
                              encodeURIComponent(name)
                      }`
              );

      const data =
              await response.json();

      if(
              data.items &&
              data.items.length > 0
      ){

        const item =
                data.items[0];

        const price =
                Number(item.lprice)
                        .toLocaleString();

        document.getElementById(
                "result"
        ).innerHTML =

                `<div class="card">

                    <img
                        class="phone-image"
                        src="${item.image}">

                    <div class="phone-name">
                        ${name}
                    </div>

                    <div class="price-label">
                        네이버 최저가
                    </div>

                    <div class="price">
                        ₩${price}
                    </div>

                </div>`;
      }

    }catch(e){

      console.log(e);

      document.getElementById(
              "result"
      ).innerHTML =

              `<div class="loading">
                    가격 조회 실패
               </div>`;
    }
  }

  async function recommendPhone(event){

    const button =
            event.target;

    button.disabled = true;

    button.innerText =
            "AI 분석 중...";

    const budget = "제한 없음";

    const style =
            document.getElementById(
                    "styleInput"
            ).value;

    document.getElementById(
            "result"
    ).innerHTML =

            `<div class="loading">
                AI 분석 중...
             </div>`;

    try{

      const response =
              await fetch(
                      "recommend",
                      {
                        method:"POST",

                        headers:{
                          "Content-Type":
                                  "application/x-www-form-urlencoded"
                        },

                        body:
                                `budget=${encodeURIComponent(budget)}&style=${encodeURIComponent(style)}`
                      }
              );

      const text =
              await response.text();

      let searchQuery =
              text
                      .split("\n")[0]
                      .replace("추천:", "")
                      .trim();

      let imageUrl = "";

      try{

        const imageResponse =
                await fetch(
                        `price?query=${
                                encodeURIComponent(searchQuery)
                        }`
                );

        const imageData =
                await imageResponse.json();

        if(
                imageData.items &&
                imageData.items.length > 0
        ){

          imageUrl =
                  imageData.items[0].image;
        }

      }catch(e){

        console.log(e);
      }

      document.getElementById(
              "result"
      ).innerHTML =

              `<div class="card">

                    <img
                        class="phone-image"
                        src="${imageUrl}">

                    <div class="phone-name">
                        🤖 AI 추천
                    </div>

                    <div class="ai-result">
                        ${text}
                    </div>

               </div>`;

    }catch(e){

      console.log(e);

      document.getElementById(
              "result"
      ).innerHTML =

              `<div class="loading">
                    AI 추천 실패
               </div>`;
    }

    button.disabled = false;

    button.innerText =
            "AI 추천 받기";
  }

</script>

</body>

</html>