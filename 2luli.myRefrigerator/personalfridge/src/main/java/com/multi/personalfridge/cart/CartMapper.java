package com.multi.personalfridge.cart;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.CartDTO;
import com.multi.personalfridge.dto.CartProductDTO;

@Mapper
public interface CartMapper {

	boolean insertCart(CartDTO product);

	List<CartProductDTO> getCartProducts(String user_id);

	int getCartCount(String user_id);

	boolean buyProduct(CartDTO product);

	void removeCartItem(Map params);

}
