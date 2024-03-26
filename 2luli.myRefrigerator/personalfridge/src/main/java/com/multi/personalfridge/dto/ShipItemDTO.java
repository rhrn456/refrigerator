package com.multi.personalfridge.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ShipItemDTO {
	private String ship_code;
    private String user_id;
    private String arrive;
    private String sub_adress;
    private String now_location;
    private int go_on;
    private String product_name;
    private int product_quantity;
    private int special_product;
}
