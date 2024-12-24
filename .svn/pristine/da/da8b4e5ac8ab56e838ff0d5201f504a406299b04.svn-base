package com.future.blue.sell.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.future.blue.sell.vo.AutoCompleteVO;
import com.future.blue.sell.vo.PhotoVO;
import com.future.blue.sell.vo.SellVO;
import com.future.blue.sell.web.SellController;

@Mapper
public interface ISellDAO {

	/**
	 * 판매 정보를 PRODUCTS_SELL 테이블에 저장합니다.
	 * @param sellVO 판매 정보 (판매 제목, 내용, 가격, 회원 ID, 거래 희망 장소 등 포함)
	 * @return 성공적으로 삽입된 행의 수
	 */
	public int insertSellInfo(SellVO sellVO);

	/**
	 * 사진 정보를 PRODUCT_PHOTOS 테이블에 저장합니다.
	 * @param photoVO 사진 정보 (사진 경로, 이름, 관련 제품 ID 등 포함)
	 * @return 성공적으로 삽입된 행의 수
	 */
	public int insertPhoto(PhotoVO photoVO);
	
    /**
     * 판매 상품 목록을 조회합니다.
     * @param param 조회 조건을 담은 맵 객체
     *              - query: (선택) 검색 키워드 (판매 제목에 포함된 내용 검색)
     *              - offset: 조회 시작 위치 (페이징 처리)
     *              - limit: 조회할 데이터 개수 (페이징 처리)
     * @return 판매 상품 정보 목록 (각 항목은 SellVO 객체로 매핑됨)
     *         - SELL_ID: 판매 ID
     *         - SELL_TITLE: 판매 제목
     *         - SELL_PRICE: 판매 가격
     *         - SELL_REGION: 판매 지역
     *         - CREATE_DT: 판매 등록일
     */
	public List<SellVO> selectProducts(Map<String,Object> param);
	
	/**
     * 특정 판매 상품과 연결된 첫 번째 사진 정보를 조회합니다.
     * @param sellId 조회할 판매 상품의 ID
     * @return 첫 번째 사진 정보 (PhotoVO 객체로 매핑됨)
     *         - PROD_PHOTO_ID: 상품 사진 ID
     *         - PROD_PHOTO_PATH: 상품 사진 경로
     *         - PHOTO_NAME: 사진 이름
     *         - PROD_ID: 연결된 상품 ID
     */
    public PhotoVO selectFirstPhotoBySellId(int sellId);
	
	/**
     * 상품 상세 정보를 조회합니다.
     * @param sellId 조회할 상품의 ID
     * @return ProductsSellDTO 상품 상세 정보
     */
    public SellVO selectProductDetails(int sellId);

    /**
     * 상품에 연결된 모든 사진 목록을 조회합니다.
     * @param sellId 조회할 상품의 ID
     * @return List<ProductPhotoDTO> 상품 사진 목록
     */
    public List<PhotoVO> selectProductPhotos(int sellId);
    
    public AutoCompleteVO autoText(String cropType);


    
}
