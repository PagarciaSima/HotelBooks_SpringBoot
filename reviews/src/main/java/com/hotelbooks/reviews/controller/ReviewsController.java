package com.hotelbooks.reviews.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hotelbooks.reviews.dto.ReviewDTO;
import com.hotelbooks.reviews.response.ErrorResponse;
import com.hotelbooks.reviews.service.ReviewsService;

@CrossOrigin(origins = "http://localhost:4200/")
@RestController
@RequestMapping("/api/hotels")
public class ReviewsController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewsController.class);
	
	@Autowired
	private ReviewsService reviewsService;
	
	@GetMapping("/reviews/{hotelIds}")
	public ResponseEntity<?> getAverageCalifications(@PathVariable("hotelIds") String hotelIds) {
		try {
			logger.info(hotelIds);
			List<ReviewDTO> response = reviewsService.getAverageRatings(hotelIds);
			if (response.isEmpty()) {
				return new ResponseEntity<>(new ErrorResponse(404, "No registers were found"), HttpStatus.NOT_FOUND);
			}
			return ResponseEntity.ok(response);
		} catch (Exception e) {
			ErrorResponse error = new ErrorResponse(500, "Internal server error");
			return new ResponseEntity<> (error, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
}
