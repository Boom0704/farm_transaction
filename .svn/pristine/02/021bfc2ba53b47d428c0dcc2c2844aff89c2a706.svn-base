package com.future.blue.market.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.future.blue.market.service.FlaskClient;

@Controller
public class PredictionController {
    @Autowired
    private FlaskClient flaskClient;

    // 사용자 입력값 처리 추가
    @RequestMapping(value = "/getPrediction", method = RequestMethod.POST)
    public String getPrediction(
            @RequestParam("prceRegYmd") String prceRegYmd,
            @RequestParam("pdltCtgCode") String pdltCtgCode,
            @RequestParam("pdltCode") String pdltCode,
            Model model) {

        // Flask 서버로 전달할 데이터 구성
        Map<String, Object> requestData = new HashMap<>();
        requestData.put("prceRegYmd", prceRegYmd);   // 예측 대상 날짜
        requestData.put("pdltCtgCode", pdltCtgCode); // 품목 카테고리 코드
        requestData.put("pdltCode", pdltCode);       // 품목 코드

        // Flask 서버 호출 및 결과 받기
        String predictionResult = flaskClient.getPrediction(requestData);

        // 결과를 모델에 추가하여 JSP에 전달
        model.addAttribute("prediction", predictionResult);

        // 결과를 표시할 JSP 파일 이름 반환
        return "predictionResultPage"; // 예측 결과 페이지
    }

    // 최근 가격을 표시하는 페이지로 이동
    @RequestMapping("/showPricePage")
    public String showPricePage(Model model) {
        String recentPrice = "1000"; // 예시 값 (여기서는 예시로 1000원을 사용)
        model.addAttribute("recentPrice", recentPrice);
        return "predictionForm";  // JSP 파일 이름
    }
}
