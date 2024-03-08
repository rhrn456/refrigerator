package com.multi.personalfridge.refrigerator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.dto.RefrigeratorProdcutDTO;

@Service
public class RefrigeratorService {

	@Autowired
	RefrigeratorMapper refrigeratorMapper;

	public int getRefrigeratorId(String userId) {
		return refrigeratorMapper.getRefrigeratorId(userId);		
	}

	public List<RefrigeratorProdcutDTO> getRefrigeratorProduct(int refrigeratorId) {
		return refrigeratorMapper.getRefrigeratorProduct(refrigeratorId);
	}

	public boolean insertRefrigeratorProdcut(RefrigeratorProdcutDTO refrigeratorProdcut) {
		int result = refrigeratorMapper.insertRefrigeratorProdcut(refrigeratorProdcut);
		return result == 0 ? false : true;
	}

	public boolean deleteRefrigeratorProduct(int refrigeratorProductId) {
		int result = refrigeratorMapper.deleteRefrigeratorProduct(refrigeratorProductId);
		return result == 0 ? false : true;
	}

	public boolean updateRefrigeratorProduct(RefrigeratorProdcutDTO refrigeratorProdcut) {
		int result = refrigeratorMapper.updateRefrigeratorProduct(refrigeratorProdcut);
		return result == 0 ? false : true;
	}
	
	
}
