package com.multi.personalfridge.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.personalfridge.dto.PageRequestDTO;
import com.multi.personalfridge.dto.ProductDTO;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
	//일반 상품 START -----------------------------------------------------------------------
	

	
	//일반 상품 검색/페이징
	@GetMapping("/searchProduct")
	@ResponseBody
	public Map<String, Object> getProductsBySearch(@RequestParam String category, @RequestParam String keyword, @RequestParam(defaultValue ="1") int page, @RequestParam int pageSize) {
	    Map<String, Object> parameters = new HashMap<>();
	    List<ProductDTO> products = productService.getProductsBykeywordAndPage(category, keyword, page, pageSize);
	    List<ProductDTO> productList = productService.getProductsBykeyword(category, keyword);
	    int totalProducts = productList.size();
	    int totalPages = (int) Math.ceil((double) totalProducts / pageSize); 
		if(totalPages >5) {
			totalPages = 5;
		}
	    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
										.total(totalProducts)
										.pageAmount(totalPages)
										.currentPage(page)
										.amount(pageSize)
										.build();  
	    parameters.put("products", products);
	    parameters.put("pageInfo", pageRequestDTO);
	    return parameters;
	}
	
	//일반 상품 전체/카테고리 페이징
	@GetMapping("/getProductsByCategory")
	@ResponseBody
	public Map<String, Object> getProductsByCategory(@RequestParam String category, @RequestParam int page, @RequestParam int pageSize) {
	    Map<String, Object> parameters = new HashMap<>();
	    List<ProductDTO> productList = productService.getProductsByCategory(category);
	    List<ProductDTO> products = productService.getProductsByCategoryAndPage(category, page, pageSize);
	    int totalProducts = productList.size();  
	    int totalPages = (int) Math.ceil((double) totalProducts / pageSize); 
		if(totalPages >5) {
			totalPages = 5;
		}
	    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
										.total(totalProducts)
										.pageAmount(totalPages)
										.currentPage(page)
										.amount(pageSize)
										.build();
	    parameters.put("products", products);
	    parameters.put("pageInfo", pageRequestDTO);
	    return parameters;
	}
	
	//일반 상품 END -----------------------------------------------------------------------
	

	
	
	
	//특가 상품 START -----------------------------------------------------------------------
	
	//특가 상품 검색/페이징
	@GetMapping("/searchSpecialProduct")
	@ResponseBody
	public Map<String, Object> getSpecialProductsBySearch(@RequestParam String category, @RequestParam String keyword, @RequestParam(defaultValue ="1") int page, @RequestParam int pageSize) {
	    Map<String, Object> parameters = new HashMap<>();
	    List<ProductDTO> products = productService.getSpecialProductsBykeywordAndPage(category, keyword, page, pageSize);
	    List<ProductDTO> productList = productService.getSpecialProductsBykeyword(category, keyword);
	    int totalProducts = productList.size();
	    int totalPages = (int) Math.ceil((double) totalProducts / pageSize); 
		if(totalPages >5) {
			totalPages = 5;
		}
	    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
										.total(totalProducts)
										.pageAmount(totalPages)
										.currentPage(page)
										.amount(pageSize)
										.build();
	    parameters.put("products", products);
	    parameters.put("pageInfo", pageRequestDTO);
	    return parameters;
	}
	
	//특가 상품 카테고리/페이징
	@GetMapping("/getSpecialProductsByCategory")
	@ResponseBody
	public Map<String, Object> getSpecialProductsByCategory(@RequestParam String category, @RequestParam int page, @RequestParam int pageSize) {
	    Map<String, Object> parameters = new HashMap<>();
		List<ProductDTO> productList = productService.getSpecialProductsByCategory(category);
	    List<ProductDTO> products = productService.getSpecialProductsByCategoryAndPage(category, page, pageSize);
	    int totalProducts = productList.size();
	    int totalPages = (int) Math.ceil((double) totalProducts / pageSize); 
		if(totalPages >5) {
			totalPages = 5;
		}
	    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
										.total(totalProducts)
										.pageAmount(totalPages)
										.currentPage(page)
										.amount(pageSize)
										.build();
	    parameters.put("products", products);
	    parameters.put("pageInfo", pageRequestDTO);
	    return parameters;
	}
	
	//특가 상품 END -----------------------------------------------------------------------
	
}
