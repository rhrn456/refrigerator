package com.multi.personalfridge.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import com.multi.personalfridge.dto.ProductDTO;

@Mapper
public interface ProductMapper {

	//일반 상품 --------------------------------------------------------------START
	
	//일반 상품 모두 가져 오기
	List<ProductDTO> getAllProduct();
	
	//일반 상품 페이징
	List<ProductDTO> getAllProductPage(Map parameters);
	
	//일반 상품 검색/페이징
	List<ProductDTO> getProductsBykeywordAndPage(Map parameters);
	
	//일반 상품 검색 가져 오기
	List<ProductDTO> getProductsBykeyword(String keyword);
	
	//일반 상품 카테고리/페이징
	List<ProductDTO> getProductsByCategoryAndPage(Map parameters);
	
	//일반 상품 카테고리 가져 오기
	List<ProductDTO> getProductsByCategory(String category);
	//일반 상품 --------------------------------------------------------------END
	
	//특가 상품 --------------------------------------------------------------START
	
	//특가 상품 모두 가져 오기
	List<ProductDTO> getAllSepcialProduct();

	//특가 상품 페이징
	List<ProductDTO> getAllSepcialProductPage(Map parameters);
		
	//특가 상품 검색/페이징
	List<ProductDTO> getSpecialProductsBykeywordAndPage(Map parameters);

	//특가 상품 검색 가져 오기
	List<ProductDTO> getSpecialProductsBykeyword(String keyword);

	//특가 상품 카테고리/페이징
	List<ProductDTO> getSpecialProductsByCategoryAndPage(Map parameters);

	//특가 상품 카테고리 가져 오기
	List<ProductDTO> getSpecialProductsByCategory(String category);


	//특가 상품 --------------------------------------------------------------END

	//일반 상품 모두가져오기
	List<ProductDTO> getFullProduct();
	
	//특가/일반 삼품 등록
	int ProductPlus(ProductDTO product);

	//상품 삭제
	int productDeletById(int product_id);

	ProductDTO getProductById(int product_id);

	void productUpdate(ProductDTO product);


	
}
