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

	private String userId;
	private Integer mileage;
	private Date mileageEarnedDate;
	private Date mileageExpirationDate;
}
