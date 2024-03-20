package com.multi.personalfridge.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.CartDTO;

@Mapper
public interface CartMapper {

	boolean insertCart(CartDTO product);

	List<CartDTO> getCartProducts(String user_id);

	int getCartCount(String user_id);

}
