package com.hotelbooks.reviews.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReviewDTO {

	private Long hotelId;
	private Double averageCalification;
	
}
