package com.multi.personalfridge.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression.DateTime;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ShipDTO {
	private Integer ship_id;
	private String user_id;
	private String ship_code;
	private String arrive;
	private String sub_adress;
	private String now_location;
	private int go_on;
	private Date move_time;
}
