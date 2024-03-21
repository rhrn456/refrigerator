package com.multi.personalfridge.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.dto.CartDTO;
import com.multi.personalfridge.dto.CartProductDTO;
import com.multi.personalfridge.dto.RecipeProductDTO;

@Service
public class CartService {

	@Autowired
	CartMapper cartMapper;

	public boolean insertCart(CartDTO product) {
		
		boolean result = cartMapper.insertCart(product);
		if(result) {
			return true;
		}
		return false;
	}

	public List<CartProductDTO> getCartProducts(String user_id) {
	
		return cartMapper.getCartProducts(user_id);
	}

	public int getCartCount(String user_id) {
		
		return cartMapper.getCartCount(user_id);
	}

	public boolean buyProduct(CartDTO product) {
		boolean result = cartMapper.buyProduct(product);
		if(result) {
			return true;
		}
		return false;
	}

	public void removeCartItem(int product_id, String user_id) {
		Map<String, Object> params = new HashMap<>();
		params.put("product_id", product_id);
		params.put("user_id", user_id);
		cartMapper.removeCartItem(params);
		
	}


}
