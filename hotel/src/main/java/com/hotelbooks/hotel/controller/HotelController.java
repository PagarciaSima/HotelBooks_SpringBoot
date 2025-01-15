package com.hotelbooks.hotel.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hotelbooks.hotel.dto.HotelAvailableDTO;
import com.hotelbooks.hotel.response.ErrorResponse;
import com.hotelbooks.hotel.service.HotelService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/api/hotels")
@AllArgsConstructor
public class HotelController {

	private static final Logger logger = LoggerFactory.getLogger(HotelController.class);
	
	private HotelService hotelService;
	
	@GetMapping("/available")
	public ResponseEntity<?> getAvailableHotelsWithServices(
			@RequestParam("startDate") @DateTimeFormat (iso = DateTimeFormat.ISO.DATE) Date startDate,
			@RequestParam("endDate") @DateTimeFormat (iso = DateTimeFormat.ISO.DATE) Date endDate,
			@RequestParam("cityId") Integer cityId
	) {
		try {
			logger.info("getAvailableHotelsWithServices() method called");
			List<HotelAvailableDTO> hotels = hotelService.getAvailableHotelsWithServicesAndReviews(startDate, endDate, cityId);
			
			if (hotels.isEmpty()) {
				return new ResponseEntity<>(new ErrorResponse(404, "No registers were found"), HttpStatus.NOT_FOUND);
			}
			return ResponseEntity.ok(hotels);
		} catch (Exception e) {
			logger.error("getAvailableHotelsWithServices Error: ", e.getMessage());
			return new ResponseEntity<>(new ErrorResponse(500, "Internal server error"), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
}
