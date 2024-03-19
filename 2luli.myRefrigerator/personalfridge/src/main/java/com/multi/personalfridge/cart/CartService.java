package com.multi.personalfridge.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.dto.CartDTO;
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

	public List<CartDTO> getCartProducts(String user_id) {
		// TODO Auto-generated method stub
		return cartMapper.getCartProducts(user_id);
	}
}
