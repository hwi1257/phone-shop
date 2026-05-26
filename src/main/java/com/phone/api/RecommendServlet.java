package com.phone.api;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/recommend")
public class RecommendServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String budget = request.getParameter("budget");
        String style = request.getParameter("style");

        try {
            // 1. 현재 연도 및 예산 조건부 처리 동적 바인딩
            int currentYear = java.time.LocalDate.now().getYear();

            String budgetDisplay = (budget == null || budget.trim().isEmpty() || "0".equals(budget.trim()))
                    ? "제한 없음"
                    : budget + "원";

            String apiKey = "AIzaSyBcv1lUoGa6jzMH86YzWbYRJTU-JOvo2H0";

            URL url = new URL(
                    "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-pro:generateContent?key="
                            + apiKey
            );

            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json");
            con.setDoOutput(true);

            // 2. 현실적인 추천 감각(눈치 룰)을 추가한 프롬프트
            String prompt = "# Role & Persona\n"
                    + "당신은 대한민국 모바일 시장의 자급제 가격 추이와 스마트폰 스펙을 완벽하게 꿰고 있는 '수석 스마트폰 전문 큐레이터'입니다. 오직 데이터와 논리에 기반하여 사용자에게 가장 완벽한 기기를 추천합니다.\n\n"

                    + "# Environment Context\n"
                    + "- 현재 연도: " + currentYear + "년\n"
                    + "- 시장 기준: 대한민국 정식 출시 자급제(공식 출고가 및 현재 자급제 평균 유통가 기준)\n\n"

                    + "# Inputs\n"
                    + "- 사용자 예산: " + budgetDisplay + "\n"
                    + "- 사용자 스타일(목적/신분): " + style + "\n\n"

                    + "# Recommendation Logic & Priority\n"
                    + "추천 기종을 선정할 때 반드시 아래 우선순위 로직을 거쳐야 합니다.\n"
                    + "1. [실재 기기 필터 - 최우선]: 대한민국 시장에 '이미 정식 출시가 완료되어 실제로 구매 가능한 기기'만 추천해야 합니다. 출시 예정, 루머 기기(예: iPhone SE4 등)는 절대 추천하지 마십시오.\n"
                    + "2. [예산 및 유저 상황 필터 - 중요]: 제시된 예산 금액을 초과하는 기기는 절대 추천하지 않는다. 만약 예산이 '제한 없음'이더라도, 사용자 스타일(목적)에 '학생', '인강', '가성비', '효도' 등의 키워드가 포함되어 있다면 현실적인 경제성을 고려해야 합니다. 이때는 무조건 가장 비싼 초고가 모델(Pro Max, Ultra 등)을 피하고, 합리적인 가격대의 최신 기종(최신 일반형 모델, FE 시리즈, 고성능 A 시리즈 등)을 우선적으로 추천하십시오.\n"
                    + "3. [세대 최신성 필터]: 위 조건을 만족하는 기기 중 '가장 최근에 출시된 세대의 모델'을 선택한다.\n"
                    + "4. [스타일 매칭]: 사용자의 목적(" + style + ")에 가장 특화된 핵심 스펙을 매칭한다. 단, 고사양 게임이 목적이 아니라면 학생에게 과도한 스펙의 폰은 추천하지 않는다.\n\n"

                    + "# Strict Output Format\n"
                    + "반드시 아래의 출력 형식을 칼같이 준수하십시오. 이를 어길 시 시스템 에러가 발생합니다.\n"
                    + "- 첫 줄: 오직 정확한 공식 모델명만 출력 (자급제 접미사 포함, 특수문자/수식어/인사말 절대 금지)\n"
                    + "- 두 번째 줄 이하: 추천 이유를 핵심만 담아 2~7문장 이내로 간결하게 설명 (줄바꿈 없이 이어서 작성)\n\n"
                    + "- 일곱 번째 줄 이하: 핸드폰의 디스플레이 스펙 배터리 스펙 프로세서 스펙을 설명 (줄바꿈 없이 이어서 작성)\n\n"

                    + "# Negative Constraints (절대 금지 사항)\n"
                    + "- 존재하지 않는 가상의 모델이나 루머 단계의 스마트폰은 추천하지 않는다.\n"
                    + "- \"안녕하세요\", \"추천해 드리겠습니다\" 등의 인사말이나 서론, 결론은 일절 출력하지 않는다.\n\n"

                    + "# Correct Output Example\n"
                    + "갤럭시 S24 자급제\n"
                    + "최신 플래그십 성능을 갖추고 있으면서도 크기가 컴팩트하여 휴대성이 좋습니다. 가격 대 성능비가 뛰어나 학생들의 학습 및 일상용으로 가장 적합한 최신 모델입니다.";

            JSONObject text = new JSONObject();
            text.put("text", prompt);

            JSONArray parts = new JSONArray();
            parts.put(text);

            JSONObject content = new JSONObject();
            content.put("parts", parts);

            JSONArray contents = new JSONArray();
            contents.put(content);

            JSONObject body = new JSONObject();
            body.put("contents", contents);

            OutputStream os = con.getOutputStream();
            os.write(body.toString().getBytes("UTF-8"));
            os.flush();
            os.close();

            BufferedReader br;
            if (con.getResponseCode() == 200) {
                br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
            } else {
                br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
            }

            String inputLine;
            StringBuilder result = new StringBuilder();
            while ((inputLine = br.readLine()) != null) {
                result.append(inputLine);
            }
            br.close();

            System.out.println(result.toString());

            JSONObject json = new JSONObject(result.toString());
            String answer = "AI 응답 실패";

            if (json.has("candidates")) {
                answer = json
                        .getJSONArray("candidates")
                        .getJSONObject(0)
                        .getJSONObject("content")
                        .getJSONArray("parts")
                        .getJSONObject(0)
                        .getString("text");
            }

            response.setContentType("text/plain;charset=UTF-8");
            response.getWriter().write(answer);

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/plain;charset=UTF-8");
            response.getWriter().write(e.toString());
        }
    }
}