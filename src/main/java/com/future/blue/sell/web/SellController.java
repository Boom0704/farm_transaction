package com.future.blue.sell.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.future.blue.sell.service.SellService;
import com.future.blue.sell.vo.AutoCompleteVO;
import com.future.blue.sell.vo.PhotoVO;
import com.future.blue.sell.vo.SellVO;

@Controller
public class SellController {

    @Value("#{util['kakao.api.key']}")
    private String kakaoApiKey;
	
	@Autowired
    private SellService sellService;
	
	@GetMapping("/sell/main")
	public String sellView(Model model) {

		model.addAttribute("kakaoApiKey", kakaoApiKey);
		return "sell/main";
	}
	
	/**
	 * 판매 등록 요청을 처리하는 컨트롤러 메서드입니다.
	 * 판매 정보와 업로드된 사진 파일을 처리하여 데이터베이스에 저장합니다.
	 * @param sellVO 판매 정보를 담은 객체 (폼 입력값 매핑)
	 * @param photos 업로드된 사진 파일 배열
	 * @param redirectAttributes 리다이렉트 시 성공/오류 메시지를 전달하기 위한 객체
	 * @return 리다이렉트 URL
	 */
	@PostMapping("/sell/register")
	public String registerSell(	@ModelAttribute SellVO sellVO, // 폼의 텍스트 입력값을 매핑
						        @RequestParam("imageUpload") MultipartFile[] photos, // 다중 파일 업로드 처리
						        RedirectAttributes redirectAttributes) {

	    // 1. 회원 ID 설정 (로그인된 사용자 정보가 있다고 가정)
	    sellVO.setMemId("jun"); // 실제 구현에서는 세션에서 가져오도록 수정 필요!!
	    System.out.println(photos);
	    try {
	        // 2. 판매 정보와 사진 파일 저장
	        // 서비스 계층에서 판매 정보와 사진 데이터를 처리 및 저장
	        sellService.registerSellWithPhotos(sellVO, photos);

	        // 3. 성공 메시지 설정
	        // 판매 등록 성공 메시지를 리다이렉트 시 함께 전달
	        redirectAttributes.addFlashAttribute("message", "판매 등록이 완료되었습니다!");
	        return "redirect:/"; // 메인 페이지로 리다이렉트

	    } catch (Exception e) {
	        // 4. 오류 처리
	        e.printStackTrace(); // 예외 로그 출력
	        // 판매 등록 실패 메시지를 리다이렉트 시 함께 전달
	        redirectAttributes.addFlashAttribute("error", "판매 등록 중 오류가 발생했습니다.");
	        return "redirect:/sell/main"; // 등록 페이지로 리다이렉트
	    }
	}
	
	/**
     * 특정 상품의 상세 정보와 사진 데이터를 뷰로 전달합니다.
     * 
     * @param sellId 조회할 상품 ID
     * @param model  뷰에 전달할 데이터 모델
     * @return 상품 상세 페이지 뷰 이름
     */
    @GetMapping("/products/detail")
    public String productDetail(@RequestParam("sellId") int sellId, Model model) {
        // 상품 상세 정보 가져오기
        SellVO product = sellService.getProductDetails(sellId);

        // 상품 사진 목록 가져오기
        List<PhotoVO> photos = sellService.getProductPhotos(sellId);

        PhotoVO mainPhoto = null; // 메인 이미지
        List<PhotoVO> photoList = new ArrayList<>(); // 나머지 이미지 리스트

        if (!photos.isEmpty()) {
            // 첫 번째 이미지를 메인 이미지로 설정
            mainPhoto = photos.get(0);
            // 나머지 이미지를 이미지 리스트로 설정
            photoList = photos.subList(1, photos.size());
        }

        // 뷰로 전달할 데이터 추가
        model.addAttribute("kakaoApiKey", kakaoApiKey);
        model.addAttribute("product", product); // 상품 상세 정보
        model.addAttribute("mainPhoto", mainPhoto); // 메인 이미지
        model.addAttribute("photoList", photoList); // 나머지 이미지 리스트

        return "purchase/detail"; // 상품 상세 페이지 뷰 이름
    }
    
    
    
    // 현재 테스트용: 이미지 없이 cropType 파라미터로 자동완성 확인
    @PostMapping("/autoComplete")
    @ResponseBody
    public Map<String, String> autoCompleteByCrop(@RequestParam("cropType") String cropType) {
        AutoCompleteVO ac = sellService.getAutoComplete(cropType);

        Map<String, String> result = new HashMap<>();
        if (ac != null) {
            result.put("cropType", ac.getCropType());
            result.put("saleTitle", ac.getSaleTitle());
            result.put("saleContent", ac.getSaleContent());
        } else {
            result.put("error", "No data found for cropType: " + cropType);
        }
        return result;
    }

    // 나중에 이미지 분류 구현 시 사용할 메서드 - 현재는 주석 처리
    @PostMapping(value="/autoCompleteByImage", produces=MediaType.APPLICATION_JSON_VALUE)
    public Map<String, String> autoCompleteByImage(@RequestParam("image") MultipartFile imageFile) {
        Map<String, String> result = new HashMap<>();
        
        // 추후 이미지 분류 로직 구현 (현재는 주석 처리)
        /*
        String cropType = imageClassifier.classify(imageFile); // 추후 구현 예정
        AutoComplete ac = service.getAutoCompleteByCropType(cropType);
        if (ac != null) {
            result.put("cropType", ac.getCropType());
            result.put("saleTitle", ac.getSaleTitle());
            result.put("saleContent", ac.getSaleContent());
        } else {
            result.put("error", "No data found for cropType: " + cropType);
        }
        */

        // 지금은 테스트용으로 고정 cropType 사용 (이미지 없이 동작 확인)
        String mockCrop = "고구마"; // 테스트용 하드코딩
        AutoCompleteVO ac = sellService.getAutoComplete(mockCrop);
        if (ac != null) {
            result.put("cropType", ac.getCropType());
            result.put("saleTitle", ac.getSaleTitle());
            result.put("saleContent", ac.getSaleContent());
        } else {
            result.put("error", "No data found for cropType: " + mockCrop);
        }

        return result;
    }
	
	
	
}
