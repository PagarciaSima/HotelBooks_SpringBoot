package com.hotelbooks.reviews.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.hotelbooks.reviews.dto.ReviewDTO;
import com.hotelbooks.reviews.repository.ReviewRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReviewsService {

	private  ReviewRepository repository;
	
	public List<ReviewDTO> getAverageCalifications(String hotelIds){
		List<Object[]> results = repository.findAverageCalificationsByHotel(hotelIds);
		return results.stream().map(result -> new ReviewDTO(
				((Number) result[1]).longValue(), // hotelId
				((Number) result[2]).doubleValue() // AverageReview
		)).collect(Collectors.toList());
	}
 }
