package com.hotelbooks.hotel.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.hotelbooks.hotel.dto.HotelServiceDTO;

public class HotelServiceClient {

private final RestTemplate restTemplate;
	
	@Value("${microservice.services.url}")
	private String serviceUrl;
	
	public HotelServiceClient(RestTemplateBuilder builder) {
		this.restTemplate = builder.build();
	}
	
	public List<HotelServiceDTO> getHotelServices(List<Long> hotelIds) {
		// Convert Ids to String and join them comma separated
		String hotelIdsParam = hotelIds.stream().map(String::valueOf).collect(Collectors.joining(","));
		String url = serviceUrl + "/" + hotelIdsParam;
		// Third parameter = body, and fourth = type response
		ResponseEntity<List<HotelServiceDTO>> response = restTemplate.exchange(
			url,
			HttpMethod.GET,
			null,
			new ParameterizedTypeReference<List<HotelServiceDTO>>() {}
		);
		return response.getBody();
	}
}
