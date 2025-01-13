package com.hotelsbook.services.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hotelsbook.services.DTO.HotelServicesDTO;
import com.hotelsbook.services.response.ErrorResponse;
import com.hotelsbook.services.service.HotelService;

import lombok.AllArgsConstructor;

@CrossOrigin(origins = "http://localhost:4200/")
@RestController
@RequestMapping("/api/hotels")
@AllArgsConstructor
public class HotelServiceController {

	private static final Logger logger = LoggerFactory.getLogger(HotelService.class);

	private HotelService hotelService;
	
	@GetMapping("/services/{hotelIds}")
	public ResponseEntity<?> getHotelsServices(@PathVariable("hotelIds") String hotelIds) {
		try {
			List<HotelServicesDTO> response = hotelService.getServicesByHotels(hotelIds);
			if (response.isEmpty()) {
				return new ResponseEntity<>(new ErrorResponse(404, "No registers were found"), HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<>(response, HttpStatus.OK);
		} catch ( Exception e ) {
			ErrorResponse error = new ErrorResponse(500, "Internal server error");
			logger.error("Error in HotelServiceController " + e.getMessage());
    		return new ResponseEntity<>(error, HttpStatus.INTERNAL_SERVER_ERROR);

		}
	}
}
