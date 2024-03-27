package com.multi.personalfridge.dto;

import java.sql.Date;

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
public class MileageDTO {

	private String user_id;
	private Integer mileage;
	private Date mileage_earned_date;
	private Date mileage_expiration_date;
}
