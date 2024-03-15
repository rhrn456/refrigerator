package com.multi.personalfridge.refrigerator;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.RefrigeratorProdcutDTO;

@Mapper
public interface RefrigeratorMapper {

	Integer getRefrigeratorId(String userId);

	List<RefrigeratorProdcutDTO> getRefrigeratorProduct(int refrigeratorId);

	int insertRefrigeratorProdcut(RefrigeratorProdcutDTO refrigeratorProdcut);

	int deleteRefrigeratorProduct(int refrigeratorProductId);

	int updateRefrigeratorProduct(RefrigeratorProdcutDTO refrigeratorProdcut);

	int insertRefrigerator(String user_id);

}
