package com.hotelbooks.hotel.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class HotelAvailable {

	@Id
	private Long id;
	private String name;
	private Double price;
	private String description;
	private String picture;
	private String street;
	private String number;
	private String cityName;
	
}
