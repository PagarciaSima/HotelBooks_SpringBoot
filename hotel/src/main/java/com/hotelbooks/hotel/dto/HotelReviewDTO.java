package com.hotelbooks.hotel.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HotelReviewDTO {
	
	private Long hotelId;
    private Double averageCalification;

}
