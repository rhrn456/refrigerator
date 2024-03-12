package com.multi.personalfridge.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.dto.ProductDTO;

@Service
public class ProductService {

    private final ProductMapper productMapper;

    @Autowired
    public ProductService(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }
    
    
    //일반 상품---------------------------------------------------------------START
    
    //모든 상품 가져오기
    public List<ProductDTO> getAllProduct() {
    	return productMapper.getAllProduct();
    }
    
    //일반 상품 모두 페이지 보여주기
    public List<ProductDTO> getAllProductPage(int page, int pageSize) {
    	int offset = (page - 1) * pageSize;
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("pageSize", pageSize);
		parameters.put("offset", offset);
		return productMapper.getAllProductPage(parameters);
    }
    
    //일반 상품 검색 페이지 보여주기
	public List<ProductDTO> getProductsBykeywordAndPage(String keyword, int page, int pageSize) {
		int offset = (page - 1) * pageSize;
	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("keyword", keyword);
	    parameters.put("pageSize", pageSize);
	    parameters.put("offset", offset);
	    return productMapper.getProductsBykeywordAndPage(parameters);
	}
	
	//일반 상품 검색 모두 가져오기
	public List<ProductDTO> getProductsBykeyword(String keyword) {
		
		return productMapper.getProductsBykeyword(keyword);
	}
	
	//일반 상품 카테고리 페이지 보여주기
	public List<ProductDTO> getProductsByCategoryAndPage(String category, int page, int pageSize) {
	    int offset = (page - 1) * pageSize;
	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("category", category);
	    parameters.put("pageSize", pageSize);
	    parameters.put("offset", offset);
	    return productMapper.getProductsByCategoryAndPage(parameters);
	}
	
	//일반 상품 카테고리 모두 가져오기
	public List<ProductDTO> getProductsByCategory(String category) {
		
		return productMapper.getProductsByCategory(category);
	}
	
    //일반 상품---------------------------------------------------------------END
    
    
    //특가 상품---------------------------------------------------------------START
	
	 //모든 특가 상품 가져오기
	public List<ProductDTO> getAllSepcialProduct() {
		
		return productMapper.getAllSepcialProduct();
	}
	 //특가 상품 모두 보여주기
	public List<ProductDTO> getAllSepcialProductPage(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("pageSize", pageSize);
		parameters.put("offset", offset);
		return productMapper.getAllSepcialProductPage(parameters);
	}
	
	 //특가 상품 검색 페이지 보여주기
	public List<ProductDTO> getSpecialProductsBykeywordAndPage(String keyword, int page, int pageSize) {
		int offset = (page - 1) * pageSize;
	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("keyword", keyword);
	    parameters.put("pageSize", pageSize);
	    parameters.put("offset", offset);
	    return productMapper.getSpecialProductsBykeywordAndPage(parameters);
	}
	//특가 상품 검색 모두 가져오기
	public List<ProductDTO> getSpecialProductsBykeyword(String keyword) {
		
		return productMapper.getSpecialProductsBykeyword(keyword);
	}
	//특가 상품 카테고리 페이지 보여주기
	public List<ProductDTO> getSpecialProductsByCategoryAndPage(String category, int page, int pageSize) {
		 int offset = (page - 1) * pageSize;
		    Map<String, Object> parameters = new HashMap<>();
		    parameters.put("category", category);
		    parameters.put("pageSize", pageSize);
		    parameters.put("offset", offset);
		    return productMapper.getSpecialProductsByCategoryAndPage(parameters);
	}
	//특가 상품 카테고리 모두 가져오기
	public List<ProductDTO> getSpecialProductsByCategory(String category) {
		
		return productMapper.getSpecialProductsByCategory(category);
	}

	 //특가 상품---------------------------------------------------------------END
	
	//일반 상품 모두 가져오기
	public List<ProductDTO> getFullProduct() {
		
		return productMapper.getFullProduct();
	}

	//일반/특가 상품 등록
	public boolean ProductPlus(ProductDTO product) {
		try {
			productMapper.ProductPlus(product);
		return true; 
	
		}catch (Exception e) {
			e.printStackTrace();
		 return false; 
		}
	}

	//상품 삭제
	public boolean productDeletById(int product_id) {
		try {
			productMapper.productDeletById(product_id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}

	//상품 가져오기
	public ProductDTO getProductById(int product_id) {
		
		return productMapper.getProductById(product_id);
	}

	//상품 업데이트
	public void productUpdate(ProductDTO product) {
		productMapper.productUpdate(product);
	}


}
