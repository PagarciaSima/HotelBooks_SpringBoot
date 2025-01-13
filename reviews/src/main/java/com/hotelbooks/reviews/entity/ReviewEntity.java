package com.hotelbooks.reviews.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;

@Entity
@Data
@AllArgsConstructor
public class ReviewEntity {

	@Id
	private Long hotelId;
	private String hotelName;
	private Double averageCalification;
}
