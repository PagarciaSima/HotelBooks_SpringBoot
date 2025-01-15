package com.hotelbooks.hotel.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.hotelbooks.hotel.dto.HotelAvailableDTO;
import com.hotelbooks.hotel.dto.HotelReviewDTO;
import com.hotelbooks.hotel.dto.HotelServiceDTO;
import com.hotelbooks.hotel.dto.ServiceDTO;
import com.hotelbooks.hotel.entity.HotelAvailable;
import com.hotelbooks.hotel.repository.HotelRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class HotelService {

	private HotelRepository hotelRepository;
	private HotelServiceClient hotelServiceClient;
	private HotelReviewClient hotelReviewClient;
	
	public List<HotelAvailableDTO> getAvailableHotelsWithServicesAndReviews(
		Date startDate, Date endDate, Integer cityId
	) {
		
		// STEP 1: find available hotels
		List<HotelAvailable> availableHotels = hotelRepository.findAllAvailableHotelsByCity(startDate, endDate, cityId);
		
		if (availableHotels.isEmpty()) {
			return new ArrayList<>();
		} else {
			// STEP 2: Hotel Ids
			List<Long> hotelIds = availableHotels.stream().map(HotelAvailable :: getId).collect(Collectors.toList());
			// STEP 3: Consume services micro service
			List<HotelServiceDTO> hotelServices = hotelServiceClient.getHotelServices(hotelIds);
			// STEP 4: Consume reviews micro service
			List<HotelReviewDTO> hotelReviews = hotelReviewClient.getHotelReviews(hotelIds);
			// STEP 5: Combine results
			Map<Long, List<ServiceDTO>> servicesByHotelId = hotelServices.stream()
					.collect(Collectors.toMap(HotelServiceDTO :: getHotelId, HotelServiceDTO :: getServices));

			Map<Long, Double> reviewsByHotelId = hotelReviews.stream()
					.collect(Collectors.toMap(HotelReviewDTO :: getHotelId, HotelReviewDTO :: getAverageCalification));
			
			// STEP 6: Group and map results
			return availableHotels.stream()
					.map(hotel -> {
			            HotelAvailableDTO dto = new HotelAvailableDTO(hotel);
			            dto.setServices(servicesByHotelId.getOrDefault(hotel.getId(), Collections.emptyList()));
			            dto.setAverageCalification(reviewsByHotelId.getOrDefault(hotel.getId(), null));
			            return dto;
					}).collect(Collectors.toList());
			
		}
	}
}
