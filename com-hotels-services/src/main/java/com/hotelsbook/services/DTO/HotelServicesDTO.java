package com.hotelsbook.services.DTO;

import java.util.List;

import com.hotelsbook.services.model.ServiceResponse;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HotelServicesDTO {

	private Long hotelId;
	private String hotelName;
	private List<ServiceResponse> services;
	
}
