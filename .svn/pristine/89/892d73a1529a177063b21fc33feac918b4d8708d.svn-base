package com.future.blue;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.future.blue.product.service.ProductService;
import com.future.blue.product.vo.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
    private ProductService prodService;
	
	//private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "home";
//	}
	
	/**
	 * 메인페이지 상품 목록 로딩 (처음 20개 데이터를 조회하여 렌더링)
	 * @param query (선택) 검색 키워드
	 * @param model 모델 객체로 조회된 상품 목록과 검색 키워드를 전달
	 * @return 상품 목록 페이지 뷰 이름 ("products")
	 */
	@GetMapping("/")
	public String products(@RequestParam(value="query", required=false) String query, Model model) {
	    // 처음 20개의 상품 목록 조회
	    List<ProductVO> productList = prodService.getProductsWithPhoto(query, 0, 8);   // 8개의 이미지출력
	    model.addAttribute("productList", productList); // 상품 목록 전달
	    model.addAttribute("query", query); // 검색 키워드 전달
	    return "home"; // 메인페이지
	}

	/**
	 * 더보기 AJAX 요청 처리 (추가 상품 목록을 조회하여 반환)
	 * @param query (선택) 검색 키워드
	 * @param offset 추가로 조회를 시작할 위치
	 * @return JSON 형식으로 추가된 상품 목록 반환
	 */
	@GetMapping("/more")
	@ResponseBody
	public List<ProductVO> loadMoreProducts(@RequestParam(value="query", required=false) String query,
	                                     @RequestParam("offset") int offset) {
	    // offset부터 4개의 상품 목록 조회
	    List<ProductVO> productList = prodService.getProductsWithPhoto(query, offset, 4);
	    return productList; // JSON으로 반환
	}
	
}
