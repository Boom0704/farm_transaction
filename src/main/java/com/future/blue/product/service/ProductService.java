package com.future.blue.product.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.future.blue.common.web.FileController;
import com.future.blue.product.dao.IProductDAO;
import com.future.blue.product.vo.AutoCompleteVO;
import com.future.blue.product.vo.PhotoVO;
import com.future.blue.product.vo.ProductVO;

@Service
public class ProductService {
	
	@Autowired
	private IProductDAO ProdDAO;
	
	@Autowired
    private FileController fileController; // FileController 사용

	/**
	 * 판매 정보와 사진 정보를 함께 등록합니다.
	 * @param prodVO 판매 정보 (판매 제목, 내용, 가격, 회원 ID, 거래 희망 장소 등 포함)
	 * @param photos 업로드된 사진 파일 배열
	 * @throws IOException 파일 업로드 중 오류가 발생한 경우
	 */
	@Transactional
	public void registerProdWithPhotos(ProductVO prodVO, MultipartFile[] photos) throws IOException {
	    // 1. 판매 정보 저장
	    // prodVO 객체를 이용해 PRODUCTS_SELL 테이블에 판매 정보를 삽입합니다.
	    ProdDAO.insertProdInfo(prodVO);
	    // 2. 사진 정보 저장
	    // 업로드된 MultipartFile 배열을 순회하며 각 사진 정보를 PRODUCT_PHOTOS 테이블에 저장합니다.
	    for (MultipartFile photo : photos) {
	        if (!photo.isEmpty()) { // 비어 있는 파일이 아닌 경우만 처리
	            // 업로드된 파일을 서버에 저장
	            String uploadedFilePath = fileController.uploadSingleFile(photo);
	            
	            // PhotoVO 객체 생성
	            PhotoVO photoVO = new PhotoVO();
	            photoVO.setProdId(prodVO.getProdId()); // 방금 생성된 SELL_ID를 설정
	            photoVO.setProdPhotoPath(uploadedFilePath); // 업로드된 파일의 저장 경로 설정
	            photoVO.setPhotoName(photo.getOriginalFilename()); // 원본 파일명 설정

	            // 사진 정보 DB 삽입
	            ProdDAO.insertPhoto(photoVO);
	        }
	    }
	}
	
	/**
	 * 판매 상품 목록을 조회합니다.
	 * @param query 검색 키워드 (판매 제목에 포함된 내용 검색)
	 * @param offset 조회 시작 위치 (페이징 처리)
	 * @param limit 조회할 데이터 개수 (페이징 처리)
	 * @return 판매 상품 목록 (조건에 맞는 상품 정보 리스트)
	 */
	public List<ProductVO> getProducts(String query, int offset, int limit) {
	    // 조회 조건을 저장할 맵 생성
	    Map<String, Object> param = new HashMap<>();
	    param.put("query", query);  // 검색 키워드
	    param.put("offset", offset);  // 조회 시작 위치
	    param.put("limit", limit);  // 조회할 데이터 개수

	    // DAO를 호출하여 판매 상품 목록 조회
	    return ProdDAO.selectProducts(param);
	}
	
	
	/**
	 * 판매 상품 목록과 각 상품의 대표 사진 경로를 조회합니다.
	 * @param query 검색 키워드 (판매 제목 검색)
	 * @param offset 조회 시작 위치 (페이징 처리)
	 * @param limit 조회할 데이터 개수 (페이징 처리)
	 * @return 판매 상품 목록 (각 항목에 대표 사진 경로 포함)
	 *         - 사진이 존재하면 해당 경로와 파일명 설정
	 *         - 사진이 없으면 기본 이미지("assets/img/noimg.png")로 설정
	 */
	public List<ProductVO> getProductsWithPhoto(String query, int offset, int limit) {
	    // 판매 상품 목록 조회
	    List<ProductVO> list = getProducts(query, offset, limit);

	    // 각 상품에 대해 대표 사진 설정
	    for (ProductVO vo : list) {
	        // 판매 상품 ID로 첫 번째 사진 조회
	        PhotoVO photo = ProdDAO.selectFirstPhotoByprodId(vo.getProdId());
	        if (photo != null && photo.getProdPhotoPath() != null && photo.getPhotoName() != null) {
	            // 사진 경로와 이름 설정
	            vo.setImagePath(photo.getProdPhotoPath() + "/" + photo.getPhotoName());
	        } else {
	            // 사진이 없을 경우 기본 이미지 경로 설정
	            vo.setImagePath("assets/img/noimg.png");
	        }
	    }
	    return list;
	}
	
	/**
     * 특정 상품의 상세 정보를 조회합니다.
     * @param sellId 조회할 상품 ID
     * @return ProductsSellDTO 상품 상세 정보
     */
    public ProductVO getProductDetails(int prodId) {
        // 상품 상세 정보 가져오기
        return ProdDAO.selectProductDetails(prodId);
    }

    /**
     * 특정 상품의 사진 목록을 조회합니다.
     * @param sellId 조회할 상품 ID
     * @return List<ProductPhotoDTO> 상품 사진 목록
     */
    public List<PhotoVO> getProductPhotos(int prodId) {
        // 상품에 연결된 모든 사진 목록 가져오기
        return ProdDAO.selectProductPhotos(prodId);
    }
	
    
    public AutoCompleteVO getAutoComplete(String cropType) {
        return ProdDAO.autoText(cropType);
    }

    // 추후 이미지 분류 결과를 받아 cropType을 얻는 로직을 여기에 추가 가능
    /*
    public AutoComplete getAutoCompleteByImage(MultipartFile imageFile) {
        // 1. 이미지 분류 로직 호출 (추후 구현)
        // String cropType = imageClassifier.classify(imageFile);
        
        // 2. 분류된 cropType으로 DB 조회
        // return getAutoCompleteByCropType(cropType);
    }
    */
	

}
