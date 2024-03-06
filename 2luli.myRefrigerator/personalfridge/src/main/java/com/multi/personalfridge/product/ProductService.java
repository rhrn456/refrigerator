package com.multi.personalfridge.product;

import java.util.List;

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
	
	public List<ProductDTO> getAllSepcialProduct() {
		
		return productMapper.getAllSepcialProduct();
	}

}
