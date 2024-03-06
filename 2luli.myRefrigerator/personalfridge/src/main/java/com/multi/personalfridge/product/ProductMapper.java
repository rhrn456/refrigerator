package com.multi.personalfridge.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.ProductDTO;

@Mapper
public interface ProductMapper {

	List<ProductDTO> getAllSepcialProduct();
	
}
