package com.hotelbooks.hotel.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HotelServiceDTO {
	
	private Long hotelId;
    private String hotelName;
    private List<ServiceDTO> services;

}
