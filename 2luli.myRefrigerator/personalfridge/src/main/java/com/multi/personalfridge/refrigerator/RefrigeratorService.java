package com.multi.personalfridge.refrigerator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.dto.RefrigeratorProdcutDTO;

@Service
public class RefrigeratorService {

	@Autowired
	RefrigeratorMapper refrigeratorMapper;

	public Integer getRefrigeratorId(String userId) {
		return refrigeratorMapper.getRefrigeratorId(userId);		
	}

	public List<RefrigeratorProdcutDTO> getRefrigeratorProduct(int refrigeratorId) {
		return refrigeratorMapper.getRefrigeratorProduct(refrigeratorId);
	}

	public boolean insertRefrigeratorProdcut(RefrigeratorProdcutDTO refrigeratorProdcut) {
		int result = refrigeratorMapper.insertRefrigeratorProdcut(refrigeratorProdcut);
		return result == 0 ? false : true;
	}
	
	public boolean insertRefrigerator(String user_id) {
		int result = refrigeratorMapper.insertRefrigerator(user_id);
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

	public RefrigeratorProdcutDTO getRefrigeratorProductByRefrigeratorProductId(int refrigeratorProductId) {
		// TODO Auto-generated method stub
		return refrigeratorMapper.getRefrigeratorProductByRefrigeratorProductId(refrigeratorProductId);
	}

	public List<RefrigeratorProdcutDTO> getRefrigeratorProductForEach(Integer refrigeratorId, int page) {
		// TODO Auto-generated method stub
		return refrigeratorMapper.getRefrigeratorProductForEach(refrigeratorId,page);
	}
	
	
}
