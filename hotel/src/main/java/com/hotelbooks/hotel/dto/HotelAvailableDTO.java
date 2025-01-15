package com.hotelbooks.hotel.dto;

import java.util.List;

import com.hotelbooks.hotel.entity.HotelAvailable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class HotelAvailableDTO {
	
	private Long id;
    private String name;
    private Double price;
    private String description;
    private String picture;
    private String street;
    private String number;
    private String cityName;
    private List<ServiceDTO> services;
    private Double averageCalification;
    
    public HotelAvailableDTO(HotelAvailable hotel) {
        this.id = hotel.getId();
        this.name = hotel.getName();
        this.price = hotel.getPrice();
        this.description = hotel.getDescription();
        this.picture = hotel.getPicture();
        this.street = hotel.getStreet();
        this.number = hotel.getNumber();
        this.cityName = hotel.getCityName();
    }

}
